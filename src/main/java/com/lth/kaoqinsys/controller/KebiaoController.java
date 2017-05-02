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
import com.lth.kaoqinsys.pojo.CourseTimeMap;
import com.lth.kaoqinsys.pojo.CourseWeek;
import com.lth.kaoqinsys.pojo.KaoqinReacord;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.StudentCourse;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.pojo.TeacherCourse;
import com.lth.kaoqinsys.service.ICourseService;
import com.lth.kaoqinsys.service.IStudentService;
import com.lth.kaoqinsys.service.ITeacherService;
import com.lth.kaoqinsys.utils.ActionResult;
import com.lth.kaoqinsys.utils.Auth;
import com.lth.kaoqinsys.utils.JsonUtils;
import com.lth.kaoqinsys.utils.Tool;

@Controller
public class KebiaoController {
	@Resource
	ITeacherService iTeacherService;
	@Resource
	ICourseService iCourseService;
	@Resource
	IStudentService iStudentService;

	@RequestMapping(value = "/kebiao", method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher != null) {
			int currentWeek;
			int currentTerm;
			int currentYear;
			try {
				currentWeek = Integer.parseInt(request.getParameter("week"));
				currentTerm = Integer.parseInt(request.getParameter("term"));
				currentYear = Integer.parseInt(request.getParameter("year"));
			} catch (Exception e) {
				model.addAttribute("message", "参数错误");
				return "nofound";
			}
			if ((currentTerm != 1 && currentTerm != 2)|| currentWeek > 20) {
				model.addAttribute("message", "参数错误");
				return "nofound";
			}
			
			HashMap<String, Object> currentTermAndWeek = Tool
					.getCurrentTermAndWeek();
			int currentTermInt = Integer.parseInt(currentTermAndWeek
					.get("term").toString());
			int currentYearInt = Integer.parseInt(currentTermAndWeek
					.get("year").toString());
			if(currentYear==currentYearInt&&currentTerm>currentTermInt){
				model.addAttribute("message", "term参数错误");
				return "nofound";
			}
			if(currentYear>currentYearInt){
				model.addAttribute("message", "year参数错误");
				return "nofound";
			}

			ArrayList<TeacherCourse> tcList = iTeacherService
					.getTeacherCoursesByTeacherId(teacher.getId());
			
			model.addAttribute("teacher", teacher);
			HashMap<Integer, String> tcsMap = new HashMap<Integer, String>();
			HashMap<Integer, Course> courseMap = new HashMap<Integer, Course>();

			for (TeacherCourse tc : tcList) {
				Course course = iCourseService.selectCourseById(tc
						.getCourseId());
				ArrayList<CourseTimeMap> timeMaps = iCourseService
						.seletTimeMapByCourseId(course.getId());
				ArrayList<CourseWeek> courseWeeks = iCourseService
						.seletCourseWeekByCourseId(course.getId());
				boolean weekhascourse = false;
				int maxweek = 0;
				for (CourseWeek cw : courseWeeks) {
					if (maxweek < cw.getWeek()) {
						maxweek = cw.getWeek();
					}
					if (maxweek >= currentWeek&&currentTerm==cw.getTerm()&&cw.getYear()==currentYear) {
						weekhascourse = true;
					}
				}
				if (weekhascourse) {
					for (CourseTimeMap ctm : timeMaps) {
						course.setMaxweek(maxweek);
						tcsMap.put(ctm.getTimemap(), JsonUtils
								.toJsonFromList(new TCSModel(course, teacher)));
						courseMap.put(ctm.getTimemap(), course);
					}
				}
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
			model.addAttribute("currentTerm", currentTerm);
			model.addAttribute("currentWeek", currentWeek);
			model.addAttribute("currentYear", currentYear);
			return "kebiao";
		} else {
			model.addAttribute("message", "清先登录系统");
			model.addAttribute("jump", "login");
			return "nofound";
		}
	}

	@RequestMapping("/kebiao/coursedetail")
	public String courseDetail(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		int course_id;
		int time_map;
		int week;
		int term;
		int year;
		try {
			course_id = Integer.parseInt(request.getParameter("courseId"));
			time_map = Integer.parseInt(request.getParameter("timeMap"));
			week = Integer.parseInt(request.getParameter("week"));
			term = Integer.parseInt(request.getParameter("term"));
			year = Integer.parseInt(request.getParameter("year"));
		} catch (Exception e) {
			model.addAttribute("message", "参数错误");
			return "nofound";
		}
		if ((term != 1 && term != 2)|| week > 20) {
			model.addAttribute("message", "参数错误");
			return "nofound";
		}
		
		HashMap<String, Object> currentTermAndWeek = Tool
				.getCurrentTermAndWeek();
		int currentTermInt = Integer.parseInt(currentTermAndWeek
				.get("term").toString());
		int currentYearInt = Integer.parseInt(currentTermAndWeek
				.get("year").toString());
		if(year==currentYearInt&&term>currentTermInt){
			model.addAttribute("message", "term参数错误");
			return "nofound";
		}
		if(year>currentYearInt){
			model.addAttribute("message", "year参数错误");
			return "nofound";
		}
		
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher == null) {
			model.addAttribute("jump", "login");
			model.addAttribute("message", "清先登录系统");
			return "nofound";
		}
		ArrayList<StudentCourse> scs = this.iStudentService
				.seletStudentByCourseId(course_id);
		ArrayList<TCSModel> tcsModels = new ArrayList<TCSModel>();
		for (StudentCourse sc : scs) {
			Course course = iCourseService.selectCourseById(sc.getCourseId());
			ArrayList<CourseWeek> courseWeeks = iCourseService
					.seletCourseWeekByCourseId(course.getId());
			boolean weekhascourse = false;
			int maxweek = 0;
			for (CourseWeek cw : courseWeeks) {
				if (maxweek < cw.getWeek()) {
					maxweek = cw.getWeek();
				}
				if (maxweek >= week) {
					weekhascourse = true;
				}
			}
			if (weekhascourse) {
				Student student = iStudentService.selectStudentByPrimaryKey(sc
						.getStudentId());
				ArrayList<KaoqinReacord> kaoqinReacords = iCourseService
						.selectKaoqinRecordBySomeCondition(teacher.getId(),
								course.getId(), time_map, student.getId(),
								week, year, term);
				if (kaoqinReacords.isEmpty()) {
					KaoqinReacord kaoqinReacord = new KaoqinReacord(
							teacher.getId(), course.getId(), time_map,
							student.getId(), 1, week, year, (byte) term);
					iCourseService.insertKaoqinRecord(kaoqinReacord);
					kaoqinReacord.setId(iCourseService.selectMaxId());
					kaoqinReacords.add(kaoqinReacord);
				}
				for (KaoqinReacord kaoqinReacord : kaoqinReacords) {
					tcsModels.add(new TCSModel(course, kaoqinReacord, student));
				}
			}
		}
		model.addAttribute("tcsModels", tcsModels);
		return "course_detail";
	}

	@RequestMapping(value = "/kebiao/modifystate", method = RequestMethod.POST)
	@ResponseBody
	public ActionResult modifyState(HttpServletRequest request) {
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher == null) {
			return new ActionResult(303, "清先登录");
		}
		int record_id;
		int state;
		try {
			record_id = Integer.parseInt(request.getParameter("recordId"));
			state = Integer.parseInt(request.getParameter("state"));
		} catch (Exception e) {
			return new ActionResult(0, "参数错误");
		}

		KaoqinReacord kqr = this.iCourseService
				.selectKaoqinReacordByPrimaryKey(record_id);
		if (kqr == null) {
			return new ActionResult(0, "找不到该记录");
		}
		kqr.setState(state);
		int effectrow = iCourseService.updateKaoqinRecord(kqr);
		if (effectrow == 1) {
			return new ActionResult(1, "修改成功");
		} else {
			return new ActionResult(0, "修改失败");
		}

	}
}
