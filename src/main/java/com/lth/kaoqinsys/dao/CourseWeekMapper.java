package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.CourseWeek;

public interface CourseWeekMapper {
    int insert(CourseWeek record);

    int insertSelective(CourseWeek record);

	ArrayList<CourseWeek> seletCourseWeekByCourseId(int id);
}