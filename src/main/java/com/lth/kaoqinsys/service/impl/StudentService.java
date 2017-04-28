package com.lth.kaoqinsys.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.StudentMapper;
import com.lth.kaoqinsys.pojo.Student;
import com.lth.kaoqinsys.service.IStudentService;

@Service("studentServic")
public class StudentService implements IStudentService{
    @Resource
    StudentMapper studentMapper;
	@Override
	public Student selectStudentByPrimaryKey(int id) {
		return studentMapper.selectByPrimaryKey(id);
	}
}
