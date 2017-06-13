<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	$(document).ready(function() {
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
		
		var userNo="";
		$(document).on("click","#deleteBtn",function(){
			userNo=$(this).attr("name")
			
		});
		
		$(document).on("click","#deleteYesBtn",function(){
			var flag=$("#flag").val();
			var endPage=$("#endPage").val();
			var curPage=$("#curPage").val();
			var totalRow=$("#totalRow").val();
			var rowCount=$("#rowCount").val();
			
			if(flag=="true"&&curPage==endPage){	
				if(totalRow%rowCount==1){
					curPage=curPage-1;
				}	
			}
			location.href="${pageContext.request.contextPath}/admin/user/delete?userNo="+userNo+"&pageNumber="+curPage;
			
			
		});
		
	});
</script>
</head>


<body>
	<header>
		<jsp:include page="/WEB-INF/views/project/header.jsp" flush="false" />
	</header>
	<jsp:include page="/WEB-INF/views/admin/admin-sidebar.jsp" />
	<div id="burger"></div>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<h2>회원 관리</h2>
					<br/><br/>
					
					<div class="table-responsive">


						<table id="mytable" class="table table-bordred table-striped">

							<thead>

								<th>ID</th>
								<th>이름</th>
								<th>학교</th>
								<th>전공</th>
								<th>진행중 프로젝트</th>
								<th>완료된 프로젝트</th>
								<th>&nbsp;</th>


							</thead>
							<tbody>

								<c:choose>
									<c:when test="${userList.size()!=0 }">
										<c:forEach items="${userList}" var="userDTO">
											<tr>
												<td>${userDTO.userId }</td>
												<td>${userDTO.userName }</td>
												<td>${userDTO.userSchool }</td>
												<td>${userDTO.userMajor }</td>
												<%-- <c:set var="ingCount" scope="page" value="${0}"/>
												<c:set var="doneCount" scope="page" value="${0}"/>
												<c:if test="${userDTO.listProjectUserDTO!=null }">
													<c:forEach items="${userDTO.listProjectUserDTO }" var="projectUserDTO">
														<c:choose>
															<c:when test="${projectUserDTO.projectDTO.projectState==0 }">
																<c:set var="ingCount" scope="page" value="${ingCount+1 }"/>
															</c:when>
															<c:otherwise>
																<c:set var="doneCount" scope="page" value="${doneCount+1 }"/>
															</c:otherwise>
														</c:choose>
													
													</c:forEach>
												</c:if>
												
												<td><c:out value="${ingCount }"/> </td>
												<td><c:out value="${doneCount }"/></td> --%>
												<td>${userDTO.doingProject }</td>
												<td>${userDTO.doneProject }</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete" id="deleteBtn"
															data-toggle="modal" data-target="#delete" name="${userDTO.userNo}">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>
										</c:forEach>
										
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div style="text-align:center">
						<ul class="pagination" >
							<c:choose>
								<c:when test="${startPage==1 }">
									<li class="disabled"><a href="#"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath }/admin/user?pageNumber=${startPage-pageSu }"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${startPage }" end="${endPage }" var="pageNumber" step="1">
								<li class="active"><a href="${pageContext.request.contextPath }/admin/user?pageNumber=${pageNumber}">${pageNumber }</a></li>
							</c:forEach>
							
							<c:choose>
								<c:when test="${flag==true }">
									<li class="disabled"><a href="#"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath }/admin/user?pageNumber=${startPage+pageSu }"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
								</c:otherwise>
							</c:choose>
							
						</ul>
						</div>
						<input type="hidden" id="flag" value="${flag }"/>
						<input type="hidden" id="curPage" value="${curPage }"/>
						<input type="hidden" id="endPage" value="${endPage }"/>
						<input type="hidden" id="totalRow" value="${totalRow }"/>
						<input type="hidden" id="rowCount" value="${rowCount }"/>
					</div>

				</div>
			</div>
		</div>


		<!-- <div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Edit Your
							Detail</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input class="form-control " type="text" placeholder="Mohsin">
						</div>
						<div class="form-group">

							<input class="form-control " type="text" placeholder="Irshad">
						</div>
						<div class="form-group">
							<textarea rows="2" class="form-control"
								placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


						</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> Update
						</button>
					</div>
				</div>
				/.modal-content
			</div>
			/.modal-dialog
		</div> -->



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






	<footer>
		<jsp:include page="/WEB-INF/views/project/footer.jsp" flush="false" />
	</footer>

</body>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>