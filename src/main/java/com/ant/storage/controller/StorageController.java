package com.ant.storage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/*@RequestMapping("/storageTable/{projectNo}")
	public ModelAndView storageIndex(@PathVariable int projectNo){
		List<StorageDTO> list =  service.selectAll(projectNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("storage/test");
		mv.addObject("list",list);
		return mv;
	}*/
	
	//paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
	@RequestMapping("/storageTable/{projectNo}")
	public ModelAndView storageIndex1(@PathVariable int projectNo, String pageNumber, String searchText,@RequestParam(defaultValue="-1")int categoryNo){
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curPage=Integer.parseInt(pageNumber);

		int rowCount=7; //�� �������� �ѷ��� ���ڵ��
		int startRow=(curPage-1)*rowCount+1; //�� ���������� ���۵Ǵ� ��ȣ
		int endRow=curPage*rowCount; //�� ���������� ������ ��ȣ
		List<StorageDTO> list = null;
		int totalRow = 0;
		if(categoryNo==-1){
			list =  service.selectAll(projectNo,startRow,endRow);
			totalRow = service.totalCount(projectNo);
		}else{
			list = service.selectBySearch(projectNo, startRow, endRow, categoryNo, searchText);
			totalRow = service.totalCountBySearch(categoryNo, searchText,projectNo);	
		}
		
		
		int pageSu=5; //�ѷ��� ������ ��
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage+pageSu-1;
		
		boolean flag=false;//������ �������� �Ѿ�� ��ư ���ֱ�
		int lastPageNum=totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("flag",flag);
		mv.addObject("pageSu",pageSu);	
		mv.addObject("curPage",curPage);
		mv.addObject("rowCount",rowCount);
		
		mv.addObject("categoryNo",categoryNo);
		mv.addObject("searchText",searchText);
		
		/*mv.setViewName("storage/test");*/
		mv.setViewName("storage/teamMain_ch");
		return mv;
	}
	//paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
	
	@RequestMapping("/tableDetail/{storageNo}")
	public ModelAndView selectByStorageNum(@PathVariable int storageNo) throws Exception{
		StorageDTO dto = service.selectByStorageNum(storageNo, true);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", dto);
		mv.setViewName("storage/storageDetail");
		return mv;
	}
	
	@RequestMapping("/delete/{storageNo}/{userNo}/{projectNo}")
	public String delete(@PathVariable int storageNo, @PathVariable int userNo, @PathVariable int projectNo) throws Exception{
		service.delete(storageNo, userNo);
		return "redirect:/storage/storageTable/" + projectNo;
	}
	
	@RequestMapping("/insertForm/{userNo}")
	public ModelAndView insertForm(@PathVariable int userNo){
		UserDTO dto = service.selectUserByUserNo(userNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("storage/insertForm");
		mv.addObject("userDTO", dto);
		return mv;
	}

	@RequestMapping("/insert")
	public String insert(StorageDTO storageDTO) throws Exception{
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
	
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(StorageDTO storageDTO){
		/*System.out.println(storageDTO.getUserDTO().getUserName());*/ //null
		ModelAndView mv = new ModelAndView();
		mv.setViewName("storage/updateForm");
		mv.addObject("storageDTO", storageDTO);
		return mv;
	}
	
	@RequestMapping("/update")
	public String update(StorageDTO storageDTO) throws Exception{
		MultipartFile file = storageDTO.getFile();
		if(file.getSize()>0){
			String fileName = file.getOriginalFilename();
			long fileSize = file.getSize();
			storageDTO.setFileName(fileName);
			storageDTO.setFileSize((int)fileSize);
			
			try {
				file.transferTo(new File(path+"/"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		service.update(storageDTO);
		return "redirect:/storage/storageTable/1";
	}
	
	@RequestMapping("/download")
	public ModelAndView download(String fileName){
		File file = new File(path+"/"+fileName);
		return new ModelAndView("downLoadView","fName",file);
	}
}
