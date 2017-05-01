package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.StudentCourse;

public interface StudentCourseMapper {
    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);

	ArrayList<StudentCourse> seletStudentByCourseId(int course_id);
}