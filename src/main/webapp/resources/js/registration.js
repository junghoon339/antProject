$("#email").keyup(function() {
	$.ajax({
		url : '${pageContext.request.contextPath}/user/registrationCheck',
		type : 'POST',
		data : 'userId'+$(this).val(),
		dataType : 'text',
		success : function(result) {
			if (result == 0) {
				console.log('사용 가능한 id.');
				// 체크버튼을 띄워준다
			}  else {
				colsole.log('사용 불가~~!');
				// x버튼
			}
		}
	});
});