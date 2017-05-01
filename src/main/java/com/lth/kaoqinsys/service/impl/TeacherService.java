package com.lth.kaoqinsys.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.TeacherCourseMapper;
import com.lth.kaoqinsys.dao.TeacherMapper;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.pojo.TeacherCourse;
import com.lth.kaoqinsys.service.ITeacherService;

@Service("teacherService")
public class TeacherService implements ITeacherService {
	@Resource
	private TeacherMapper teacherMapper;
	@Resource
	private TeacherCourseMapper teacherCourseMapper;
	@Override
	public Teacher getTeacherByNum(String num) {
		return this.teacherMapper.selectTeacherByNum(num);
	}
	@Override
	public int updateTeacher(Teacher teacher) {
		return this.teacherMapper.updateByPrimaryKey(teacher);
	}
	@Override
	public ArrayList<TeacherCourse> getTeacherCoursesByTeacherId(int teacher_id) {
		return this.teacherCourseMapper.selectKeBiaoByTeacherId(teacher_id);
	}
	@Override
	public ArrayList<Teacher> selectAllTeacherWithoutSelf(int selfid) {
		return this.teacherMapper.selectAllTeacherWithoutSelf(selfid);
	}
	@Override
	public Teacher getTeacherById(int id) {
		return this.teacherMapper.selectByPrimaryKey(id);
	}
	@Override
	public int insetTeacher(Teacher teacher) {
		return this.teacherMapper.insert(teacher);
	}

}
