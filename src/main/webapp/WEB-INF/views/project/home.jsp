<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=0, maximum-scale=0, user-scalable=no" />

<title>jQuery Tab Module Horizontal Layout</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/room.css" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/tabModule.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tabModule.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		tabModule.init();
	});
</script>
</head>
<body>

	<jsp:include page="header.jsp" flush="false"/>


	<h1>하아..</h1>
	<div class="demo">
		<div class="tab tab-horiz">
			<ul class="tab-legend">
				<li class="active">진행중인 팀플</li>
				<li>완료된 팀플</li>
				<li>My TimeTable</li>
				<li>My Calendar</li>
			</ul>
			<ul class="tab-content">
				<li>


					<section id="bs-pricing-six"
						class="bs-pricing-four roomy-50 bg-white fix">
						<div class="container">
							<div class="row">
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">WebProgramming</h3>
											<h1 class="bs-caption">
												<small>D-</small>11
											</h1>
											<!-- <ul>
												<li><b>5 GB</b> Space</li>
											</ul> -->
											<a href="teamMain.jsp" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">Hacking</h3>
											<h1 class="bs-caption">
												<small>D-</small>15
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing bg-danger">
										<div class="cotent">
											<h3 class="category">산업심리학</h3>
											<h1 class="bs-caption">
												<small>D-</small>20
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="bs bs-pricing">
										<div class="cotent">
											<h3 class="category">종합설계</h3>
											<h1 class="bs-caption">
												<small>D-</small>25
											</h1>
											<a href="#" class="btn btn-danger">Enter</a>
										</div>
									</div>
								</div>
								<div class="col-md-3"><!-- 플러스아이콘 -->
									<div class="bs bs-pricing">
										<div class="cotent">
											<a href="#"><img src="${pageContext.request.contextPath}/resources/img/plus.png"></a>
										</div>
									</div>
								</div>		
							</div><!-- row -->
						</div>
					</section>


				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>Content222222</h4>
				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>Content3333333</h4>
				</li>
				<li>
					<!--TAB CONTENT-->
					<h4>Content444444444</h4>
				</li>
			</ul>
		</div>
	</div>
	
	
	
	<jsp:include page="footer.jsp" flush="false"/>
	
</body>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>