<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표메인</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<script>
	$(function(){

		$(".obj").mouseenter(function(){
	        $(this).css("background-color", "#e6e6e6");
	    });
		
	    $(".obj").mouseleave(function(){
	        $(this).css("background-color", "white");
	    });
	    
	    $(".obj").dblclick(function(){
	    	$(this).parent().submit();
	    });
	})
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="col-xs-12 col-md-6">
		<div class="well">
			<h4>진행중인 투표</h4>
		</div>

		<div id="doing" class="List" >
				<c:forEach items="${doingList}" var="doingList" varStatus="doingStatus">
				<form id="doingForm" action="${pageContext.request.contextPath}/vote/Detail" method="post">
				<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="voteNo" value="${doingList.voteNo}" />
					<table class="obj">
						<tr>
							<td rowspan="2" id="q"><h1>Q.</h1></td>
							<td colspan="2">${doingList.voteNo}.${doingList.voteTitle}</td>
						</tr>
						<tr>
							<td id="attribute" width="50"><c:choose>
									<c:when test="${userCount!=0}">${userCount}</c:when>
									<c:otherwise>0</c:otherwise>
								</c:choose> 명 참여</td>
							<td id="attribute"><c:choose>
									<c:when test="${state==0}">미참여</c:when>
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
				<form id="doneForm" action="${pageContext.request.contextPath}/vote/Detail">
				<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="voteNo" value="${doneList.voteNo}" />
				<table class="obj">
					<tr>
						<td rowspan="2" id="q"><h1>Q.</h1></td>
						<td colspan="2">${doneList.voteNo}. ${doneList.voteTitle} </td>
					</tr>
					<tr>
						<td id="attribute" width="50">
						<c:choose>
						<c:when test="${userCount!=0}">${userCount}</c:when>
						<c:otherwise>0</c:otherwise>
						</c:choose>
						명 참여
						</td>
						<td id="attribute">
						<c:choose>
						<c:when test="${state==0}">미참여</c:when>
						<c:otherwise>참여완료</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" id="attribute">${doneList.voteEndDate}</td>
					</tr>
					</table>
					</form>
					<hr>
				</c:forEach>
		</div>
		<p>
	</div>
</body>
</html>