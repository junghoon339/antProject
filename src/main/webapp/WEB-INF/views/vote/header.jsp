<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<script>
$(function(){
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
<button type="submit" class="btn btn-warning" id="create" title="투표 생성하기" ><span class="glyphicon glyphicon-pencil"></span></button> 
<button type="submit" class="btn btn-warning" id="list" title="투표 목록보기" ><span class="glyphicon glyphicon-align-justify"></span></button> 
<span id="blank">　</span>
</div>
<p>
</body>
</html>