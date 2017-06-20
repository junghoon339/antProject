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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
	rel="stylesheet">

<script>
	$(function(){
		alert(1);

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
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/team_sidebar_ch.jsp" />


		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />



			<div class="content">
				<div class="container-fluid">
					<div class="row">
						
						<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
						<section>
	<div class="container">
		<div class="row">
	
	<div class="col-lg-9 col-lg-offset-1">
	<%@include file="header.jsp"%>
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
						
						
					</div>
				</div>
			</div>

			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<%-- <c:import url="/project/chat"/> --%>
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