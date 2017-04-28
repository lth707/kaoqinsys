package com.lth.kaoqinsys.service.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.T_C_SMapper;
import com.lth.kaoqinsys.pojo.T_C_S;
import com.lth.kaoqinsys.service.IT_C_SService;

@Service("tcsservice")
public class T_C_SService implements IT_C_SService {
	@Resource
	T_C_SMapper tcsmapper;
	@Override
	public ArrayList<T_C_S> getKeBiaoByTeacherId(int teacher_id) {
       		
		return tcsmapper.selectKeBiaoByTeacherId(teacher_id);
	}
	@Override
	public ArrayList<T_C_S> getStudentByCourseId(int course_id) {
		return tcsmapper.selectStudentByCourseId(course_id);
	}
	@Override
	public T_C_S getTCSByPrimary(int id) {
		return tcsmapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateByPrimaryKeySelective(T_C_S record) {
		return tcsmapper.updateByPrimaryKey(record);
	}
	@Override
	public ArrayList<T_C_S> getStudentBySomeCondition(int course_id,
			int time_map, String week, int term,int year,String classroom) {
		return this.tcsmapper.selectStudentBySomeCondition(course_id, time_map, week, term, year, classroom);
	}

}
