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

var choice = 0; //선택한 라디오 벨류값
var selectChk = 0; //해당 유저가 체크를 했는지 안했는지 유무.. 0 : X, 1 : O
var writer = 0; //해당유저가 해당 투표의 글쓴이인지 유무.. 0 : X, 1 : O
var getchoice = 0;

	$(function() {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/vote/Detail/Initialized",
			type : "post",
			dataType : "json",
			data : "userNo=1&voteNo="+${voteNo}+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
			success : function(result) {
				console.log("성공햇지롱1   리턴값 --->: " + result);
				
				getchoice = result.choice;
				selectChk = result.participated;
				writer = result.voteCreater;
				
				if(selectChk=="0"){
					$("#vote").text("투표하기");
				}else{
					$(".radio").hide();
					$(".radioTd").hide();
					$(".valueTd").attr('width', '90%');
					$("#vote").text("다시 투표하기");
				}
				
				if((choice=="0"||choice==getchoice)&&$("#vote").text()=="투표하기"){
					console.log('조건맞음'+choice+", "+getchoice);
					$("#vote").attr('class','btn btn-lg btn-default');
					$("#vote").unbind("click");
				}
				
				if(writer=="0"){
					$("#voteEnd").hide();
					$("#vote").css('width', "100%");
				}else{
					$("#voteEnd").show();
					$("#vote").attr('width', "50%");
				}
			},
			error : function(err) {
				alert("오류 발생 : " + err);
			}
		});

		$(document).on('click', '#radio', (function() {
			
			choice = $(this).val();
			
			if(choice=="0"||choice==getchoice){
				console.log('기존거 and 없을때');
				$("#vote").attr('class','btn btn-lg btn-default');
				$("#vote").off("click");
			} else {
				console.log('다른거');
				$("#vote").attr('class','btn btn-lg btn-danger');
				$("#vote").on("click", function(){
					btnEvent(this);
				});
			}
			
			console.log(choice);
			if ($(this).attr('checked')) {
				$(this).attr('checked', false);
			} else {
				$(this).attr('checked', true);
			}
		}))

		$("#vote").click(function() {
			btnEvent(this);
		})
	})
	
	function btnEvent(a){
		console.log("완전 대박! ");
		console.log($(a).text());
		
		if( $(a).text()=='투표하기'){
			$.ajax({
				url : "${pageContext.request.contextPath}/vote/Detail/Handling",
				type : "post",
				dataType : "text",
				data : "userNo=1&voteNo="+${voteNo}+"&column="+choice+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
				success : function(result) {
					console.log("성공햇지롱2" + result);
					
					$(".radio").hide();
					$(".radioTd").hide();
					$(".valueTd").attr('width', '90%');
					$("#vote").text("다시 투표하기");
				},
				error : function(err) {
					alert("오류 발생 : " + err);
				}
			});
		} else if( $(a).text()=='다시 투표하기') {
			$(".radio").show();
			$(".radioTd").show();
			$(".valueTd").attr('width', '80%');
			$("#vote").text("투표하기");	
			
			$(".radio").each(function(index,item){
				if($(item).val()==getchoice){
					$(item).prop('checked', true);
				}
			})

			if((choice=="0"||choice==getchoice)&&$("#vote").text()=="투표하기"){
				console.log('조건맞음'+choice+", "+getchoice);
				$("#vote").attr('class','btn btn-lg btn-default');
				$("#vote").unbind("click");
				return;
			}
		}
	}
</script>
<style>
table {
	width: 100%;
}

td {
	/* border:red 2px solid; */
	height: 40px;
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
		<input type=hidden id="securityInfo" name="${_csrf.parameterName}"
			value="${_csrf.token}"> <input type=hidden id="voteNo"
			value="${voteNo}" />
		<div class="well">Q. ${voteTitle}</div>
		<p>
		<div>
			<hr>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<c:forEach items="${voteDetail}" var="voteDetailList"
				varStatus="voteDetailStatus">
				<table>
					<tr>
						<td rowspan="2" width="3%"/>
						<td rowspan="2" width="10%" align="center"  class="radioTd">
						 <input type="radio" name="voteChk" id="radio" class="radio" value="${voteDetailList.voteDetailNo}">
						</td>
						<td width="80%" valign="bottom" class="valueTd">${voteDetailList.voteDetailColumn}</td>
						<td width="20px"></td>
					</tr>
					<tr>
						<td valign="middle" align="center">
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="1" aria-valuemin="0"
									aria-valuemax="100" style="width: 0%"></div>
							</div>
						</td>
						<td valign="top">&nbsp;&nbsp;0%</td>
					</tr>
				</table>
			</c:forEach>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<br>
			<!-- if로 투표를 참여했었는지 안했었는지..확인 -->
				<a href="#" class="btn btn-lg btn-danger" id="vote" style="display:inline-block;width:49%;" >
					<span class="glyphicon glyphicon-check"> </span>투표하기
				</a> 
				<a href="#" class="btn btn-lg btn-danger" id="voteEnd" style="display:inline-block;width:50%;">
					<span class="glyphicon glyphicon-minus-sign"> </span>투표종료
				</a>
		</div>
	</div>
</body>
</html>