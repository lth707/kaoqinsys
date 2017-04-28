package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.lth.kaoqinsys.pojo.T_C_S;

public interface T_C_SMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(T_C_S record);

	int insertSelective(T_C_S record);

	T_C_S selectByPrimaryKey(Integer id);

	ArrayList<T_C_S> selectKeBiaoByTeacherId(int teacher_id);

	ArrayList<T_C_S> selectStudentByCourseId(int course_id);

	ArrayList<T_C_S> selectStudentBySomeCondition(int course_id, int time_map,
			String week, int term,int year,String classroom);

	int updateByPrimaryKeySelective(T_C_S record);

	int updateByPrimaryKey(T_C_S record);
}