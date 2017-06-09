<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표메인a</title>
<style>
table {
	width: 100%;
}

#q {
	width: 70px;
	text-align: center;
}

#doingList {
	height: 60px;
}

#doneList {
	height: 80px;
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
	<%@include file="header.jsp"%>
	<div class="col-xs-12 col-md-6">
		<div class="well">
			<h4>진행중인 투표</h4>
		</div>

		<div class="doingList">
			<table>
				<c:forEach items="${doingList}" var="doingList" varStatus="doingStatus">
					<tr>
						<td rowspan="2" id="q"><h1>Q.</h1></td>
						<td colspan="2">투표제목 ${doingList.voteTilte} </td>
					</tr>
					<tr>
						<td id="attribute" width="50">0명 참여</td>
						<td id="attribute">참여완료</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</div>


		<div class="well">
			<h4>종료된 투표</h4>
		</div>
		<div class="doneList">
			<table>
				<c:forEach items="${doneList}" var="doneList" varStatus="doneStatus">
					<tr>
						<td rowspan="2" id="q"><h1>Q.</h1></td>
						<td colspan="2">투표제목</td>
					</tr>
					<tr>
						<td id="attribute" width="50px">0명 참여</td>
						<td id="attribute">참여완료</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" id="attribute">2017년 00월 00일 (일) 오후 5:11 마감</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</div>
	</div>
</body>
</html>