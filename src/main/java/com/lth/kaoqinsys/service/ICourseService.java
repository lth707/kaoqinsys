package com.lth.kaoqinsys.service;


import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.CourseTimeMap;
import com.lth.kaoqinsys.pojo.CourseWeek;
import com.lth.kaoqinsys.pojo.KaoqinReacord;
public interface ICourseService {
      public Course selectCourseById(int id);
      public ArrayList<CourseTimeMap> seletTimeMapByCourseId(int id);
      public ArrayList<CourseWeek> seletCourseWeekByCourseId(int id);
      public ArrayList<KaoqinReacord> selectKaoqinRecordBySomeCondition(int teacher_id,int course_id,int time_map,int student_id,int week,int year,int term);
      public int insertKaoqinRecord(KaoqinReacord record);
      public int selectMaxId();
      public KaoqinReacord selectKaoqinReacordByPrimaryKey(int id);
      public int updateKaoqinRecord(KaoqinReacord record);
}
