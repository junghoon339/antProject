<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표상세</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	
	$(function() {

		$(document).on('click', '#radio', (function() {
			
			if ( $(this).attr('checked') ) {
				 $(this).attr('checked', false); 
			} else {
				$(this).attr('checked', true); 
			}
		}))
	})
</script>
<style>
table{
	width:100%;
}
td{
	/* border:red 2px solid; */
	height:40px;
}
.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="col-xs-10 col-md-6">
		<div class="well">Q. ${voteTitle}</div>
		<p>
		<div>
			<hr>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<c:forEach items="${voteDetail}" var="voteDetailList" varStatus="voteDetailStatus">
				<table>
					<tr>
						<td rowspan="2" width="10%" align="center">
						<input type="radio" name="voteChk" id="radio" value="${voteDetailList.voteDetailColumn}" >
						</td>
						<td width="80%" valign="bottom">${voteDetailList.voteDetailColumn}</td>
						<td width="20px"></td>
					</tr>
					<tr>
						<td  valign="middle" align="center">
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="1" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
								</div>
							</div>
						</td>
						<td valign="top">10%</td>
					</tr>
				</table>
			</c:forEach>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<br>
				<!-- if로 투표를 참여했었는지 안했었는지..확인 -->
				<a href="#" class="btn btn-lg btn-danger" id="vote"><span class="glyphicon glyphicon-check"></span> 투표하기</a> 
				<a href="#" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-minus-sign"></span> 투표종료</a>
		</div>
	</div>
</body>
</html>