package com.ant.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChangeViewTest {
	@RequestMapping("/main/changeHome")
	public String home(){
		return "/project/home_ch";
	}
}
