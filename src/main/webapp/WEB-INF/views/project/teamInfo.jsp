<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
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
					<h1>팀플 정보</h1>
					<hr>
					<form name="projectForm" class="" action="${pageContext.request.contextPath}/project/updateTeamInfo" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
						<p></p>
						팀플명 : <input class="form-control" type="text" name="projectName" value="${projectDTO.projectName}" />
						<p></p>
						과목명 : <input class="form-control" type="text" name="projectSubject" value="${projectDTO.projectSubject}"/>
						<p></p>
						교수님 : <input class="form-control" type="text" name="projectTeacher" value="${projectDTO.projectTeacher}"/>
						<p></p>
						시작날짜:
						<div class="input-group registration-date-time">
							<input class="form-control" name="projectStartdate" id="reg|istration-date" type="date" value="${projectDTO.projectStartdate}">
						</div>
						<p></p>
						종료날짜 :
						<div class="input-group registration-date-time">
							<input class="form-control" name="projectEnddate" id="registration-date" type="date" value="${projectDTO.projectEnddate}">
						</div>
						<p></p>
						프로젝트 상태 :
						<select class="form-control" name="projectState">
							<option value="0">진행중</option>
							<option value="1">완료대기중</option>
							<option value="2">완료됨</option>
						</select>
						
						<p></p>
<!-- 						<div id="invitedMember">
							팀원 : <input class="form-control" type="text" name="" />
							<p></p>
						</div>

						<a href="#" class="btn btn-sm btn-default" id="addBtn"> <span
							class="glyphicon glyphicon-plus">팀원추가</span>
						</a> -->
						<br/>
						<button type="submit" class="btn btn-danger">수정</button>
					</form>

				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>

</body>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//var projectState = 
    $("select option[value='${projectDTO.projectState}']").attr("selected", true);
    
});

</script>
</html>