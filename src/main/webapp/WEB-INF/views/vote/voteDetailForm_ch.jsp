<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />

<%--     <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/css/demo.css" rel="stylesheet" />
 --%>
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
	rel="stylesheet">

<script>

var choice = 0; //선택한 라디오 벨류값
var selectChk = 0; //해당 유저가 체크를 했는지 안했는지 유무.. 0 : X, 1 : O
var writer = 0; //해당유저가 해당 투표의 글쓴이인지 유무.. 0 : X, 1 : O
var getchoice = 0; //선택했던 라디오가 무엇인지 DB에서 가져온 값을 담을 변수
var columns = new Array();

$(function() {
	if(${projectState==2}){
		$(".ifEnd").hide();
	}
	
	$(".ifEndLabel").hide();
		
	$(".regular-radio").each(function(index,item){
		columns[index] = $(item).val();
	})
	
	//초기설정 함수 init()호출
	init();
	if(${voteState}>1){
		$("#well").css("color", "gray");
		$(".ifEnd").hide();
		$(".ifEndLabel").show();
		$(".ifEndLabelDate").html("${voteEndDate}");
		$(".regular-radio").each(function(index,item){
			console.log(index+","+item);
			$(item).hide();
		})
	}
	
	$("#vote").on('click', function() {
		console.log('여기..');
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
				init();
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
			data : "voteNo="+${voteNo}+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() ,
			success : function(result) {
				if(result!='0'){
					alert("투표가 마감되었습니다.");
				}
				$(".ifEnd").hide();
				$(".ifEndLabel").show();
				$(".ifEndLabelDate").html(dateToYYYYMMDD(new Date()));
				console.log("라디오클래스 접근");
				$(".regular-radio").each(function(index,item){
					console.log(index+","+item);
					$(item).hide();
				})
				console.log("well아이디 접근");
				$("#well").css("color", "gray");
			},
			error : function(err) {
				alert("ERROR010 : " + err);
			}
		});
	})
	
})
	
function init(){
	$.ajax({
		url : "${pageContext.request.contextPath}/vote/Detail/Initialized",
		type : "post",
		dataType : "json",
		data : "voteNo="+${voteNo}+"&columns="+columns+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
		success : function(result) {
			console.log("성공햇지롱   리턴값 --->: " + result);
			
			getchoice = result.choice;
			selectChk = result.participated;
			writer = result.voteCreater;
			$("#userCount").html('<font color="#c3c3c3">참여 '+result.userCount+'</font>');
			
			$.each(result.gauge,function(index2, item2){
				$(".regular-radio").each(function(index,item){
					if(item.value==index2){
						$(item).parent().parent().next().children().children().children().css("width",(item2+"%"));
						$(item).parent().parent().next().children().next().text("　"+item2+"%");
						$(item).parent().next().next().children().next().children().text( Math.round(item2*${userCount}/100) );
					}
				})
			})
			
			if(selectChk=="0"){
				$("#vote").text("투표하기");
			}else{
				$(".regular-radio").hide();
				$(".radiTd").hide();
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
			alert("ERROR020 : " + err);
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
			data : "voteNo="+${voteNo}+"&column="+choice+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val() , // $("#voteNo").val()
			success : function(result) {
				location.reload();
				
				$(".regular-radio").hide();
				$(".radiTd").hide();
				$(".valueTd").attr('width', '90%');
				$("#vote").text("다시 투표하기");
			},
			error : function(err) {
				alert("ERROR030 : " + err);
			}
		});
	} else if( $(a).text()=='다시 투표하기') {
		$(".regular-radio").show();
		$(".radiTd").show();
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

//데이트 포멧 
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}
</script>
<style>
table {
	width: 100%;
}
td {
	height: 40px;
}

.radio-primary input[type="radio"] + label::after {
    background-color: #428bca; }
.radio-primary input[type="radio"]:checked + label::before {
    border-color: #428bca; }
.radio-primary input[type="radio"]:checked + label::after {
    background-color: #428bca; }
</style>
</head>
<body>

<!-- **************************************************************** -->
						<div id="myModal" class="modal fade in">
					        <div class="modal-dialog modal-sm">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h4 class="modal-title"><span class="ti-light-bulb"/>투표 삭제</h4>
					                </div>
					                <div class="modal-body">
					                    <h6>해당 투표를 정말 삭제하시겠습니까?</h6>
					                </div>
					                <div class="modal-footer">
					                	<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">	
					                    <button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/vote/delete?voteNo=${voteNo}'"> 확인</button> 
					                    <button class="btn btn-default" data-dismiss="modal"> 취소</button>
					                </div>
					 
					            </div><!-- /.modal-content -->
					        </div><!-- /.modal-dalog -->
					    </div><!-- /.modal -->
						
						<!-- **************************************************************** -->

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" />

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						
						<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
						<section>
						<div class="container">
							<div class="row">
						
						<div class="col-md-11">
						<div class="card" style="padding-left : 20px;padding-right: 20px;">
							<span><%@include file="header.jsp"%>
							<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"> <input type=hidden id="voteNo" value="${voteNo}" />
									<div align="right" style="vertical-align: middle;">
										<div class="btn-group">
											<button data-toggle="dropdown" class="btn btn-default btn-md dropdown-toggle" type="button">
												<span class="caret"></span></button>
											<ul class="dropdown-menu">
												<c:choose>
							                		<c:when test="${voteWriter==sessionScope.userDTO.userNo}">
							                			<c:if test="${voteState==0}">
							                    		<li><a href='${pageContext.request.contextPath}/vote/updateForm?voteNo=${voteNo}'>수정하기</a></li>
							                    		</c:if>
														<li><a data-toggle="modal" href="#myModal">삭제하기</a></li>
							                    	</c:when>
							                    	<c:otherwise>
							                    		<li><font color="gray">수정하기</font></li>
														<li><font color="gray">삭제하기</font></li>
							                    	</c:otherwise>
					                  		  </c:choose>
											</ul>
										</div>
										<p>
									</div>
									</span>
									<div class="well" ><Strong id="well">Q. <span class="ifEndLabel">[종료]</span> ${voteTitle}</Strong><p><font size="1"><span class="ifEndLabelDate"></span> <span class="ifEndLabel">마감</span></font></div>
							<p>
							<div>
								<hr>
								<!-- ★★★★★★★★★★★★★★★★★★★★ -->
								<c:forEach items="${voteDetail}" var="voteDetailList"
									varStatus="voteDetailStatus">
									<table>
										<tr>
											<td rowspan="2" width="3%"/>
											<td rowspan="2" width="10%" align="center"  class="radiTd">
											 	<input type="radio" name="radio" id="radio" class="regular-radio" value="${voteDetailList.voteDetailNo}" />
											</td>
											<td width="80%" valign="bottom" class="valueTd">${voteDetailList.voteDetailColumn}</td>
											<td width="20px">
												<span class="glyphicon glyphicon-thumbs-up"></span> 
												<font>
													<span id="colCount">0</span>
												</font>
											</td>
										</tr>
										<tr>
											<td valign="middle" align="center">
												<div class="progress progress-striped">
													<div class="progress-bar progress-bar-warning progress-bar-striped active"
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
								<span id="userCount"><font color="#c3c3c3">참여 ${userCount}</font></span><br><br>
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
									<p><br>
						</div>
						</div>
						</div></div></section>
					</div>
				</div>
			</div>

			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<%-- <c:import url="/project/chat"/> --%>
</body>

<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<%-- <script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script> --%>

<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>


<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script
	src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/demo.js"></script> --%>
</html>