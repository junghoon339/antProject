package com.ant.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.tomcat.TomcatLoadTimeWeaver;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ant.admin.dto.NoticeDTO;
import com.ant.admin.service.AdminService;
import com.ant.project.dto.ProjectDTO;
import com.ant.user.dto.UserDTO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/main")
	public String main(){
		return "admin/admin";
	}
	
	@RequestMapping("/user")
	public ModelAndView user(String pageNumber){
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curPage=Integer.parseInt(pageNumber);

		int rowCount=7; //한 페이지에 보여줄 데이터 개수
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		List<UserDTO> list=service.userSelectAll(startRow,endRow);
		
		int totalRow=service.userTotalCount();//총 레코드 수
		int pageSu=10; //페이징으로 뿌려질 갯수
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage+pageSu-1;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//페이징에서 마지막페이징 처리할때 상태변수 true면 마지막페이징부분
		
		int lastPageNum=totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;	
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		System.out.println("listttttttttttt:"+list.size());
		ModelAndView mv=new ModelAndView();
		mv.addObject("userList",list);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("flag",flag);
		mv.addObject("pageSu",pageSu);
		mv.addObject("curPage",curPage);
		mv.addObject("rowCount",rowCount);
		mv.setViewName("admin/admin-user_ch");
		return mv;
	}
	
	@RequestMapping("/user/delete")
	public String delete(int userNo,String pageNumber) throws Exception{
		service.userDelete(userNo);
		return "redirect:/admin/user?pageNumber="+pageNumber;
	}
	
	@RequestMapping("/adminProject")
	public ModelAndView project(@RequestParam(defaultValue="0")int projectState,String pageNumber,@RequestParam(defaultValue="-1")int categoryNo,String searchText){
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curPage=Integer.parseInt(pageNumber);

		int rowCount=7; //한 페이지에 보여줄 데이터 개수
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		
		List<ProjectDTO> list=null;
		int totalRow=0;
		if(categoryNo==-1){
			list=service.projectSelectAll(projectState,startRow,endRow);
			
			totalRow=service.projectTotalCount(projectState);
		}else{
			list=service.projectSelectAllBySearch(projectState,startRow,endRow,categoryNo,searchText);
			
			totalRow=service.projectTotalCountBySearch(projectState,categoryNo,searchText);
		}
		
		int pageSu=10; //페이징으로 뿌려질 갯수
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage+pageSu-1;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//페이징에서 마지막페이징 처리할때 상태변수 true면 마지막페이징부분
	
		int lastPageNum=totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("projectList",list);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("flag",flag);
		mv.addObject("pageSu",pageSu);
		mv.addObject("curPage",curPage);
		mv.addObject("rowCount",rowCount);
		
		mv.addObject("projectState",projectState);
		
		mv.addObject("categoryNo",categoryNo);
		mv.addObject("searchText",searchText);
		
		mv.setViewName("admin/admin-project");
		return mv;
	}
	
	@RequestMapping("/project/delete")
	public String projectDelete(int projectNo,String pageNumber,int projectState) throws Exception{
		service.projectDelete(projectNo);
		return "redirect:/admin/adminProject?pageNumber="+pageNumber+"&projectState="+projectState;
	}
	
	@RequestMapping("project/searchProject")
	public ModelAndView projectSearch(int categoryNo,String searchText){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin/admin-project");
		return mv;
	}
	
	@RequestMapping("/updateForm")
	public ModelAndView noticeUpdateForm(NoticeDTO noticeDTO){
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeDTO",noticeDTO);
		mv.setViewName("admin/updateForm");
		return mv;
	}
	
	@RequestMapping("/update")
	public String noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		service.updateNotice(noticeDTO);
		return "redirect:/admin/adminNotice";
	}
	
	
}
