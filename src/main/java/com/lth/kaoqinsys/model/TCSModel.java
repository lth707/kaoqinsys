package com.lth.kaoqinsys.model;

import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.T_C_S;
import com.lth.kaoqinsys.pojo.Teacher;

public class TCSModel {
	private T_C_S tcs;
	private Course course;
	private Teacher teacher;
	private Student student;

	
	public TCSModel(T_C_S tcs, Course course, Teacher teacher) {
		super();
		this.tcs = tcs;
		this.course = course;
		this.teacher = teacher;
	}
	public TCSModel(T_C_S tcs,Student student) {
		super();
		this.tcs = tcs;
		this.student=student;
	}
	public T_C_S getTcs() {
		return tcs;
	}

	public void setTcs(T_C_S tcs) {
		this.tcs = tcs;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
