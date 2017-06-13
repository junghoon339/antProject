<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=0, maximum-scale=0, user-scalable=no" />

<title>jQuery Tab Module Horizontal Layout</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/room.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/tabModule.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tabModule.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		tabModule.init();
		
		$("#plusImg").click(function(){
	        $('div.modal').modal();
	    })
	    
/* 		$(document).on("click","#addMember",function(){
			//input추가
		}); */
		
		$("#addBtn").click(function() {
			var addInputbox =
				"<input class='' type='text'  name='invitedUser' placeholder='초대할 팀원을 입력하세요.'><button type='button' class='btn btn-danger' id='delMemberbtn'>삭제</button></input><p></p>";
			$("#invitedMemberDiv").append(addInputbox);
			num = num + 1 ;
		})
	    
	    $("#projectForm").submit(function(){
	    	alert("Submitted");
	    });
	    $("#insertProjectBtn").click(function(){
	    	alert("팀플생성버튼눌림");
	    	$("#projectForm").submit();
	    });  
		
	});
	
	
	
	
</script>
<style type="text/css">
 .form-control {width:30%;}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" flush="false"/>


	<h1>하아..</h1>
	<div class="demo">
		<div class="tab tab-horiz">
			<ul class="tab-legend">
				<li class="active">진행중인 팀플</li>
				<li>완료된 팀플</li>
				<li>My TimeTable</li>
				<li>My Calendar</li>
			</ul>
			<ul class="tab-content">
				<li>
					<section id="bs-pricing-six"
						class="bs-pricing-four roomy-50 bg-white fix">
						<div class="container">
							<div class="row">
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">WebProgramming
											</h3>
											<h1 class="bs-caption">
												<small>D-</small>11
											</h1>
											<!-- <ul>
												<li><b>5 GB</b> Space</li>
											</ul> -->
											<a href="${pageContext.request.contextPath}/user/teamMain" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">Hacking</h3>
											<h1 class="bs-caption">
												<small>D-</small>15
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing bg-danger">
										<div class="cotent">
											<h3 class="category">산업심리학</h3>
											<h1 class="bs-caption">
												<small>D-</small>20
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">종합설계</h3>
											<h1 class="bs-caption">
												<small>D-</small>25
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3"><!-- 플러스아이콘 -->
									<div class="bs bs-pricing">
										<div class="cotent" id="plusImg">
											<img src="${pageContext.request.contextPath}/resources/img/plus.png">
										</div>
									</div>
								</div>		
								
								
							</div><!-- row -->
						</div>
					</section>


				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>완료된 팀플안에 들어갈 내용..</h4>
				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>My TimeTable에 들어갈 내용..</h4>
				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>My Calendar에 들어갈 내용..</h4>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">새로운 팀플 만들기</h4>
				</div>
				<div class="modal-body">
					<div class="container" style="margin-top:30px;">
						<div class="row">
							<div class="">
						        <form id="projectForm" class="form-horizontal col-sm-7 col-sm-offset-1" action="${pageContext.request.contextPath}/project/insertProject" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
						        	*새로운 조별과제를 만드는 분이 자동으로 조장으로 지정됩니다.<p></p>
									팀플명 : <input class="form-control" type="text" name="projectName" /><p></p>
									과목명 : <input class="form-control" type="text" name="projectSubject"/><p></p>
									교수님 : <input class="form-control" type="text" name="projectTeacher"/><p></p>
					                시작날짜:
					            	<div class="input-group registration-date-time">
					           		<input class="form-control" name="projectStartdate" id="reg|istration-date" type="date">
					            	</div><p></p>
						            종료날짜 :
						            <div class="input-group registration-date-time">
					            		<input class="form-control" name="projectEnddate" id="registration-date" type="date">
					            	</div><p></p>
						            
						            <div id="invitedMemberDiv">
						            팀원ID : <input class="form-control"type="text" name="invitedUser"/><p></p>
						            </div>
						            
						            <!-- <span id="addMember">+</span> -->
						            <a href="#" class="btn btn-sm btn-default" id="addBtn">
										<span class="glyphicon glyphicon-plus">팀원추가</span> 
									</a> 							            
						        </form>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="insertProjectBtn">팀플생성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="footer.jsp" flush="false"/>
	
</body>

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 달력js -->
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>
</html>