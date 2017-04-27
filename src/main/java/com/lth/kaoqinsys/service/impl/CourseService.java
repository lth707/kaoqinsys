package com.lth.kaoqinsys.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lth.kaoqinsys.dao.CourseMapper;
import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.service.ICourseService;
@Service("courseService")
public class CourseService implements ICourseService{
    @Resource CourseMapper courseMapper;
	@Override
	public Course selectCourseById(int id) {
		return courseMapper.selectByPrimaryKey(id);
	}

}
