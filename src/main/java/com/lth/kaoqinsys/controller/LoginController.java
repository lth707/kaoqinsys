package com.lth.kaoqinsys.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ITeacherService;
import com.lth.kaoqinsys.utils.Auth;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Resource
	private ITeacherService teacherService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String  get(HttpServletRequest request,HttpServletResponse response,Model model){
		Auth auth=new Auth();
		Teacher teacher=auth.getLoginTeacher(request, response);
		if(teacher!=null){
			try {
				response.sendRedirect("home");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "home";
		}
		model.addAttribute("title", "登录");
		return "login";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String  post(HttpServletRequest request,HttpServletResponse response,Model model){
		Auth auth=new Auth();
		Teacher teacher=auth.getLoginTeacher(request, response);
		if(teacher!=null){
			try {
				response.sendRedirect("home");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "home";
		}
		
		String num = request.getParameter("num");
		if(num==null||num.trim().equals("")){
			model.addAttribute("nummsg","工号不能为空");
			model.addAttribute("title", "登录");
			return "login";
		}
		String password = request.getParameter("password");
		
		if(password==null||password.trim().equals("")){
			model.addAttribute("passwordmsg","密码不能为空");
			model.addAttribute("title", "登录");
			return "login";
		}
		
		Teacher teacher1=teacherService.getTeacherByNum(num);
		if(teacher1==null){
			model.addAttribute("nummsg","该用户不存在");
			model.addAttribute("title", "登录");
			return "login";
		}
		
		if(teacher1.getPassword().equals(password)){
			request.getSession().setAttribute("teacher", teacher1);
			try {
				response.sendRedirect("home");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "home";
		}else{
			model.addAttribute("passwordmsg","密码错误");
			model.addAttribute("title", "登录");
			return "login";
		}
		
	}
	
	
}
