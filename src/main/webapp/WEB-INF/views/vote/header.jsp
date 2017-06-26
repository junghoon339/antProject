<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개미와 베짱이, 대학조별과제 관리시스템</title>
</head>
<script>
$(function(){
	if(${projectState==2}){
		$("button").prop('disabled', true);
	}
	
	$("#create").click(function(){
		location.href="${pageContext.request.contextPath}/vote/CreateForm?"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val();
	})
	
	$("#list").click(function(){
		location.href="${pageContext.request.contextPath}/vote/?userNo=1";
	})
})
</script>
<body>
<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"> <input type=hidden id="voteNo" value="${voteNo}" />
<br>
<div align="right">
<button type="submit" class="btn btn-default" id="create" title="투표 생성하기" ><span class="glyphicon glyphicon-pencil"></span></button> 
<button type="submit" class="btn btn-default" id="list" title="투표 목록보기" ><span class="glyphicon glyphicon-align-justify"></span></button> 
<span id="blank"></span>
<hr>
</div>
<p>
</body>
</html>