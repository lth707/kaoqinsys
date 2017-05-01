package com.lth.kaoqinsys.service;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.StudentCourse;

public interface IStudentService {
	public Student selectStudentByPrimaryKey(int id);
	
	public ArrayList<StudentCourse> seletStudentByCourseId(int course_id);
}
