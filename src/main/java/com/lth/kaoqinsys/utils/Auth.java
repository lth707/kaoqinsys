package com.lth.kaoqinsys.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lth.kaoqinsys.pojo.Teacher;

public class Auth {
	public static Teacher getLoginTeacher(HttpServletRequest request) {
		Object object = request.getSession().getAttribute("teacher");
		if (object != null) {
			Teacher teacher = null;
			try {
				teacher = (Teacher) object;
				return teacher;
			} catch (Exception e) {
				return null;
			}

		} else {
			return null;
		}
	}
}
