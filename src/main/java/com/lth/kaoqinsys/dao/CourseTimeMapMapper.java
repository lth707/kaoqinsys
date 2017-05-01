package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.CourseTimeMap;

public interface CourseTimeMapMapper {
    int insert(CourseTimeMap record);

    int insertSelective(CourseTimeMap record);

	ArrayList<CourseTimeMap> seletTimeMapByCourseId(int id);
}