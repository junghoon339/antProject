<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
	/* 모달 */
	$(document).ready(function() {
		$("#receiveBtn").click(function(){
			location.href="${pageContext.request.contextPath}/message/main?userNo=13&flag=false";
		});
		
		$("#sendBtn").click(function(){
			location.href="${pageContext.request.contextPath}/message/main?userNo=13&flag=true";
		});
		
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
		
		
		$(document).on("click","#reply",function(){
			refresh();
			$("#messageTopEmail").val($(this).attr("name"));
		});
		
		$(document).on("click","#sendMessageBtn",function(){
			refresh();
		});
		
		function refresh(){
			$("#messageContent").attr("disabled",false);
			$("#messageContent").val("");
			
			$("#messageTopLabel").text("받을사람");
			$("#messageTopEmail").attr("readonly",false);
			$("#messageTopEmail").val("");
			
			$("#messageBottom").html('<input type="submit" id="anmelden" name="anmelden" class="btn btn-success" value="보내기">');
		}
		
		$("#messageDeleteBtn").click(function(){
			var messageNos="";
			$(":checked").each(function(index,item){
				if($(item).val()!=-1){
					messageNos+=$(item).val()+";";
				}
			});
			alert(messageNos);
			location.href="${pageContext.request.contextPath}/message/messageDelete?messageNos="+messageNos+"&flag=${flag}";
			
		});
		
		var messageNo="";
		$(document).on("click","#deleteBtn",function(){
			messageNo=$(this).attr("name")
			
		});
		
		
		$(document).on("click","#deleteYesBtn",function(){
			alert(messageNo);
			/* var flag=$("#flag").val();
			var endPage=$("#endPage").val();
			var curPage=$("#curPage").val();
			var totalRow=$("#totalRow").val();
			var rowCount=$("#rowCount").val();
			var projectState=$("#projectState").val();
			
			if(flag=="true"&&curPage==endPage){	
				if(totalRow%rowCount==1){
					curPage=curPage-1;		
				}
			} */
			
			location.href="${pageContext.request.contextPath}/message/sendCancel?messageNo="+messageNo;
			
		});
	});
	/* 모달 */
	function messageSelect(messageNo){
			//alert(messageNo);
			$.ajax({
				url:"${pageContext.request.contextPath}/message/selectMessage",
				type:"post",
				data:"messageNo="+messageNo+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val()+"&flag=${flag}",
				dataType:"json",
				success:function(re){
					//모달창을 메모읽는 창으로 바꿔줌
					
					$("#messageContent").val(re.messageContent);
					$("#messageContent").attr("disabled",true);
					$("#messageTopLabel").text("보낸사람");
					$("#messageTopEmail").val(re.userDTO.userId);
					$("#messageTopEmail").attr("readonly",true);
					var str="";
					if("${flag}"=="true"){
						str='<button data-dismiss="modal" id="anmelden" name="anmelden" class="btn btn-success">닫기</button>';
					}else{
						var str='<input type="button" id="reply" name="'+re.userDTO.userId+'" class="btn btn-success" value="답장하기"><button data-dismiss="modal" id="anmelden" name="anmelden" class="btn btn-success">닫기</button>';
					}
					$("#messageBottom").html(str);
					$("#danger").modal('show');
					
				},
				error:function(err){
					alert("에러발생 : "+err);
				}
			});
	}
	
</script>


<style type="text/css">
.modal-header-danger {
	color: #fff;
	padding: 9px 15px; border-bottom : 1px solid #eee; background-color :
	#d9534f; -webkit-border-top-left-radius : 5px;
	-webkit-border-top-right-radius : 5px; -moz-border-radius-topleft : 5px;
	-moz-border-radius-topright : 5px; border-top-left-radius : 5px;
	border-top-right-radius: 5px;
	padding: 9px 15px;
	border-bottom: 1px solid #eee;
	background-color: #d9534f;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
	border-bottom: 1px solid #eee;
	background-color: #d9534f;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
}

/* insert form */

/* insert form */
</style>
</head>
<body>
	<header> <jsp:include page="/WEB-INF/views/project/header.jsp"
		flush="false" /> </header>
	<jsp:include page="/WEB-INF/views/project/sidebar.jsp" />
	<div id="burger"></div>

	<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">

				<h1>쪽지함</h1>
				<button type="button" class="btn btn-danger btn-filter" id="messageDeleteBtn">삭제</button>
				<button type="button" class="btn btn-danger btn-filter" id="receiveBtn">받은쪽지함</button>
				<button type="button" class="btn btn-danger btn-filter" id="sendBtn">보낸쪽지함</button>
				
				<a class="btn btn-danger" href="#danger" data-toggle="modal" id="sendMessageBtn"><h4>쪽지보내기</h4></a>

				<!-- Modal -->
				<div class="modal fade" id="danger" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-header-danger">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h1>
									<i class="glyphicon glyphicon-thumbs-up"></i> 쪽지보내기
								</h1>
							</div>
							<div class="modal-body">
								<!-- 인설트 폼 -->
								
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/message/messageInsert"
									method="post">
									
									<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name ="userNoMessageSender" value="43">
									
									<fieldset>

										<!-- Form Name -->

										<!-- Text input-->
										<div class="form-group" id="messageTop">
											<label class="col-md-4 control-label" for="name"
												style="text-align: right;" id="messageTopLabel">받을사람</label>
											<div class="col-md-4">
												<input id="messageTopEmail" name="messageReceiver" type="text"
													placeholder="이메일주소를 입력해주세요" class="form-control input-md"
													required="">
													
											</div>
										</div>


										<!-- Textarea -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="anschrift">내용</label>
											<div class="col-md-4">
												<textarea class="form-control" id="messageContent"
													name="messageContent" style="width: 300px; height: 150px"
													placeholder="내용을 입력하세요"></textarea>
											</div>
										</div>



										
										<!-- Button (Double) -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="anmelden"></label>
											<div id="messageBottom" class="col-md-8">
												<input type="submit" id="anmelden" name="anmelden" class="btn btn-success" value="보내기">
											</div>
										</div>
									</fieldset>
								</form>
								
							</div>
							
							
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- Modal -->
				
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>
						<th><input type="checkbox" id="checkall" value="-1"/></th>
							<c:choose>
								<c:when test="${flag==false }">
									<th>보낸사람</th>
								</c:when>
								<c:otherwise>
									<th>받을사람</th>
								</c:otherwise>
							</c:choose>
							
							<th>내용</th>
							<c:choose>
								<c:when test="${flag==false }">
									<th>날짜</th>
								</c:when>
								<c:otherwise>
									<th>보낸날짜</th>
									<th>받은날짜</th>
									<th>발송취소</th>
								</c:otherwise>
							</c:choose>
							


							
						</thead>
						<tbody>
							<c:forEach var="messageDTO" items="${messageList}">
								<c:choose>
									<c:when test="${flag==false}">
										<!-- 받은쪽지함 -->
										<c:if test="${messageDTO.messageState!=1 }">
											<tr>
												<td><input type="checkbox" class="checkthis" name="messageNoArr" value="${messageDTO.messageNo }" /></td>
												<td>${messageDTO.userDTO.userId} (${messageDTO.userDTO.userName})</td>
												<td><a href="javascript:messageSelect(${messageDTO.messageNo });">${messageDTO.messageContent}</a></td>
												<td>${messageDTO.messageSendTime }</td>
											</tr>
										</c:if>
										
									</c:when>
									<c:otherwise>
										<!-- 보낸쪽지함 -->
										<c:if test="${messageDTO.messageState!=2 }">
											<tr>
												<td><input type="checkbox" class="checkthis" name="messageNoArr" value="${messageDTO.messageNo }" /></td>
												<td>${messageDTO.userDTO.userId} (${messageDTO.userDTO.userName})</td>
												<td><a href="javascript:messageSelect(${messageDTO.messageNo });">${messageDTO.messageContent}</a></td>
												<td>${messageDTO.messageSendTime }</td>
												
												
												<c:choose>
													<c:when test="${messageDTO.messageReceiveTime==null }">
														<td>-</td>
														<td><p data-placement="top" data-toggle="tooltip"
																title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete" id="deleteBtn"
															data-toggle="modal" data-target="#delete" name="${messageDTO.messageNo}">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
												</p></td>
													</c:when>
													<c:otherwise>
														<td>${messageDTO.messageReceiveTime }</td>
														<td>&nbsp;</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:if>
										
												
										
										
									</c:otherwise>
								</c:choose>
								
								
								
							</c:forEach>

						</tbody>

					</table>

					<div class="clearfix"></div>
					<ul class="pagination pull-right">
						<li class="disabled"><a href="#"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>
	
	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success" data-dismiss="modal" id="deleteYesBtn">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>

				</div>
			</div>
		</div>


	</section>

	<footer> <jsp:include page="/WEB-INF/views/project/footer.jsp"
		flush="false" /> </footer>

</body>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>