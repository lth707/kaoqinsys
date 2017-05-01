package com.lth.kaoqinsys.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ITeacherService;
import com.lth.kaoqinsys.utils.ActionResult;
import com.lth.kaoqinsys.utils.Auth;

@Controller
public class AuthController {
	@Resource
	ITeacherService iTeacherService;

	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	public String index(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Teacher teacher = Auth.getLoginTeacher(request);
		if (teacher != null) {
			if (teacher.getIsadmin() != 1) {
				model.addAttribute("message", "您没有权限查看此页面");
				return "nofound";
			}
			ArrayList<Teacher> teachers = this.iTeacherService
					.selectAllTeacherWithoutSelf(teacher.getId());
			model.addAttribute("teachers", teachers);
			return "auth";
		} else {
			model.addAttribute("message", "清先登录系统");
			model.addAttribute("jump", "login");
			return "nofound";
		}
	}

	@RequestMapping(value = "/modifyTeacher", method = RequestMethod.POST)
	@ResponseBody
	public ActionResult modifyTeacher(HttpServletRequest request,
			HttpServletResponse response) {
		Teacher teacher = Auth.getLoginTeacher(request);
		ActionResult actionResult = new ActionResult();
		if (teacher != null) {
			if (teacher.getIsadmin() != 1) {
				actionResult.setCode(0);
				actionResult.setMessage("您没有权限操作");
				return actionResult;
			}
			int teacher_id;
			try {
				teacher_id = Integer.parseInt(request
						.getParameter("teacher_id"));
			} catch (Exception e) {
				actionResult.setCode(0);
				actionResult.setMessage("参数错误");
				return actionResult;
			}
			Teacher teacher1 = iTeacherService.getTeacherById(teacher_id);
			if (teacher1 == null) {
				actionResult.setCode(0);
				actionResult.setMessage("该教师不存在");
				return actionResult;
			}
			if (teacher1.getIsadmin() == 1)
				teacher1.setIsadmin((byte) 0);
			else
				teacher1.setIsadmin((byte) 1);

			int effectrow = iTeacherService.updateTeacher(teacher1);
			if (effectrow == 1) {
				actionResult.setCode(1);
				if (teacher1.getIsadmin() == 1)
					actionResult.setMessage("设置成功");
				else
					actionResult.setMessage("取消成功");
			} else {
				actionResult.setCode(0);
				actionResult.setMessage("设置失败");
			}

			return actionResult;
		} else {
			actionResult.setCode(303);
			actionResult.setMessage("清先登录");
			return actionResult;
		}
	}

	@RequestMapping(value = "/addteacher", method = RequestMethod.POST)
	@ResponseBody
	public ActionResult addTeacher(HttpServletRequest request,
			HttpServletResponse response) {
		Teacher teacher = Auth.getLoginTeacher(request);
		ActionResult actionResult = new ActionResult();
		if (teacher != null) {
			if (teacher.getIsadmin() != 1) {
				actionResult.setCode(0);
				actionResult.setMessage("您没有权限操作");
				return actionResult;
			}
			String name = request.getParameter("name");
			int sex = Integer.parseInt(request.getParameter("sex"));
			int isAdmin = Integer.parseInt(request.getParameter("isadmin"));
			String num = request.getParameter("num");
			String password = request.getParameter("password");
			if(this.iTeacherService.getTeacherByNum(num)!=null){
				actionResult.setCode(0);
				actionResult.setMessage("该教工号已经存在");
				return actionResult;
			}
			password = (password.equals("") || password == null) ? "123"
					: password;
			Teacher teacher1 = new Teacher();
			teacher1.setIsadmin((byte) isAdmin);
			teacher1.setName(name);
			teacher1.setNum(num);
			teacher1.setPassword(password);
			teacher1.setSex((byte) sex);
			int effectrow = this.iTeacherService.insetTeacher(teacher1);
			if (effectrow == 1) {
				actionResult.setCode(1);
				actionResult.setMessage("添加成功");
			} else {
				actionResult.setCode(0);
				actionResult.setMessage("添加失败");
			}
			return actionResult;
		} else {
			actionResult.setCode(303);
			actionResult.setMessage("清先登录");
			return actionResult;
		}
	}

}
