<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개미와 베짱이, 대학조별과제 관리시스템</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />

<script>
	$(function(){
		$(".obj").mouseenter(function(){
	        $(this).css("background-color", "#fff4f4");
	    });
		
	    $(".obj").mouseleave(function(){
	        $(this).css("background-color", "white");
	    });
	    
	    $(".obj").dblclick(function(){
	    	$(this).parent().submit();
	    });
	})
</script>
<style>
table {
	width: 100%;
}

#q {
	width: 70px;
	text-align: center;
}

#doing, #done {
	
}

td {
	/* border: 2px blue solid; */
	/* margin: 5px 0; */
	
}

#attribute {
	color: gray;
	font-size: x-small;
}
</style>
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
		<div class="well">
			<h4>진행중인 투표</h4>
		</div>

		<div id="doing" class="List" >
				<c:forEach items="${doingList}" var="doingList" varStatus="doingStatus">
				<form class="doingForm" id="doingForm" action="${pageContext.request.contextPath}/vote/Detail" method="post">
				<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="voteNo" id="voteNo" value="${doingList.voteNo}" />
					<input type="hidden" name="userNo" id="userNo" value="${userNo}" />
					<input type="hidden" name="userCount" value="${doingList.userCount}"/>
					<table class="obj">
						<tr>
							<td rowspan="2" id="q"><h1>Q.</h1></td>
							<td colspan="2">${doingStatus.count}.${doingList.voteTitle}</td>
						</tr>
						<tr>
							<td id="attribute" width="50"><c:choose>
									<c:when test="${doingList.userCount!=0}">${doingList.userCount}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose> 명 참여</td>
							<td id="attribute"><c:choose>
									<c:when test="${doingList.state==false}">미참여</c:when>
									<c:otherwise>참여완료</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</form>
					<hr>
				</c:forEach>
		</div>

		<div class="well">
			<h4>종료된 투표</h4>
		</div>
		<div id="done" class="List">
		
				<c:forEach items="${doneList}" var="doneList" varStatus="doneStatus">
				<form class="doneForm" id="doneForm" action="${pageContext.request.contextPath}/vote/Detail">
				<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="voteNo" value="${doneList.voteNo}" />
				<input type="hidden" name="userNo" id="userNo" value="${userNo}" />
				<input type="hidden" name="userCount" value="${doneList.userCount}"/>
				<table class="obj">
					<tr>
						<td rowspan="2" id="q"><h1>Q.</h1></td>
						<td colspan="2">${doneStatus.count}. ${doneList.voteTitle} </td>
					</tr>
					<tr>
						<td id="attribute" width="50">
						<c:choose>
						<c:when test="${doneList.userCount!=0}">${doneList.userCount}</c:when>
									<c:otherwise>0</c:otherwise>
						</c:choose>명 참여</td>
						<td id="attribute">
						<c:choose>
									<c:when test="${doneList	.state==false}">미참여</c:when>
									<c:otherwise>참여완료</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" id="attribute">투표 마감 ${doneList.voteEndDate}</td>
					</tr>
					</table>
					</form>
					<hr>
				</c:forEach>
		</div>
		<p>
	</div>
	</div></div>
	</section>
	<footer> 
		<jsp:include page="/WEB-INF/views/project/footer.jsp" flush="false" /> 
	</footer>
</body>
</html>