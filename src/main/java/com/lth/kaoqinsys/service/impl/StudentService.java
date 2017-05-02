package com.lth.kaoqinsys.service.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.KaoqinReacordMapper;
import com.lth.kaoqinsys.dao.StudentCourseMapper;
import com.lth.kaoqinsys.dao.StudentMapper;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.StudentCourse;
import com.lth.kaoqinsys.service.IStudentService;

@Service("studentServic")
public class StudentService implements IStudentService{
    @Resource
    StudentMapper studentMapper;
    @Resource
    KaoqinReacordMapper kaoqinReacordMapper;
    @Resource
    StudentCourseMapper studentCourseMapper;
	@Override
	public Student selectStudentByPrimaryKey(int id) {
		return studentMapper.selectByPrimaryKey(id);
	}
	@Override
	public ArrayList<StudentCourse> seletStudentByCourseId(int course_id) {
		return studentCourseMapper.seletStudentByCourseId(course_id);
	}
	@Override
	public Integer getStudentCourseAbsentTimes(int student_id,int course_id,int year,int term) {
		return kaoqinReacordMapper.getStudentCourseAbsentTimes(student_id,course_id,year,term);
	}
}
