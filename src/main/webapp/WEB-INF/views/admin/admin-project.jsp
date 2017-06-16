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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/admin/css/adminSearch.css"/>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#done").click(function(){
			location.href="${pageContext.request.contextPath}/admin/adminProject?projectState=1";
		});
		
		$("#doing").click(function(){
			location.href="${pageContext.request.contextPath}/admin/adminProject?projectState=0";
		});

		$("[data-toggle=tooltip]").tooltip();
		
		var userNo="";
		$(document).on("click","#deleteBtn",function(){
			userNo=$(this).attr("name")
			
		});
		
		
		$(document).on("click","#deleteYesBtn",function(){
			alert(userNo);
			var flag=$("#flag").val();
			var endPage=$("#endPage").val();
			var curPage=$("#curPage").val();
			var totalRow=$("#totalRow").val();
			var rowCount=$("#rowCount").val();
			var projectState=$("#projectState").val();
			
			if(flag=="true"&&curPage==endPage){	
				if(totalRow%rowCount==1){
					curPage=curPage-1;		
				}
			}
			
			location.href="${pageContext.request.contextPath}/admin/project/delete?projectNo="+parseInt(userNo)+"&pageNumber="+curPage+"&projectState="+parseInt(projectState);
			
			
		});
		
		$("#searchBtn").click(function(){
			var projectState=$("#projectState").val();
			if($("#category").val()!=-1){
				location.href="${pageContext.request.contextPath}/admin/adminProject/?categoryNo="+$("#category").val()+"&searchText="+$("#searchText").val()+"&projectState="+parseInt(projectState);
			}
			
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
					<h2>프로젝트 관리</h2>
					<br/><br/>
					
					<div class="table-responsive">
					<button type="button" class="btn btn-danger btn-filter" id="done">완료된프로젝트</button>
					<button type="button" class="btn btn-danger btn-filter" id="doing">진행중프로젝트</button>

						<table id="mytable" class="table table-bordred table-striped">

							<thead>

								<th>프로젝트명</th>
								<th>시작날짜</th>
								<th>종료날짜</th>
								<th>과목명</th>
								<th>프로젝트 상태</th>
								<th>&nbsp;</th>


							</thead>
							<tbody>

								<c:choose>
									<c:when test="${projectList.size()!=0 }">
										<c:forEach items="${projectList}" var="projectDTO">
											<tr>
												<td>${projectDTO.projectName }</td>
												<td>${projectDTO.projectStartdate }</td>
												<td>${projectDTO.projectEnddate }</td>
												<td>${projectDTO.projectSubject }</td>
												<c:choose>
													<c:when test="${projectDTO.projectState==0 }">
														<td>진행중</td>
													</c:when>
													<c:otherwise>
														<td>완료</td>
													</c:otherwise>
												</c:choose>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete" id="deleteBtn"
															data-toggle="modal" data-target="#delete" name="${projectDTO.projectNo}">
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
										<li><a href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage-pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="${startPage }" end="${endPage }" var="pageNum" step="1">
									<li class="active"><a href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${pageNum}&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}">${pageNum }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${flag==true }">
										<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage+pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><span
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
						<input type="hidden" id="projectState" value=${projectState }/>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<div>
							<select class="form-control" id="category">
						        <option value="-1">선택</option>
						        <option value="0">프로젝트명</option>
						        <option value="1">과목명</option>
						    </select>
						    <div class="col-sm-6 col-sm-offset-3">
            <div id="imaginary_container"> 
                <div class="input-group stylish-input-group input-append">
                    <input type="text" class="form-control" id="searchText" placeholder="Search" >
                    <span class="input-group-addon">
                        <button id="searchBtn">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
            </div>
        </div>
					    </div>
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