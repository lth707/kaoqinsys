package com.lth.kaoqinsys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.model.StudentRecordModel;
import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.CourseWeek;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.StudentCourse;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ICourseService;
import com.lth.kaoqinsys.service.IStudentService;
import com.lth.kaoqinsys.utils.Auth;
import com.lth.kaoqinsys.utils.Tool;

@Controller
@RequestMapping("/record")
public class RecordController {
	@Resource
	ICourseService iCourseService;
	@Resource
	IStudentService iStudentService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher != null) {
			int currentTerm;
			int currentYear;
			try {
				currentTerm = Integer.parseInt(request.getParameter("term"));
				currentYear = Integer.parseInt(request.getParameter("year"));
			} catch (Exception e) {
				model.addAttribute("message", "参数错误");
				return "nofound";
			}
			if ((currentTerm != 1 && currentTerm != 2)) {
				model.addAttribute("message", "参数错误");
				return "nofound";
			}

			HashMap<String, Object> currentTermAndWeek = Tool
					.getCurrentTermAndWeek();
			int currentTermInt = Integer.parseInt(currentTermAndWeek
					.get("term").toString());
			int currentYearInt = Integer.parseInt(currentTermAndWeek
					.get("year").toString());
			int currentWeekInt = (int)Float.parseFloat(currentTermAndWeek
					.get("week").toString());
			if (currentYear == currentYearInt && currentTerm > currentTermInt) {
				model.addAttribute("message", "term参数错误");
				return "nofound";
			}
			if (currentYear > currentYearInt) {
				model.addAttribute("message", "year参数错误");
				return "nofound";
			}

			
			HashMap<Integer, Integer> allTimesMap = new HashMap<Integer, Integer>();
			HashMap<Integer, Integer> allAbsentTimesMap = new HashMap<Integer, Integer>();
			ArrayList<Course> courses = this.iCourseService.selectAllCourse();
			for (Course course : courses) {
				if (this.iCourseService.seletCourseWeekBySomeCondition(
						course.getId(), currentYear, currentTerm).isEmpty()) {
					continue;
				}
				CourseWeek cw = this.iCourseService.seletCourseWeekByCourseId(
						course.getId()).get(0);
				ArrayList<StudentCourse> studentcourses = iStudentService
						.seletStudentByCourseId(course.getId());
				
				for (StudentCourse sc : studentcourses) {
					int absentcount = iStudentService
							.getStudentCourseAbsentTimes(sc.getStudentId(),
									course.getId(), currentYear, currentTerm);
					int preWeekCourseCount=iCourseService.seletTimeMapByCourseId(sc.getCourseId()).size();
					Integer abt = allAbsentTimesMap.get(sc.getStudentId());
					Integer at = allTimesMap.get(sc.getStudentId());
					if (currentYearInt > currentYear) {
						if (abt == null) {
							allAbsentTimesMap.put(sc.getStudentId(),
									absentcount);
						} else {
							allAbsentTimesMap.put(sc.getStudentId(), abt
									+ absentcount);
						}
						if (at == null) {
							allTimesMap
									.put(sc.getStudentId(), cw.getWeek() *preWeekCourseCount);
						} else {
							allTimesMap.put(sc.getStudentId(), cw.getWeek() *preWeekCourseCount
									+ at);
						}
					} else if (currentYearInt == currentYear) {
						if (currentTermInt > currentTerm) {
							if (abt == null) {
								allAbsentTimesMap.put(sc.getStudentId(),
										absentcount);
							} else {
								allAbsentTimesMap.put(sc.getStudentId(), abt
										+ absentcount);
							}
							if (at == null) {
								allTimesMap.put(sc.getStudentId(),
										cw.getWeek() * 5*preWeekCourseCount);
							} else {
								allTimesMap.put(sc.getStudentId(), cw.getWeek()
										* 5*preWeekCourseCount + at);
							}
						} else if (currentTermInt == currentTerm) {
							if (abt == null) {
								allAbsentTimesMap.put(sc.getStudentId(),
										absentcount);
							} else {
								allAbsentTimesMap.put(sc.getStudentId(), abt
										+ absentcount);
							}
							if (at == null) {
								allTimesMap.put(sc.getStudentId(),
										(cw.getWeek() - currentWeekInt)*preWeekCourseCount);
							} else {
								allTimesMap.put(sc.getStudentId(),
										(cw.getWeek() - currentWeekInt)*preWeekCourseCount
												+ at);
							}
						}
					}
				}
			}
			ArrayList<StudentRecordModel> studentRecordModels = new ArrayList<StudentRecordModel>();
			Iterator<Map.Entry<Integer,Integer>> iter = allAbsentTimesMap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry<Integer,Integer> entry = iter.next();
				Integer student_id =  entry.getKey();
				Integer absentTime =  entry.getValue();
				Integer allTime=allTimesMap.get(student_id);
				Student student= iStudentService.selectStudentByPrimaryKey(student_id);
				studentRecordModels.add(new StudentRecordModel(student,"出勤"+(allTime-absentTime)+"次,缺勤"+absentTime+"次"));
			}
			model.addAttribute("studentRecordModels", studentRecordModels);
			model.addAttribute("currentTerm", currentTerm);
			model.addAttribute("currentYear", currentYear);
			return "record";
		} else {
			model.addAttribute("message", "清先登录系统");
			model.addAttribute("jump", "login");
			return "nofound";
		}

	}
}
