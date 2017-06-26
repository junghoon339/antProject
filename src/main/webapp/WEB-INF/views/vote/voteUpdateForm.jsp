<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개미와 베짱이, 대학조별과제 관리시스템</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script>
	$(function() {

		$("#insert").click(function(){
			alert($("input name[voteTitle]").text());
			
			$("#createForm").submit();
		})
		
		//**************************************************************************8
		var checked = true;
		
		$("#datepicker").datepicker();

		$("#addBtn").click(function() {
			
			var code = "<input type='text' class='form-control' name='chk' placeholder='항목을 입력하세요.''/><p>";
			$("#addArticle").append(code);
		})

		$("#dateCheck").click(function() {

			if (checked) {
				checked = false;
				$("#datepicker").prop("disabled", false);
			} else {
				checked = true;
				$("#datepicker").prop("disabled", true);
			}
		})

	});
</script>
</head>
<body>
<header> 
		<jsp:include page="/WEB-INF/views/project/header.jsp" flush="false" />
	</header>
	<jsp:include page="/WEB-INF/views/project/sidebar.jsp" />
	<div id="burger"></div>
	<section>
	<div class="container">
		<div class="row">
<%@include file="header.jsp"%>

	<div class="col-lg-9 col-lg-offset-2">
		<div class="well well-lg">
			<div class="form-group" style="padding: 12px;">
				<form action="${pageContext.request.contextPath}/vote/update" id="createForm" method="post">
					<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="userNo" value="${sessionScope.userDTO.userNo}" />
					<input type="hidden" name="projectNo" value="${sessionScope.projectNo}" />
					<input type="hidden" name="voteNo" value="${vote.voteNo}" />
					투표 제목<p>
					<input type="text" class="form-control" name="voteTitle" placeholder="제목을 입력하세요." value="${vote.voteTitle}" disabled="disabled"/><p>
					항목 입력
					<div id="addArticle"><p>
						<c:forEach items="${voteDetailList}" var="detail" varStatus="colStatus">
						<input type="text" class="form-control" name="chk" placeholder="항목을 입력하세요."  value="${detail.voteDetailColumn}" disabled="disabled"/><p>
						</c:forEach>
					</div>
					<a href="#" class="btn btn-sm btn-default" id="addBtn">
						<span class="glyphicon glyphicon-plus"></span> 
					</a> 
					<font size="2" color="#b5bab8">항목 추가</font><br><br>
					마감시간 설정<p>
					<input type="checkbox" id="dateCheck" disabled="disabled"> <input type="text" id="datepicker" name="voteEndDate" value="${vote.voteEndDate}" disabled="disabled"><p>
					기타옵션<p>
					<input type="checkbox" name="" disabled="disabled"/> 복수선택<p>
					<input type="checkbox" name="" disabled="disabled"/> 익명투표<p>
					<input type="checkbox" name="" disabled="disabled"/> 선택항목 추가 허용<p>

					<a href="#" class="btn btn-lg btn-warning" id="insert">등록</a> 
					<a href="#" class="btn btn-lg btn-default" id="cancel">취소</a>
				</form>
			</div>
		</div>
	</div>
	</div></div></section>
	<footer> 
		<jsp:include page="/WEB-INF/views/project/footer.jsp" flush="false" /> 
	</footer>
</body>
</html>