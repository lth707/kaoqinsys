package com.lth.kaoqinsys.service;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.T_C_S;

public interface IT_C_SService {
	public ArrayList<T_C_S> getKeBiaoByTeacherId(int teacher_id);

	public ArrayList<T_C_S> getStudentByCourseId(int course_id);

	public ArrayList<T_C_S> getStudentBySomeCondition(int course_id,
			int time_map, String week, int term,int year,String classroom);

	public T_C_S getTCSByPrimary(int id);

	public int updateByPrimaryKeySelective(T_C_S record);
}
