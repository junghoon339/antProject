<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 달력js -->
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js"></script>

<script type="text/javascript">
$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal();
    })
    
	
	$(document).on("click","#plus",function(){
		//input추가
	});
    
    
    $("#projectForm").submit(function(){
    	alert("Submitted");
    });
    $("button").click(function(){
    	$("#projectForm").submit();
    });  

    
    
    
    
})

/* $('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
}) */

</script>
<style type="text/css">
 .form-control {width:30%;}

</style>

</head>
<body>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-info btn-lg" id="popbutton">눌렁</button>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">새로운 팀플 만들기</h4>
				</div>
				<div class="modal-body">
					<div class="container" style="margin-top:30px;">
						<div class="row">
							<div class="">
						        <form name="projectForm" class="form-horizontal col-sm-7 col-sm-offset-1" action="/project/insertProject" method="post">
						        *새로운 조별과제를 만드는 분이 자동으로 조장으로 지정됩니다.<p></p>
									팀플명 : <input class="form-control" type="text" name="projectName" /><p></p>
									과목명 : <input class="form-control" type="text" name="projectSubject"/><p></p>
									교수님 : <input class="form-control" type="text" name="projectTeacher"/><p></p>
					                시작날짜:
					            	<div class="input-group registration-date-time">
					            		<input class="form-control" name="projectStartdate" id="reg|istration-date" type="date">
					            	</div><p></p>
						            종료날짜 :
						            <div class="input-group registration-date-time">
					            		<input class="form-control" name="projectEnddate" id="registration-date" type="date">
					            	</div><p></p>
					            	
						            팀원ID : <input class="form-control"type="text" name=""/><p></p>
						            <span id="plus">+</span>				            
						        </form>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger">팀플생성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>




</body>
</html>