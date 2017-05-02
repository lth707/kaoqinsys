package com.lth.kaoqinsys.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.CourseMapper;
import com.lth.kaoqinsys.dao.CourseTimeMapMapper;
import com.lth.kaoqinsys.dao.CourseWeekMapper;
import com.lth.kaoqinsys.dao.KaoqinReacordMapper;
import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.CourseTimeMap;
import com.lth.kaoqinsys.pojo.CourseWeek;
import com.lth.kaoqinsys.pojo.KaoqinReacord;
import com.lth.kaoqinsys.service.ICourseService;
@Service("courseService")
public class CourseService implements ICourseService{
    @Resource CourseMapper courseMapper;
    @Resource CourseTimeMapMapper courseTimeMapMapper;
    @Resource CourseWeekMapper courseWeekMapper;
    @Resource KaoqinReacordMapper kaoqinReacordMapper;
	@Override
	public Course selectCourseById(int id) {
		return courseMapper.selectByPrimaryKey(id);
	}
	@Override
	public ArrayList<CourseTimeMap> seletTimeMapByCourseId(int course_id) {
		return courseTimeMapMapper.seletTimeMapByCourseId(course_id);
	}
	@Override
	public ArrayList<CourseWeek> seletCourseWeekByCourseId(int course_id) {
		return courseWeekMapper.seletCourseWeekByCourseId(course_id);
	}
	@Override
	public ArrayList<KaoqinReacord> selectKaoqinRecordBySomeCondition(
			int teacher_id, int course_id, int time_map, int student_id,
			int week, int year, int term) {
		return kaoqinReacordMapper.selectKaoqinRecordBySomeCondition(teacher_id, course_id, time_map, student_id, week, year, term);
	}
	@Override
	public int insertKaoqinRecord(KaoqinReacord record) {
		return kaoqinReacordMapper.insert(record);
	}
	@Override
	public KaoqinReacord selectKaoqinReacordByPrimaryKey(int id) {
		
		return kaoqinReacordMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateKaoqinRecord(KaoqinReacord record) {
		return kaoqinReacordMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public int selectMaxId() {
		return kaoqinReacordMapper.selectMaxId();
	}
	@Override
	public ArrayList<KaoqinReacord> selectKaoqinRecordByStudentId(int student_id) {
		return kaoqinReacordMapper.selectKaoqinRecordByStudentId(student_id);
	}
	@Override
	public ArrayList<Course> selectAllCourse() {
		return courseMapper.selectAllCourse();
	}
	@Override
	public ArrayList<CourseWeek> seletCourseWeekBySomeCondition(int course_id,
			int year, int term) {
		return courseWeekMapper.seletCourseWeekBySomeCondition(course_id,year,term);
	}
	
	
}
