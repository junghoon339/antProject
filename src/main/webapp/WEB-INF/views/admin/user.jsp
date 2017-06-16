<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
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
					
								<h4>Bootstrap Snipp for Datatable</h4>
								<div class="table-responsive">


									<table id="mytable" class="table table-bordred table-striped">

										<thead>

											<th><input type="checkbox" id="checkall" /></th>
											<th>Sales ID</th>
											<th>Name</th>
											<th>Email</th>
											<th>Designation</th>
											<th>Mobile Numberl</th>


											<th>Delete</th>
										</thead>
										<tbody>

											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>Mohsin</td>
												<td>Irshad</td>
												<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
												<td>isometric.mohsin@gmail.com</td>
												<td>+923335586757</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>

											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>Mohsin</td>
												<td>Irshad</td>
												<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
												<td>isometric.mohsin@gmail.com</td>
												<td>+923335586757</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>


											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>Mohsin</td>
												<td>Irshad</td>
												<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
												<td>isometric.mohsin@gmail.com</td>
												<td>+923335586757</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>



											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>Mohsin</td>
												<td>Irshad</td>
												<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
												<td>isometric.mohsin@gmail.com</td>
												<td>+923335586757</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>


											<tr>
												<td><input type="checkbox" class="checkthis" /></td>
												<td>Mohsin</td>
												<td>Irshad</td>
												<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
												<td>isometric.mohsin@gmail.com</td>
												<td>+923335586757</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs" data-title="Edit"
															data-toggle="modal" data-target="#edit">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs" data-title="Delete"
															data-toggle="modal" data-target="#delete">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>





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


					<div class="modal fade" id="edit" tabindex="-1" role="dialog"
						aria-labelledby="edit" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
									<h4 class="modal-title custom_align" id="Heading">Edit
										Your Detail</h4>
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
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
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
									<h4 class="modal-title custom_align" id="Heading">Delete
										this entry</h4>
								</div>
								<div class="modal-body">

									<div class="alert alert-danger">
										<span class="glyphicon glyphicon-warning-sign"></span> Are you
										sure you want to delete this Record?
									</div>

								</div>
								<div class="modal-footer ">
									<button type="button" class="btn btn-success">
										<span class="glyphicon glyphicon-ok-sign"></span> Yes
									</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">
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