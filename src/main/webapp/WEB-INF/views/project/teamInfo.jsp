<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
$(function(){
	
	
	$("#Btn").click(function(){
		
		if($("select[name='projectState']").val()=='1'){
			$.ajax({
				url : "${pageContext.request.contextPath}/survey/",
				type : "post",
				dataType : "json",
				data : "projectNo=1&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() ,
				success : function(result) {
					
					var str = "";
					$.each(result, function(index, item){
						str += '<tr width="100%">';
						str +='<td name="nameTd" width="50%"><center>'+item.userName+'</center></td>';
						str +='<td name="scoreTd" width="15%"><input type="text" placeholder="점수를 입력해주세요." value=""/></td>';
						str +='<td name="updateTd" width="35%"><a href="#"><center>완료</center></a></td>';
						str +='</tr>';
					})
					$("#print").html(str);
					$("#myModal").modal('show');
					
				},
				error : function(err) { alert("teamInfo.jsp ERROR : "+err); }
			});
		}
	})
})
</script>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" flush="false" />
	</header>
	<jsp:include page="sidebar.jsp" />
	<div id="burger"></div>


	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<h1>팀플 정보</h1>
					<hr>
					<form name="projectForm" class="" action="${pageContext.request.contextPath}/project/updateTeamInfo" method="post">
						<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}" >
						<p></p>
						팀플명 : <input class="form-control" type="text" name="projectName" value="${projectDTO.projectName}" />
						<p></p>
						과목명 : <input class="form-control" type="text" name="projectSubject" value="${projectDTO.projectSubject}"/>
						<p></p>
						교수님 : <input class="form-control" type="text" name="projectTeacher" value="${projectDTO.projectTeacher}"/>
						<p></p>
						시작날짜:
						<div class="input-group registration-date-time">
							<input class="form-control" name="projectStartdate" id="reg|istration-date" type="date" value="${projectDTO.projectStartdate}">
						</div>
						<p></p>
						종료날짜 :
						<div class="input-group registration-date-time">
							<input class="form-control" name="projectEnddate" id="registration-date" type="date" value="${projectDTO.projectEnddate}">
						</div>
						<p></p>
						프로젝트 상태 :
						<select class="form-control" name="projectState">
							<option value="0">진행중</option>
							<option value="1">완료대기중</option>
							<option value="2">완료됨</option>
						</select>
						
						<p></p>
<!-- 						<div id="invitedMember">
							팀원 : <input class="form-control" type="text" name="" />
							<p></p>
						</div>

						<a href="#" class="btn btn-sm btn-default" id="addBtn"> <span
							class="glyphicon glyphicon-plus">팀원추가</span>
						</a> -->
						<br/>
						<button type="submit" class="btn btn-danger">수정</button> 
						<button type="button" class="btn btn-danger" id="Btn">마감하기</button>
					</form>

				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" style="width:400px;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">조원 점수평가</h4>
      </div>
      <div class="modal-body">
      <table>
      		<div id="print">
      			
      		</div>
      </table>
      		<%-- <center>
      		<p>
			유인재 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			김정훈 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			황유정 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			김지현 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			정해찬 <font color="orange">☆☆☆☆☆</font> <a href="#">[편집]</a><p>
			</center> --%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>

  </div>
</div>

</body>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//var projectState = 
    $("select option[value='${projectDTO.projectState}']").attr("selected", true);
    
});

</script>
</html>