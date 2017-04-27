package com.lth.kaoqinsys.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lth.kaoqinsys.pojo.Course;
import com.lth.kaoqinsys.pojo.T_C_S;
import com.lth.kaoqinsys.pojo.Teacher;
import com.lth.kaoqinsys.service.ICourseService;
import com.lth.kaoqinsys.service.IT_C_SService;
import com.lth.kaoqinsys.utils.Auth;
import com.lth.kaoqinsys.utils.JsonUtils;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@Controller
@RequestMapping("/kebiao")
public class KebiaoController {
	@Resource IT_C_SService it_C_SService;
	@Resource ICourseService iCourseService;
	@RequestMapping(method=RequestMethod.GET)
	public String  index(HttpServletRequest request,HttpServletResponse response,Model model){
		Teacher teacher=Auth.getLoginTeacher(request, response);
		if(teacher!=null){
			ArrayList<T_C_S> tcsList=it_C_SService.getKeBiaoByTeacherId(teacher.getId());
			
			model.addAttribute("teacher", teacher);
			ArrayList<Course> courses=new ArrayList<>();
		    HashMap<Integer, String> tcsMap=new HashMap<Integer, String>();
		    HashMap<Integer, Course> courseMap=new HashMap<Integer, Course>();
		    for(T_C_S tcs : tcsList){
		    	courses.add(iCourseService.selectCourseById(tcs.getCourseId()));
		    	tcsMap.put(tcs.getTimeMap(),JsonUtils.toJsonFromList(tcs));
		    	courseMap.put(tcs.getTimeMap(), iCourseService.selectCourseById(tcs.getCourseId()));
		    }
		    ArrayList<Integer> fiftyArrayList=new ArrayList<Integer>();
		    for(int i=0;i<50;i++){
		    	
		    	if(tcsMap.get(i)==null){
		    		tcsMap.put(i,null);
		    	}
		    	if(courseMap.get(i)==null){
		    		courseMap.put(i,null);
		    	}
		    	fiftyArrayList.add(i);
		    }
		    model.addAttribute("tcsMap", tcsMap);
		    model.addAttribute("courseMap", courseMap);
		    model.addAttribute("fiftyArrayList", fiftyArrayList);
			return "kebiao";
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
