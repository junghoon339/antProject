<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	    
	    $("[data-toggle=tooltip]").tooltip();
	    
	    $(document).on("click","#editBtn",function(){
	    	var userNoNameTask=$(this).attr("name"); 

	    	var arr = userNoNameTask.split('/');
	        var userNo = parseInt(arr[0]); //java로 넘어가기위해 int로 형변환
	        var userName = arr[1];
	        var projectUserTask = arr[2];
		
	        alert(userNo+"/"+userName+"/"+projectUserTask);
	        $("#userName").html(userName);
	    	$("#projectUserTask").attr("value",projectUserTask);
	    	$("#userNo").attr("value",userNo);
	    })
	    
	    $(document).on("click","#delBtn",function(){
	    	var delUserNo = parseInt($(this).attr("name"));
	    	alert("delUserNo:"+delUserNo);
	    	$("#delUserNo").attr("value",delUserNo);
	    	
	    })
	    
/* 	    $(document).on("click","#delYesBtn",function(){
	    	alert("delUserNo : "+delUserNo);
	    	
	    	location.href="${pageContext.request.contextPath}/project/projectUserInfo";
	    }) */
	    
	});
</script>

<body>
	<header>
		<jsp:include page="header.jsp" flush="false" />
	</header>
	<jsp:include page="sidebar.jsp" />
	<div id="burger"></div>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">

					<h1>팀원정보</h1>
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<th>이름</th>
								<th>학교</th>
								<th>학과</th>
								<th>역할</th>
								<th>Edit & Delete</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${projectUserList!=null}">
										<c:forEach items="${projectUserList}" var="projectUserDTO">
											<tr>
											<td>${projectUserDTO.userName}</td>
											<td>${projectUserDTO.userSchool}</td>
											<td>${projectUserDTO.userMajor}</td>
											<td>${projectUserDTO.projectuserRole.projectUserTask}</td>
											<td><span data-placement="top" data-toggle="tooltip" title="Edit">
													<button class="btn btn-primary btn-xs" data-title="Edit" id="editBtn" data-toggle="modal" data-target="#edit" name="${projectUserDTO.userNo}/${projectUserDTO.userName}/${projectUserDTO.projectuserRole.projectUserTask}">
														<span class="glyphicon glyphicon-pencil"></span>
													</button></span>
												<span data-placement="top" data-toggle="tooltip" title="Delete">
													<button class="btn btn-danger btn-xs" data-title="Delete" id="delBtn" data-toggle="modal" data-target="#delete" name="${projectUserDTO.userNo}">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</span></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise><!-- 팀원이 없을경우-->
										팀원이 없을수가 없습니다.ㅎㅎㅎ
									</c:otherwise>
								</c:choose>
	
							</tbody>
						</table>
						<a href="#" class="btn btn-sm btn-default" id="addBtn">
							<span class="glyphicon glyphicon-plus" data-toggle="modal">팀원추가</span> 
						</a> 
						<span data-placement="top" data-toggle="tooltip" title="">
							<button class="btn btn-primary btn-xs" data-title="add" id="add" data-toggle="modal" data-target="#add" name="${projectUserDTO.userNo}">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</span>
						
						
						<div class="clearfix"></div>
					</div>



					<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">역할</h4>
								</div>
								<form name="f" action="${pageContext.request.contextPath}/project/updateProjectUserTask" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
									<div class="modal-body">
										<div class="form-group" id="userName">
											
										</div>
										<div class="form-group">
											<input class="form-control" type="text" name="projectUserTask" id="projectUserTask" value="">
										</div>
											<input type="hidden" name="userNo" id="userNo" value="">
									</div>
									<div class="modal-footer ">
										<button type="submit" class="btn btn-warning btn-lg" id="updateBtn" style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span>수정
										</button>
									</div>
								</form>
							</div><!-- /.modal-content -->
						</div> <!-- /.modal-dialog -->
					</div>



					<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">조원 삭제하기</h4>
								</div>
								
								<form name="form" action="${pageContext.request.contextPath}/project/deleteProjectUser" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
								<div class="modal-body">
									<div class="alert alert-danger">
										<span class="glyphicon glyphicon-warning-sign"></span> 
											조원을 삭제하시겠습니까?
									</div>
										<input type="hidden" name="userNo" id="delUserNo"> 
								</div>
								
								<div class="modal-footer ">
									<button type="submit" class="btn btn-success" id="delYesBtn">
										<span class="glyphicon glyphicon-ok-sign"></span>네
									</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">
										<span class="glyphicon glyphicon-remove"></span>아뇨
									</button>
								</div>
								</form>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>


					<!-- <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">팀원추가</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
									</div>
									<div class="form-group">
						           		팀원ID : <input class="form-control"type="text" name="invitedUser"/><p></p>
									</div>
								</div>
								<div class="modal-footer ">
									<button type="button" class="btn btn-warning btn-lg" style="width: 100%;">
										<span class="glyphicon glyphicon-ok-sign"></span> Update
									</button>
								</div>
							</div>/.modal-content
						</div>/.modal-dialog
					</div>
 -->







				</div>
			</div>
		</div>
	</section>


	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>

</body>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>