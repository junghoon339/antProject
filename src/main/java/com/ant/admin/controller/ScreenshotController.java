package com.ant.admin.controller;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/screenshot")
public class ScreenshotController {
	
	@RequestMapping("/test")
	public String test(){
		String path = "C:/";
		
		/**
		 * È­¸éÀ» Ä¸ÃÄÇÑ µÚ °´Ã¼È­
		 */
		Robot robot=null;
		try {
			robot = new Robot();
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		robot.delay(1000);
		BufferedImage screencapture = robot
				.createScreenCapture(new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));

		// Save as JPEG
		File file = new File(path + "screencapture.jpg");
		try {
			ImageIO.write(screencapture, "jpg", file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/admin/adminProject";
	}
}
