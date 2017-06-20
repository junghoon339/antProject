<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />

<%--     <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/css/demo.css" rel="stylesheet" />
 --%>
<!--  Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/resources/css/themify-icons.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		//tabModule.init();
		
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
	    	alert("새로운 조별과제가 등록되었습니다.");
	    }); 
	    $("#insertProjectBtn").click(function(){
	    	//alert("팀플생성버튼눌림");
	    	if(check()==true) $("#projectForm").submit();
	    	
	    });  
		
	});
	
	function check() {
		  if(fr.projectName.value == "") {
		    alert("조별과제명을 입력해 주세요.");
		    fr.projectName.focus();
		    return false;
		  }
		  else if(fr.projectSubject.value == "") {
		    alert("과목명을 입력해 주세요.");
		    fr.projectSubject.focus();
		    return false;
		  }
		  else if(fr.projectTeacher.value == "") {
		    alert("교수님 성함을 입력해 주세요.");
		    fr.projectTeacher.focus();
		    return false;
		  }
		  else if(fr.projectStartdate.value == "") {
		    alert("조별과제 시작날짜를 입력해 주세요.");
		    fr.projectStartdate.focus();
		    return false;
		  }
		  else if(fr.projectEnddate.value == "") {
		    alert("조별과제 종료날짜를 입력해 주세요.");
		    fr.projectEnddate.focus();
		    return false;
		  }
		  else return true;
		}

</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />

		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<c:choose>
							<c:when test="${empty currentProList}"><!-- 진행중인 조별과제가 없으면 -->
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h4>진행중인 조별과제가 없습니다.</h4>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise><!-- 진행중인 조별과제가 있으면 -->
								<c:forEach items="${surveyingProList}" var="projectDTO">
											<div class="col-md-3">
												<div class="bs bs-pricing">
													<div class="cotent">
														<h3 class="category">${projectDTO.projectName}</h3>
														<a href="#" style="color:#BCE55C;">설문조사해라</a>
														<h1 class="bs-caption">
															<small>D-</small>${projectDTO.dday}
														</h1>
														<a href="${pageContext.request.contextPath}/project/teamMain/${projectDTO.projectNo}" class="btn btn-danger">Enter</a>
													</div>
												</div>
											</div>
								</c:forEach>
								<c:forEach items="${currentProList}" var="projectDTO">
									<div class="col-md-3">
										<div class="bs bs-pricing">
											<div class="cotent">
												<h3 class="category">${projectDTO.projectName}</h3>
												<h1 class="bs-caption">
													<small>D-</small>${projectDTO.dday}
												</h1>
												<a href="${pageContext.request.contextPath}/project/teamMain/${projectDTO.projectNo}"
													class="btn btn-danger">Enter</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="col-md-3"><!-- 플러스아이콘 -->
							<div class="bs bs-pricing">
								<div class="cotent" id="plusImg">
									<img src="${pageContext.request.contextPath}/resources/img/plus.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="footer_ch.jsp" flush="false" />


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
					<h4 class="modal-title" id="myModalLabel">새로운 조별과제 등록</h4>
				</div>
				<div class="modal-body">
					<div class="container" style="margin-top:10px;">
						<div class="row">
							<div class="">
						        <form id="projectForm" name="fr" class="form-horizontal col-sm-7 col-sm-offset-1" action="${pageContext.request.contextPath}/project/insertProject" method="post">
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
					<button type="button" class="btn btn-danger" id="insertProjectBtn">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

</body>

<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>


<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script
	src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/demo.js"></script> --%>
</html>