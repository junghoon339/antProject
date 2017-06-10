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
	$(function(){
		$("input type[checkbox]").select(function(){
			
		})
	})
</script>
<style>
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="col-xs-6 col-md-6">
	
		<div class="well">Q. ${voteTitle}</div>
		<p>
		<div>
			<hr>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<c:forEach items="${voteJoinList}" var="voteJoinList" varStatus="voteJoinStatus">
			 ${voteJoinList.voteDetailColumn}
			<p>
			
			<div class="col-xs-1 col-md-6">
				<div class="funkyradio">
					<div class="funkyradio-warning">
						<input type="checkbox" name="checkbox" id="checkbox5" checked />
					</div>
				</div>
			</div>
			<div class="progress progress-striped">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
					style="width: 80%">
					<span class="sr-only">80%</span>
				</div>
			</div>
			<p>
			</c:forEach>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
				2. ${option2}어딜가야 할가~<br>
			<p>
			<div class="col-xs-1 col-md-6">
				<div class="funkyradio">
					<div class="funkyradio-warning">
						<input type="checkbox" name="checkbox" id="checkbox5" checked />
					</div>
				</div>
			</div>
			<div class="progress progress-striped">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
					style="width: 35%">
					<span class="sr-only">80%</span>
				</div>
			</div>
			<hr>
			<p>
				<!-- if로 투표를 참여했었는지 안했었는지..확인 -->
				<a href="#" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-check"></span> 투표하기</a> 
				<a href="#" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-minus-sign"></span> 투표종료</a>
		</div>
		



	</div>
</body>
</html>