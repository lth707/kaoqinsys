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

}
