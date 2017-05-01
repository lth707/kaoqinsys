package com.lth.kaoqinsys.model;

import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.KaoqinReacord;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.pojo.Teacher;

public class TCSModel {
	private Course course;
	private Teacher teacher;
	private Student student;
    private KaoqinReacord kaoqinReacord;
	
	
	public TCSModel(Course course, Student student, KaoqinReacord kaoqinReacord) {
		super();
		this.course = course;
		this.student = student;
		this.kaoqinReacord = kaoqinReacord;
	}
	public TCSModel(Course course, Teacher teacher) {
		super();
		this.course = course;
		this.teacher = teacher;
	}
	
	public TCSModel(Course course,KaoqinReacord kaoqinReacord, Student student) {
		super();
		this.course = course;
		this.student = student;
		this.kaoqinReacord=kaoqinReacord;
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
	
	public KaoqinReacord getKaoqinReacord() {
		return kaoqinReacord;
	}
	public void setKaoqinReacord(KaoqinReacord kaoqinReacord) {
		this.kaoqinReacord = kaoqinReacord;
	}
}
