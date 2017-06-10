<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표생성</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
	
		var num=4;
		
		$("#insert").click(function(){
			
			/* console.log( $("input name[voteTitle]").text() );
			if( $("input name[voteTitle]").text()=="" ){
				alert("투표 제목을 입력해주세요.");
			} */
			
			/* else if( $("input name[option]").text()=="" ){
				alert("투표 항목을 2개이상 입력해주세요.");
			} */
			
			$("#createForm").submit();
			
		})
		
		//**************************************************************************8
		
		var checked = true;
		
		$("#datepicker").datepicker();

		$("#addBtn").click(function() {
			
			var code = "<input type='text' class='form-control' name='option"+num+"' placeholder='항목을 입력하세요.''/><p>";
			$("#addArticle").append(code);
			num = num + 1 ;
		})

		$("#dateCheck").click(function() {

			if (checked) {
				checked = false;
				$("#datepicker").prop("disabled", false);
			} else {
				checked = true;
				$("#datepicker").prop("disabled", true);
			}
		})

	});
</script>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="col-lg-6">
		<div class="well well-lg">
			<div class="form-group" style="padding: 12px;">
				<form action="${pageContext.request.contextPath}/vote/Create" id="createForm">
					투표 제목
					<p>
						<input type="text" class="form-control" name="voteTitle" value="e" placeholder="제목을 입력하세요." />
					<p>항목 입력
					<p>
						<input type="text" class="form-control" name="option1"
							placeholder="항목을 입력하세요." />
					<p>
						<input type="text" class="form-control" name="option2"
							placeholder="항목을 입력하세요." />
					<p>
						<input type="text" class="form-control" name="option3"
							placeholder="항목을 입력하세요." />
					<p>
					<div id="addArticle"></div>
					<a href="#" class="btn btn-sm btn-default" id="addBtn"><span
						class="glyphicon glyphicon-plus"></span> </a> <font size="2"
						color="#b5bab8">항목 추가</font><br> <br> 마감시간 설정
					<p>
						<input type="checkbox" id="dateCheck"> <input type="text"
							id="datepicker" disabled="disabled">
					<p>기타옵션
					<p>
						<input type="checkbox"> 복수선택
					<p>
						<input type="checkbox"> 익명투표
					<p>
						<input type="checkbox"> 선택항목 추가 허용
					<p>

						<a href="#" class="btn btn-lg btn-warning" id="insert">등록</a> 
						<a href="#" class="btn btn-lg btn-default" id="cancel">취소</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>