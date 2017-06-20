package com.ant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class CreateController {

	@RequestMapping("/test")
	public String SimpleImages(Model model) throws Exception {

		return "test/success";
	}
}
