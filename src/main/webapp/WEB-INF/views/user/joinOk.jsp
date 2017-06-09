<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>가입된 정보</h2>
	<table style="width: 600px; border-bottom-width: 1px;" >
		<tr>
			<td width="100">ID</td>
			<td>${requestScope.userDTO.userId}</td>
		</tr>
		<!-- tr>
			<td>Password</td>
			<td>${requestScope.member.password}</td>
		</tr-->
		<tr>
			<td>이름</td>
			<td>${requestScope.userDTO.userName}</td>
		</tr>
	</table>
	
	<a href="${pageContext.request.contextPath}/">메인으로</a>
</body>
</html>