package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.TeacherCourse;

public interface TeacherCourseMapper {
    int insert(TeacherCourse record);

    int insertSelective(TeacherCourse record);
    
	ArrayList<TeacherCourse> selectKeBiaoByTeacherId(int teacher_id);
}