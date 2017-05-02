package com.lth.kaoqinsys.model;

import com.lth.kaoqinsys.pojo.Student;

public class StudentRecordModel {
    private Student student;
    private String presentAndAbsentTimeString;
	public StudentRecordModel() {
		super();
	}
	public StudentRecordModel(Student student,String presentAndAbsentTimeString) {
		super();
		this.student = student;
		this.presentAndAbsentTimeString=presentAndAbsentTimeString;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getPresentAndAbsentTimeString() {
		return presentAndAbsentTimeString;
	}
	public void setPresentAndAbsentTimeString(String presentAndAbsentTimeString) {
		this.presentAndAbsentTimeString = presentAndAbsentTimeString;
	}
    
}
