package com.lth.kaoqinsys.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.model.TCSModel;
import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.T_C_S;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ICourseService;
import com.lth.kaoqinsys.service.IStudentService;
import com.lth.kaoqinsys.service.IT_C_SService;
import com.lth.kaoqinsys.utils.Auth;
import com.lth.kaoqinsys.utils.JsonUtils;

@Controller

public class KebiaoController {
	@Resource
	IT_C_SService it_C_SService;
	@Resource
	ICourseService iCourseService;
	@Resource
	IStudentService iStudentService;
	@RequestMapping(value="/kebiao",method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Teacher teacher = Auth.getLoginTeacher(request, response);
		if (teacher != null) {
			ArrayList<T_C_S> tcsList = it_C_SService
					.getKeBiaoByTeacherId(teacher.getId());
			String currentWeekString = request.getParameter("week");
			String currentTermString = request.getParameter("term");
			String currentYearString = request.getParameter("year");
			model.addAttribute("teacher", teacher);
			HashMap<Integer, String> tcsMap = new HashMap<Integer, String>();
			HashMap<Integer, Course> courseMap = new HashMap<Integer, Course>();
			for (T_C_S tcs : tcsList) {
				tcsMap.put(tcs.getTimeMap(), JsonUtils
						.toJsonFromList(new TCSModel(tcs, iCourseService
								.selectCourseById(tcs.getCourseId()), teacher)));
				courseMap.put(tcs.getTimeMap(),
						iCourseService.selectCourseById(tcs.getCourseId()));
			}
			ArrayList<Integer> fiftyArrayList = new ArrayList<Integer>();
			for (int i = 0; i < 50; i++) {

				if (tcsMap.get(i) == null) {
					tcsMap.put(i, null);
				}
				if (courseMap.get(i) == null) {
					courseMap.put(i, null);
				}
				fiftyArrayList.add(i);
			}
			model.addAttribute("tcsMap", tcsMap);
			model.addAttribute("courseMap", courseMap);
			model.addAttribute("fiftyArrayList", fiftyArrayList);
			model.addAttribute("currentTerm", currentTermString);
			model.addAttribute("currentWeek", currentWeekString);
			model.addAttribute("currentYear", currentYearString);
			return "kebiao";
		} else {
			
			return "login";
		}
	}
	@RequestMapping("/coursedetail")
	public String courseDetail(HttpServletRequest request,HttpServletResponse response,Model model){
		int courseid;
		try {
			 courseid=Integer.parseInt(request.getParameter("courseid"));
		} catch (Exception e) {
			return "nofound";
		}
		ArrayList<T_C_S> tcslist=this.it_C_SService.getStudentByCourseId(courseid);
		ArrayList<TCSModel> tcsModels=new ArrayList<TCSModel>();
		for(T_C_S tcs: tcslist){
			tcsModels.add(new TCSModel(tcs, this.iStudentService.selectStudentByPrimaryKey(tcs.getStudentId())));
		}
		model.addAttribute("tcsModels",tcsModels);
		return "course_detail";
	}
}
