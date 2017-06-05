package com.ant.controller;

import org.springframework.stereotype.Controller;

@Controller
public class HomeController {
	public String index(){
		return "home";
	}
}
