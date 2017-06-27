<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>개미와 베짱이, 대학조별과제 관리시스템</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.min.css"
	rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath}/resources/css/paper-dashboard.css"
	rel="stylesheet" />
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->
<script>
$(document).ready(function() {
	
	var startDate = dateToYYYYMMDD(new Date("${projectDTO.projectStartdate}"));
	var endDate = dateToYYYYMMDD(new Date("${projectDTO.projectEnddate}"));

	$("#start-date").attr("value", startDate);
	$("#end-date").attr("value", endDate);

	
	//조장일경우 팀플정보 수정,마감하기 버튼 보이기
  	if ("${projectUserRole}" == "조장") {
		$("#updateBtn").attr("style", "display:display");
		$("#Btn").attr("style","display:display");
	}
	
	//projectState=1일 경우 마감하기 버튼 비활성화
	if("${projectDTO.projectState}"=="1"){
		$("#Btn").attr("disabled","disabled");
	}
	
	//완료대기중(1), 완료된 조별과제(2) 버튼 비활성화
	if("${projectState}"=="1" || "${projectState}"=="2"){
		$("#updateBtn").attr("style", "display:none");
		$("#Btn").attr("style","display:none");	
	}
	
	
})

	$(function() {
		$("#Btn").click(function() {
			$("#myModal").modal("show");							
		})
	})


	//데이트 포멧 
	function dateToYYYYMMDD(date) {
		function pad(num) {
			num = num + '';
			return num.length < 2 ? '0' + num : num;
		}
		return date.getFullYear() + '-' + pad(date.getMonth() + 1) + '-'
				+ pad(date.getDate());
	}
</script>

</head>
<body id="body">
	<div class="wrapper">
		<jsp:include page="sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />
			<!-- </nav> -->
			<div class="content" id="pdf">
				<div class="container-fluid" id="container-fluid">
					<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					<!-- 
						작성할때 template.html 에서
						<div class="row">부터 참고하면서 작성하면 됨
					-->

					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="content">
									<h4 class="title">조별과제 정보</h4>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8 col-md-7">
							<div class="card">
								<div class="content">
									<form name="projectForm" class=""
										action="${pageContext.request.contextPath}/project/updateTeamInfo"
										method="post">
										<input type="hidden" id="securityInfo"
											name="${_csrf.parameterName}" value="${_csrf.token}">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>조별과제명</label> <input type="text"
														class="form-control border-input" name="projectName"
														value="${projectDTO.projectName}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>과목명</label> <input type="text"
														class="form-control border-input" name="projectSubject"
														value="${projectDTO.projectSubject}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>교수님</label> <input type="text"
														class="form-control border-input" name="projectTeacher"
														value="${projectDTO.projectTeacher}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>시작날짜</label> <input
														class="form-control border-input" name="projectStartdate"
														id="start-date" type="date">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>종료날짜</label> <input
														class="form-control border-input" name="projectEnddate"
														id="end-date" type="date">
												</div>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-info btn-fill btn-wd"
												id="updateBtn" style="display: none">수정하기</button>
											<button type="button" class="btn btn-info btn-fill btn-wd"
												id="Btn" style="display: none">마감하기</button>
										</div>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="content">
									<h4 class="title">조원 정보</h4>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<c:forEach var="user" items="${projectUserList}">
							<div class="col-md-4">
								<div class="card card-user">
									<div class="image">
										<img style="position: relative; z-index: 1" src="${pageContext.request.contextPath}/resources/asset/img/background.jpg" alt="..." />
									</div>
									<div class="content">
										<div class="author">
											<img style="z-index: 2; position: relative;" class="avatar border-white"
												src="${pageContext.request.contextPath}/resources/asset/img/faces/face-0.jpg" alt="..." />
											<h4 class="title">
												${user.userName}<br /> <a href="#"><small>${user.userId}</small></a>
											</h4>
										</div>
										
											<c:forEach var="sd" items="${sdList}">
												<c:if test="${sd.surveyDetailUserName==user.userName}">
													<p class="description text-center">평점 : ${sd.surveyDetailUserScore}</p>
												</c:if>
											</c:forEach>
									</div>
									<hr>
									<div class="text-center">
										<div class="row">
											<div class="col-md-3 col-md-offset-1">
												<!-- <h5>
													12<br />
													<small>Files</small>
												</h5> -->
											</div>
											<div class="col-md-4">
												<h5>
													10<br /> <small>등록한 자료</small>
												</h5>
											</div>
											<div class="col-md-3">
												<!-- <h5>
													24,6$<br />
													<small>Spent</small>
												</h5> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="content">
									<h4 class="title">TO DO BOARD</h4>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="card" id="todoboard">

								<div class="content">
									<div class="row">
										<c:import url="/todo/capTodo" />
									</div>

									<!-- <div class="footer">
										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="content">
									<h4 class="title">조별과제 달력</h4>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="content">
									<div class="row">
										${schedule}
									</div>

									<!-- <div class="footer">
										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
					&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger" onclick="window.print()">다운</button>
				</div>
			</div>
		</div>
	</div>

	<!--   Core JS Files   -->

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
	<!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->
	<script
		src="${pageContext.request.contextPath }/resources/js/html2canvas.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jspdf.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#pdfdown").click(function() {
				/* var pdf = new jsPDF('p', 'pt', 'a4');
				pdf.setFontSize(30);
				var options = {
					pagesplit : true
				};
				pdf.addHTML(document.body, options, function() {
					pdf.save('datauri');
				}); */
				makePDF();
				/* 				var doc = new jsPDF();
				 doc.setFontSize(30); */
				/* 				 doc.addHTML($("#pdf"), function(){
				 doc.save('test.pdf');
				 }) */

				/* var options = {
					pagesplit : true	
				};
				 */
				/* 				 var el = document.getElementById('pdf');
				 el.parentElement.style.height = '10000px';
				
				 el.style.display = 'inline-block';
				 el.style.height = "auto";
				
				 /* 				 

				 html2canvas($("#todoreport2"), {
				 onrendered : function(canvas) {
				 var imgData = canvas.toDataURL('image/jpeg',1.0);
				 doc.text(0, 10, 'TIME TABLE');
				 doc.addImage(imgData, 'PNG', 20, 20, 100, 50);
				 doc.save('test.pdf');
				 }
				 }); */

				/* pdf.text(10, 10, 'HTML')
				pdf.addHTML($("#pdf"), 10, 30, options, function(){
				    pdf.save("test.pdf");
				});
				 */
				/* html2canvas($("#timereport"), {
					onrendered : function(canvas) {
						var imgData = canvas.toDataURL('image/jpeg',1.0);
						var width = doc.internal.pageSize.width;    
						var height = doc.internal.pageSize.height;
						doc.text(0, 10, 'TIME TABLE');
						doc.addImage(imgData, 'PNG', 0, 0, width, height);
					}
				});
				
				html2canvas($("#todoreport"), {
					onrendered : function(canvas) {
						var imgData = canvas.toDataURL('image/jepg',1.0);
						doc.text(10, 110, 'TODO');
						doc.addImage(imgData, 'PNG', 10, 120, 100, 100);
						doc.save('sample-file11.pdf');
					}
				}); */
			});

		})

		function genPDF() {
			html2canvas(
					$('#container-fluid'),
					{
						onrendered : function(canvas) {
							var img = canvas.toDataURL("image/png");
							var doc = new jsPDF('landscape');
							doc.text(20, 20, 'Hello world!')
							doc
									.text(20, 30,
											'This is client-side Javascript, pumping out a PDF.')
							doc.addPage()
							doc.addImage(img, 'JPEG', 20, 20);
							doc.save('test.pdf');
						}
					});
		}

		/* function examPDF() {
			var doc = new jsPDF('p', 'pt', 'a4');

			doc.text(50, 50, "subject");

			html2canvas($('#jowon'), {
				onrendered : function(canvas1) {
					alert(0)
					var img = canvas1.toDataURL("image/png");
					doc.addPage();
					doc.text(20, 20, 'jowon!')
					doc.addImage(img, 'JPEG', 20, 40);

					html2canvas($('#jojung'), {
						onrendered : function(canvas2) {
							alert(1)
							var img = canvas2.toDataURL("image/png");
							doc.addPage();
							doc.text(20, 20, 'jojung!')
							doc.addImage(img, 'JPEG', 20, 40);
							html2canvas($('#todoboard'), {
								onrendered : function(canvas3) {
									alert(2)
									var img = canvas3.toDataURL("image/png");
									doc.addPage();
									doc.text(20, 20, 'todoboard!')
									doc.addImage(img, 'JPEG', 20, 40);
									html2canvas($('#pyungjeom'), {
										onrendered : function(canvas4) {
											alert(3)
											var img = canvas4
													.toDataURL("image/png");
											doc.addPage();
											doc.text(20, 20, 'pyungjeom!')
											doc.addImage(img, 'JPEG', 20, 40);
											doc.save('testpdf.pdf');
										}
									});
								}
							});
						}
					});
				}
			});

		}
 */
		function makePDF() {

			//			var quotes = document.getElementById('body');

			var el = document.getElementById('container-fluid');
/* 			el.parentElement.style.width = '10000px';

			el.style.display = 'inline-block';
			el.style.width = "auto"; */
			html2canvas(el,
					{
						onrendered : function(canvas) {
							//! MAKE YOUR PDF
							var pdf = new jsPDF();

							for (var i = 0; i <= el.clientHeight / 980; i++) {
								//! This is all just html2canvas stuff
								var srcImg = canvas;
								var sX = 0;
								var sY = 980 * i; // start 980 pixels down for every new page
								var sWidth = 900;
								var sHeight = 980;
								var dX = 0;
								var dY = 0;
								var dWidth = 900;
								var dHeight = 980;

								window.onePageCanvas = document
										.createElement("canvas");
								onePageCanvas.setAttribute('width', 900);
								onePageCanvas.setAttribute('height', 980);
								var ctx = onePageCanvas.getContext('2d');
								// details on this usage of this function: 
								// https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Using_images#Slicing
								ctx.drawImage(srcImg, sX, sY, sWidth, sHeight,
										dX, dY, dWidth, dHeight);

								// document.body.appendChild(canvas);
								var canvasDataURL = onePageCanvas.toDataURL(
										"image/png", 1.0);

								var width = onePageCanvas.width;
								var height = onePageCanvas.clientHeight;

								//! If we're on anything other than the first page,
								// add another page
								if (i > 0) {
									pdf.addPage(612, 791); //8.5" x 11" in pts (in*72)
								}

								//! now we declare that we're working on that page
								pdf.setPage(i + 1);
								//! now we add content to that page!
								pdf.addImage(canvasDataURL, 'PNG', 20, 40,
										(width * .62), (height * .62));

							}
							//! after the for loop is finished running, we save the pdf.
							pdf.save('Test.pdf');
						}
					});
		}
	</script>

</body>
</html>