package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

	ArrayList<Course> selectAllCourse();
}