package com.lth.kaoqinsys.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.utils.Auth;

@Controller
@RequestMapping("/record")
public class RecordController {
	@RequestMapping(method=RequestMethod.GET)
	public String  index(HttpServletRequest request,HttpServletResponse response,Model model){
		Teacher teacher=Auth.getLoginTeacher(request, response);
		if(teacher!=null){
			return "record";
		}else{
			
			return "login";
		}
	}
}
