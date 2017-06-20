<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath }/resources/css/animate.min.css"
	rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
	rel="stylesheet" />

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
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/admin/admin-sidebar_ch.jsp" />


		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" />



			<div class="content">
				<div class="container-fluid">
					<div class="row">
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
			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<%-- <c:import url="/project/chat"/> --%>
</body>

<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>

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