package com.ant.storage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ant.storage.dto.StorageDTO;
import com.ant.storage.service.StorageService;
import com.ant.user.dto.UserDTO;

@Controller
@RequestMapping("/storage")
public class StorageController {
	@Autowired
	private StorageService service;

	private String path = "C:\\antAndGrasshopper\\download";

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/storage/storageTable/{projectNo}")
	public ModelAndView storageIndex(@PathVariable int projectNo) {
		System.out.println(projectNo);
		List<StorageDTO> list = service.selectAll(projectNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("storage/storageTable");
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/storage/tableDetail/{storageNo}")
	public ModelAndView selectByStorageNum(@PathVariable int storageNo) throws Exception {
		StorageDTO dto = service.selectByStorageNum(storageNo, true);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", dto);
		mv.setViewName("storage/storageDetail");
		return mv;
	}

	@RequestMapping("/storage/delete/{storageNo}/{userNo}/{projectNo}")
	public String delete(@PathVariable int storageNo, @PathVariable int userNo, @PathVariable int projectNo)
			throws Exception {
		service.delete(storageNo, userNo);
		return "redirect:/storage/storageTable/" + projectNo;
	}

	@RequestMapping("/storage/insertForm/{userNo}")
	public ModelAndView insertForm(@PathVariable int userNo) {
		UserDTO dto = service.selectUserByUserNo(userNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("storage/insertForm");
		mv.addObject("userDTO", dto);
		return mv;
	}

	@RequestMapping("/storage/insert")
	public String insert(StorageDTO storageDTO) throws Exception {

		System.out.println("111111111111111");
		MultipartFile file = storageDTO.getFile();
		if (file.getSize() > 0) {
			String fileName = file.getOriginalFilename();
			long fileSize = file.getSize();
			storageDTO.setFileName(fileName);
			storageDTO.setFileSize((int) fileSize);

			try {
				file.transferTo(new File(path + "/" + fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		service.insert(storageDTO);
		return "redirect:/storage/storageTable/1";
	}
}
