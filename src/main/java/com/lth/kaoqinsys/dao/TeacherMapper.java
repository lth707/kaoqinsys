package com.lth.kaoqinsys.dao;
import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.Teacher;

public interface TeacherMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Teacher record);

	int insertSelective(Teacher record);

	Teacher selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Teacher record);

	int updateByPrimaryKey(Teacher record);

	Teacher selectTeacherByNum(String num);
	
    ArrayList<Teacher> selectAllTeacherWithoutSelf(int selfid);
}