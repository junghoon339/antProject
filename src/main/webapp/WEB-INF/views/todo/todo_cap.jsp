<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>HTML5 Drag and Drop - sorting photos between albums|
	Script Tutorials</title>
<link href="${pageContext.request.contextPath }/resources/todo/css/main.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
		$(document).on("click","a",function(){
			if($(this).attr("id").indexOf('p')==-1){
				var val=prompt("포스트잇에 적을 내용을 입력해주세요");
				
				$(this).find("span").text(val);
			}else{
				var postitSu=$(this).attr("id").split('p');
				$.ajax({
					url:url+"/todo/selectText",
					type:"post",
					data:"todoNo="+postitSu[1]+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
					dataType:"json",
					success:function(re){
						//re.userNo == 현재 userNo같으면! else{alert('메모변경은 메모를 등록한사람만 가능합니다.')}
						if("${sessionScope.userDTO.userNo}"==re.userNo){
							if(re!=null){
								var updateVal=prompt("포스트잇에 적을 내용을 입력해주세요",re.todoContent);
								if(updateVal!=null){
									$("#todoLocation").val("-1");
									$("#todoNo").val(postitSu[1]);
									$("#todoContent").val(updateVal);
									$.ajax({
										url:url+"/todo/todoUpdate",
										type:"post",
										data:$("#todoForm").serialize(),
										dataType:"text",
										success:function(re){
											if(re>0){
												alert("수정됫네?ㅎㅎ");
												todoSelectAll();
											}else{
												alert("수정안됫으");
											}
										},
										error:function(err){
											alert("에러발생 : "+err);
										}
									});
								}
								
							}
						}else{
							alert("메모변경은 메모를 등록한 사람만 가능합니다.");
						}
						
					},
					error:function(err){
						alert("에러발생 : "+err);
					}
				});
				//content와 사용자no도 불러올것!
			}
			
			//id에 p가 붙어있는지 확인한다->해당 값을 불러온다-> 다르면 바꿔준다. ->수정되면 todoSelectAll() 불러온다. 끝. 
			
			
		});
		/* $("#postit").click(function(){
			
		}); */
		
	});
	
	var url="${pageContext.request.contextPath}";
	
	var sessionUserNo="${sessionScope.userDTO.userNo}";
</script>
</head>
<body>


	<div class="albums">
		<div class="album" id="drop_0" droppable="true">
			<h2>TO DO</h2>
			
		</div>
		<div class="album" id="drop_1" droppable="true">
			<h2>DOING</h2>
		</div>
		<div class="album" id="drop_2" droppable="true">
			<h2>DONE</h2>
		</div>
	</div>
	<div style="clear: both"></div>
	
	  <form id="todoForm" method=post action="">
       <input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
       <input type=hidden id="todoNo" name="todoNo" value="0"/>
      <input type=hidden id="projectNo" name="projectNo" value="${sessionScope.projectNo }">
      <input type=hidden id="userNo" name="userNo" value="${sessionScope.userDTO.userNo }">
      <input type=hidden id="todoLocation" name="todoLocation" value="-1">
      <input type=hidden id="todoContent" name="todoContent" value="">
      
   </form>
	<script src="${pageContext.request.contextPath }/resources/todo/js/main.js"></script>
</body>
</html>