package com.lth.kaoqinsys.pojo;

import java.util.ArrayList;

public class CourseWeek {
    private Integer courseId;

    private Integer week;

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
}