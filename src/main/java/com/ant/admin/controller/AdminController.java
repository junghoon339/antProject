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

		int rowCount=2; //�� �������� �ѷ��� ���ڵ��
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		System.out.println("endRowwwwwwwww:"+endRow);
		List<UserDTO> list=service.userSelectAll(startRow,endRow);
		System.out.println("qqqqqqqqqqqqqq"+list.size());
		
		int totalRow=service.userTotalCount();//�� �Խù� ����
		int pageSu=5; //�ѷ��� ������ ��
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage+pageSu-1;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//������ �������� �Ѿ�� ��ư ���ֱ�
		
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

		int rowCount=5; //�� �������� �ѷ��� ���ڵ��
		int startRow=(curPage-1)*rowCount+1;
		int endRow=curPage*rowCount;
		//System.out.println("endRowwwwwwwww:"+endRow);
		
		List<ProjectDTO> list=null;
		int totalRow=0;
		if(categoryNo==-1){
			System.out.println("Aaaaaaaaaaaaaaaaaaaaa");
			list=service.projectSelectAll(projectState,startRow,endRow);
			//System.out.println("qqqqqqqqqqqqqq"+list.size());
			
			totalRow=service.projectTotalCount(projectState);//�� �Խù� ����
		}else{
			System.out.println("Bbbbbbbbbbbbbbbbbbbbbb");
			list=service.projectSelectAllBySearch(projectState,startRow,endRow,categoryNo,searchText);
			
			totalRow=service.projectTotalCountBySearch(projectState,categoryNo,searchText);
		}
		
		System.out.println("tttttttttttttrrrrrrrrrrrrrrrrr"+totalRow);
		int pageSu=5; //�ѷ��� ������ ��
		int startPage=((curPage-1)/pageSu)*pageSu+1;
		int endPage=startPage+pageSu-1;
		
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		boolean flag=false;//������ �������� �Ѿ�� ��ư ���ֱ�
	
		
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
	
	@RequestMapping("/adminNotice")
	public ModelAndView NoticeMain(String pageNumber, String searchText){
		System.out.println("여기 안들어온다");
		System.out.println(pageNumber);
		if(pageNumber==null){
			pageNumber = "1";
		}
		
		int curPage = Integer.parseInt(pageNumber);
		int rowCount = 7;
		int startRow = (curPage-1)*rowCount+1;
		int endRow = curPage*rowCount;
		List<NoticeDTO> list = null;
		int totalRow = 0;
		if(searchText==null){
			list = service.noticeSelectAll(startRow, endRow);
			totalRow = service.noticeTotalCount();
		}else{
			list = service.noticeSelectBySearch(startRow, endRow, searchText);
			totalRow = service.noticeTotalCountBySearch(searchText); 
		}
		int pageSu = 5;
		int startPage = ((curPage-1)/pageSu)*pageSu+1;
		int endPage = startPage+pageSu-1;
		
		boolean flag = false;
		int lastPageNum = totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("flag",flag);
		mv.addObject("pageSu",pageSu);	
		mv.addObject("curPage",curPage);
		mv.addObject("rowCount",rowCount);
		mv.addObject("searchText",searchText);
		
		mv.setViewName("/admin/adminNotice");
		return mv;
	}
	
	@RequestMapping("/noticeInsert")
	public String noticeInsert(NoticeDTO noticeDTO) throws Exception{
		service.insertNotice(noticeDTO);
		return "redirect:/admin/adminNotice";
	}
	
	@RequestMapping("/noticeDetail/{noticeNo}")
	public ModelAndView noticeDetail(@PathVariable int noticeNo){
		ModelAndView mv = new ModelAndView();
		NoticeDTO dto = service.selectByNoticeNum(noticeNo);
		mv.addObject("noticeDTO", dto);
		mv.setViewName("admin/noticeDetailNew");
		return mv;
	}
	
	@RequestMapping("/delete/{noticeNo}")
	public String noticeDelete(@PathVariable int noticeNo) throws Exception{
		service.deleteNotice(noticeNo);
		return "redirect:/admin/adminNotice";
	}
	
	@RequestMapping("/updateForm")
	public ModelAndView noticeUpdateForm(NoticeDTO noticeDTO){
		System.out.println("update Form = "+noticeDTO.getNoticeNo());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeDTO",noticeDTO);
		mv.setViewName("admin/updateForm");
		return mv;
	}
	
	@RequestMapping("/update")
	public String noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		System.out.println("여기오긴하냐");
		System.out.println("update = "+noticeDTO.getNoticeNo());
		service.updateNotice(noticeDTO);
		return "redirect:/admin/adminNotice";
	}
	
	
}
