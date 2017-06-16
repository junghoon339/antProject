<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투표상세</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script>

var choice = 0; //선택한 라디오 벨류값
var selectChk = 0; //해당 유저가 체크를 했는지 안했는지 유무.. 0 : X, 1 : O
var writer = 0; //해당유저가 해당 투표의 글쓴이인지 유무.. 0 : X, 1 : O
var getchoice = 0; //선택했던 라디오가 무엇인지 DB에서 가져온 값을 담을 변수
var columns = new Array();

$(function() {
	
	$(".ifEndLabel").hide();
		
	$(".radio").each(function(index,item){
		columns[index] = $(item).val();
	})
	
	alert(${voteState});
	if(${voteState}==1){
		$(".ifEnd").hide();
		$(".ifEndLabel").show();
		$(".ifEndLabelDate").text(${voteEndDate});
	}
	
	//초기설정 함수 init()호출
	init();
		
	$("#vote").on('click', function() {
		console.log('여기..1');
		btnEvent(this);
	})
	
	$(document).on('click', '#radio', (function() {
		choice = $(this).val();
	
		if(choice=="0"||choice==getchoice){
			console.log('선택된 라디오버튼이 없거나, 기존에 선택했던 라디오버튼일 시,');
			$("#vote").attr('class','btn btn-lg btn-default');
			$("#vote").off("click");
		} else {
			console.log('새로운 라디오버튼을 선택했음');
			$("#vote").attr('class','btn btn-lg btn-danger');
			$("#vote").on("click", function(){
				console.log('여기..2');
				btnEvent(this);
				return;
			});
		}
			
		console.log(choice);
		if ($(this).attr('checked')) {
			$(this).attr('checked', false);
		} else {
			$(this).attr('checked', true);
		}
	}))

	$("#voteEnd").click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/vote/Detail/endVote",
			type : "post",
			dataType : "json",
			data : "userNo=1&voteNo="+${voteNo}+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() ,
			success : function(result) {
				if(result!='0'){
					alert("투표가 마감되었습니다.")
				}
				$(".ifEnd").hide();
				$(".ifEndLabel").show();
			},
			error : function(err) {
				alert("오류 발생 이니셜라이즈 : " + err);
			}
		});
	})
})
	
function init(){
	$.ajax({
		url : "${pageContext.request.contextPath}/vote/Detail/Initialized",
		type : "post",
		dataType : "json",
		data : "userNo=1&voteNo="+${voteNo}+"&columns="+columns+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
		success : function(result) {
			console.log("성공햇지롱1   리턴값 --->: " + result);
			
			getchoice = result.choice;
			selectChk = result.participated;
			writer = result.voteCreater;
			
			$.each(result.gauge,function(index2, item2){
				$(".radio").each(function(index,item){
					if(item.value==index2){
						$(item).parent().parent().next().children().children().children().css("width",(item2+"%"));
						$(item).parent().parent().next().children().next().text("　"+item2+"%");
					}
					  console.log(index+","+item.value+", "+index2+", "+item2)
				})
			})
			
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
			alert("오류 발생 이니셜라이즈 : " + err);
		}
	});
};
	
function btnEvent(a){
	console.log($(a).text());
	if( $(a).text()=='투표하기'){
		$.ajax({
			url : "${pageContext.request.contextPath}/vote/Detail/Handling",
			type : "post",
			dataType : "text",
			data : "userNo=1&voteNo="+${voteNo}+"&column="+choice+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
			success : function(result) {
				location.reload();
				console.log("성공햇지롱2" + result);
				
				$(".radio").hide();
				$(".radioTd").hide();
				$(".valueTd").attr('width', '90%');
				$("#vote").text("다시 투표하기");
			},
			error : function(err) {
				alert("오류 발생ㅋㅋㄴ : " + err);
			}
		});
	} else if( $(a).text()=='다시 투표하기') {
		$(".radio").show();
		$(".radioTd").show();
		$(".valueTd").attr('width', '80%');
		$("#vote").text("투표하기");	

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
<header> 
		<jsp:include page="/WEB-INF/views/project/header.jsp" flush="false" />
	</header>
	<jsp:include page="/WEB-INF/views/project/sidebar.jsp" />
	<div id="burger"></div>
	<section>
	<div class="container">
		<div class="row">
	<%@include file="header.jsp"%>
	
	<!-- **************************************************************** -->
	
	<div id="myModal" class="modal fade in">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
 
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                </div>
                <div class="modal-body">
                    <h4>글을 삭제하시겠습니까?</h4>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning"> 확인</button> 
                    <button class="btn btn-default" data-dismiss="modal"> 취소</button>
                </div>
 
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dalog -->
    </div><!-- /.modal -->
	
	<!-- **************************************************************** -->
	
	<div class="col-lg-9 col-lg-offset-2">
		<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"> <input type=hidden id="voteNo" value="${voteNo}" />
				<div align="right" style="vertical-align: middle;">
					<div class="btn-group">
						<button data-toggle="dropdown" class="btn btn-default btn-md dropdown-toggle" type="button">
							<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="#">수정하기</a></li>
							<li><a data-toggle="modal" href="#myModal">삭제하기</a></li>
						</ul>
					</div>
					<p>
				</div>
				<div class="well">Q.<span class="ifEndLabel">[종료]</span> ${voteTitle}<span class="ifEndLabelDate"></span></div>
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
					<tr>
						<td colspan="4">
							<hr>
						</td>
					</tr>
				</table>
			</c:forEach>
			<font color="#c3c3c3">참여 ${userCount}</font><br><br>
			<!-- ★★★★★★★★★★★★★★★★★★★★ -->
			<br>
			<!-- if로 투표를 참여했었는지 안했었는지..확인 -->
					<span class="ifEnd">
						<a href="#" class="btn btn-lg btn-danger" id="vote" style="display: inline-block; width: 49%;"> 
						<span class="glyphicon glyphicon-check"> </span>투표하기</a>
						<a href="#" class="btn btn-lg btn-danger" id="voteEnd" style="display: inline-block; width: 50%;"> 
						<span class="glyphicon glyphicon-minus-sign"> </span>투표종료</a>
					</span>
				</div>
	</div>
	</div></div></section>
	<footer> 
		<jsp:include page="/WEB-INF/views/project/footer.jsp" flush="false" /> 
	</footer>
</body>
</html>