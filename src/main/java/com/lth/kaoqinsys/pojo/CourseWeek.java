package com.lth.kaoqinsys.pojo;

import java.util.ArrayList;

public class CourseWeek {
    private Integer courseId;

    private Integer week;
    
    private Integer year;
    
    private Integer term;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

	public ArrayList<CourseWeek> seletCourseWeekByCourseId(int course_id) {
		return this.seletCourseWeekByCourseId(course_id);
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getTerm() {
		return term;
	}

	public void setTerm(Integer term) {
		this.term = term;
	}
}