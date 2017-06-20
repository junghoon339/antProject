package com.ant.controller;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
@RequestMapping("/test")
public class CreateController {

	private String getPath = "C:/chat/capture/savedJPG/";
	private String setPath = "C:/chat/capture/toPDF/";

	@RequestMapping("/test")
	public String SimpleImages(Model model) throws Exception {

		/**
		 * PDF파일을 생성 및 내용 삽입
		 */
		Document document = new Document();
		Document document2 = new Document();
		PdfWriter.getInstance(document, new FileOutputStream(setPath + "SimpleImages.pdf"));
		PdfWriter.getInstance(document2, new FileOutputStream(setPath + "test.pdf"));
		document.open();
		document2.open();
		document.add(new Paragraph("내부 소제목인가?"));
		document2.add(new Paragraph("내부 소제목인가?"));
		
		Image image = Image.getInstance(getPath + "mouse.jpg");
		Image image2 = Image.getInstance(getPath + "sample03.jpg");
		document.add(image);
		document.addTitle("pdf파일 타이틀을 지정하는 함수");
		document.add(image2);
		document.addHeader("아규0", "아규1"); // ?
		document.addSubject("서브젝트 주제"); // ?

		document.close();

		model.addAttribute("path", getPath);

		/**
		 * 화면을 캡쳐한 뒤 객체화
		 */
		Robot robot = new Robot();
		robot.delay(1000);
		BufferedImage screencapture = robot
				.createScreenCapture(new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));

		// Save as JPEG
		File file = new File(setPath + "screencapture.jpg");
		ImageIO.write(screencapture, "jpg", file);

		return "test/success";
	}
}
