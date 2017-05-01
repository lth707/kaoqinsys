package com.lth.kaoqinsys.service;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.pojo.TeacherCourse;

public interface ITeacherService {
     public Teacher getTeacherByNum(String num);
     public Teacher getTeacherById(int id);
     public int updateTeacher(Teacher teacher);
     public ArrayList<TeacherCourse> getTeacherCoursesByTeacherId(int teacher_id);
     public ArrayList<Teacher> selectAllTeacherWithoutSelf(int selfid);
     public int insetTeacher(Teacher teacher);
}
