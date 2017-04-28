package com.lth.kaoqinsys.service;


import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.T_C_S;

public interface IT_C_SService {
   public ArrayList<T_C_S> getKeBiaoByTeacherId(int teacher_id);
   public ArrayList<T_C_S> getStudentByCourseId(int course_id);
}
