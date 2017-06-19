<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>


<style>
.center {
    margin-top:50px;   
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
    	padding: 0;
	}
    
.modal-footer .btn-group button {
	height:40px;
	border-top-left-radius : 0;
	border-top-right-radius : 0;
	border: none;
	border-right: 1px solid #ddd;
}
	
.modal-footer .btn-group:last-child > button {
	border-right: 0;
}
</style>
<script>
$(document).ready(function(){
	
	$("#myModal").modal('show');
	
    $("#myBtn").click(function(){
        $("#myModal").modal('show');
    });
});
</script>
</head>
<body>
<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-8">
    <div class="address">
      <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#ordine" id="myBtn">Invia ordine</button>
    </div>
  </div>
  <div class="col-md-2"></div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">조원 점수평가</h4>
      </div>
      <div class="modal-body">
      <table>
      	<c:forEach items="${surveyUserList}" var="surveyUser" varStatus="status">
      		<tr>
      			<td>${surveyUser.userNo}</td>
      			<input type="text" threshold="zz"/>
      			<!-- <td class="star">☆</td><td class="star">☆</td><td class="star">☆</td><td class="star">☆</td><td class="star">☆</td> -->
      			<td><a href="#">[편집]</a></td>
      		</tr>
      	</c:forEach>
      </table>
      		<center>
      		<!-- <p>
			유인재 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			김정훈 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			황유정 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			김지현 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			정해찬 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p> -->
			<p>
			유인재 <input type="text" placeholder="점수를 입력하세요." /> <a href="#">[편집]</a><p>
			김정훈 <input type="text" placeholder="점수를 입력하세요." /> <a href="#">[편집]</a><p>
			황유정 <input type="text" placeholder="점수를 입력하세요." /> <a href="#">[편집]</a><p>
			김지현 <input type="text" placeholder="점수를 입력하세요." /> <a href="#">[편집]</a><p>
			정해찬 <input type="text" placeholder="점수를 입력하세요." /> <a href="#">[편집]</a><p>
			</center>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>
</body>
</html>