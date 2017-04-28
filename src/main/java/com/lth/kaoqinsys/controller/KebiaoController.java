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
import org.springframework.web.bind.annotation.ResponseBody;

import com.lth.kaoqinsys.model.TCSModel;
import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.T_C_S;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ICourseService;
import com.lth.kaoqinsys.service.IStudentService;
import com.lth.kaoqinsys.service.IT_C_SService;
import com.lth.kaoqinsys.utils.ActionResult;
import com.lth.kaoqinsys.utils.Auth;
import com.lth.kaoqinsys.utils.JsonUtils;

@Controller
public class KebiaoController {
	@Resource
	IT_C_SService iT_C_SService;
	@Resource
	ICourseService iCourseService;
	@Resource
	IStudentService iStudentService;

	@RequestMapping(value = "/kebiao", method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher != null) {
			ArrayList<T_C_S> tcsList = iT_C_SService
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
			model.addAttribute("message", "清先登录系统");
			model.addAttribute("jump","login");
			return "nofound";
		}
	}

	@RequestMapping("/kebiao/coursedetail")
	public String courseDetail(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		int course_id;
		int time_map;
		String week;
		int term;
		int year;
		String classroom;
		try {
			course_id = Integer.parseInt(request.getParameter("courseId"));
			time_map = Integer.parseInt(request.getParameter("timeMap"));
			week = request.getParameter("week");
			term = Integer.parseInt(request.getParameter("term"));
			year = Integer.parseInt(request.getParameter("year"));
			classroom = request.getParameter("classroom");
		} catch (Exception e) {
			model.addAttribute("message", "参数错误");
			return "nofound";
		}
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher == null) {
			model.addAttribute("jump","login");
			model.addAttribute("message", "清先登录系统");
			return "nofound";
		}
		ArrayList<T_C_S> tcslist = this.iT_C_SService
				.getStudentBySomeCondition(course_id, time_map, week, term, year, classroom);
		ArrayList<TCSModel> tcsModels = new ArrayList<TCSModel>();
		for (T_C_S tcs : tcslist) {
			tcsModels.add(new TCSModel(tcs, this.iStudentService
					.selectStudentByPrimaryKey(tcs.getStudentId())));
		}
		model.addAttribute("tcsModels", tcsModels);
		return "course_detail";
	}
	@RequestMapping(value="/kebiao/modifystate",method=RequestMethod.POST)
	@ResponseBody
	public ActionResult modifyState(HttpServletRequest request){
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher == null) {
			return new ActionResult(303,"清先登录");
		}
		int tcsid;
		int state;
		try {
			tcsid=Integer.parseInt(request.getParameter("tcsid"));
			state=Integer.parseInt(request.getParameter("state"));
		} catch (Exception e) {
			return new ActionResult(0,"参数错误");
		}
		
		T_C_S tcs= this.iT_C_SService.getTCSByPrimary(tcsid);
		if(tcs==null){
			return new ActionResult(0,"找不到该记录");
		}
		tcs.setState(state);
		int effectrow=iT_C_SService.updateByPrimaryKeySelective(tcs);
		if(effectrow==1){
			return new ActionResult(1, "修改成功");
		}else {
			return new ActionResult(0, "修改失败");
		}
		
	}
}
