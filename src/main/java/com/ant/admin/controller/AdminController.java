package com.ant.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

		int rowCount=2; //한 페이지에 뿌려질 레코드수
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		System.out.println("endRowwwwwwwww:"+endRow);
		List<UserDTO> list=service.userSelectAll(startRow,endRow);
		System.out.println("qqqqqqqqqqqqqq"+list.size());
		
		int totalRow=service.userTotalCount();//총 게시물 개수
		int pageSu=1; //뿌려질 페이지 수
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage*pageSu;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//마지막 페이지에 넘어가기 버튼 없애기
		
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
		mv.setViewName("admin/admin-user");
		return mv;
	}
	
	@RequestMapping("/user/delete")
	public String delete(int userNo,String pageNumber){
		service.userDelete(userNo);
		return "redirect:/admin/user?pageNumber="+pageNumber;
	}
	
	@RequestMapping("/adminProject")
	public ModelAndView project(@RequestParam(defaultValue="0")int projectState,String pageNumber,@RequestParam(defaultValue="-1")int categoryNo,String searchText){
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curPage=Integer.parseInt(pageNumber);

		int rowCount=2; //한 페이지에 뿌려질 레코드수
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		//System.out.println("endRowwwwwwwww:"+endRow);
		
		List<ProjectDTO> list=null;
		int totalRow=0;
		if(categoryNo==-1){
			System.out.println("Aaaaaaaaaaaaaaaaaaaaa");
			list=service.projectSelectAll(projectState,startRow,endRow);
			//System.out.println("qqqqqqqqqqqqqq"+list.size());
			
			totalRow=service.projectTotalCount(projectState);//총 게시물 개수
		}else{
			System.out.println("Bbbbbbbbbbbbbbbbbbbbbb");
			list=service.projectSelectAllBySearch(projectState,startRow,endRow,categoryNo,searchText);
			
			totalRow=service.projectTotalCountBySearch(projectState,categoryNo,searchText);
		}
		
		System.out.println("tttttttttttttrrrrrrrrrrrrrrrrr"+totalRow);
		int pageSu=1; //뿌려질 페이지 수
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage*pageSu;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//마지막 페이지에 넘어가기 버튼 없애기
	
		
		int lastPageNum=totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		System.out.println("enddddddddddddddddd"+endPage);
		System.out.println("listttttttttttt:"+list.size());
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
	public String projectDelete(int projectNo,String pageNumber,int projectState){
		System.out.println("pppppppppppppppppppppppppo:"+projectNo);
		service.projectDelete(projectNo);
		return "redirect:/admin/adminProject?pageNumber="+pageNumber+"&projectState="+projectState;
	}
	
	@RequestMapping("project/searchProject")
	public ModelAndView projectSearch(int categoryNo,String searchText){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin/admin-project");
		return mv;
	}
}
