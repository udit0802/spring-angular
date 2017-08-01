package com.country.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin",method = RequestMethod.GET)
	public ModelAndView getAdminPage(ModelAndView mv){
		mv.setViewName("admin");
		return mv;
	}
	
	@RequestMapping(value = "/map",method = RequestMethod.GET)
	public ModelAndView getMapPage(ModelAndView mv){
		mv.setViewName("map");
		return mv;
	}
}
