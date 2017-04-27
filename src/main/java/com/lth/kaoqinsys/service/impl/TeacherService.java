package com.lth.kaoqinsys.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.TeacherMapper;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ITeacherService;

@Service("teacherService")
public class TeacherService implements ITeacherService {
	@Resource
	private TeacherMapper teacherMapper;
	@Override
	public Teacher getTeacherByNum(String num) {
		return this.teacherMapper.selectTeacherByNum(num);
	}
	@Override
	public int updateTeacher(Teacher teacher) {
		return this.teacherMapper.updateByPrimaryKey(teacher);
	}

}
