package com.lth.kaoqinsys.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.utils.Auth;

@Controller

public class HomeController {
	
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String  index(HttpServletRequest request,HttpServletResponse response,Model model){
		Teacher teacher=Auth.getLoginTeacher(request);
		if(teacher!=null){
			model.addAttribute("teacher", teacher);
			model.addAttribute("title", "主页");
			return "home";
		}else{
			try {
				response.sendRedirect("login");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "login";
		}
	}
}
