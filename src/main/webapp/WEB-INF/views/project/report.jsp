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

<title>Insert title here</title>
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

<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->
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
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">조원 정보</h4>
									<p class="category">${projectDTO.projectName}</p>
								</div>
								<div class="content">
									<div class="row">
										${projectDTO.projectSubject} | ${projectDTO.projectTeacher} <br>
										
									</div>

									<div class="footer">

										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">조별과제 정보</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="content">
									<div class="row">ddsdsds</div>

									<div class="footer">

										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">TO DO BOARD</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="content">
									<div class="row">
										<div style="height: 50; width: 50"><c:import url="/todo/capTodo" /></div>
									</div>

									<div class="footer">

										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">조별과제 달력</h4>
									<p class="category">Last Campaign Performance</p>
								</div>
								<div class="content">
									<div class="row">
										<jsp:include page="/WEB-INF/views/calendar/scheduler.jsp"/>
									</div>
									
									
									<div class="footer">

										<hr>
										<div class="stats">
											<i class="ti-timer"></i> Campaign sent 2 days ago
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
					<button id="pdfdown">다운</button>
			</div>
			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>

	<!--   Core JS Files   -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
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
			html2canvas(document.body, {
				onrendered : function(canvas) {
					var img = canvas.toDataURL("image/png");
					var doc = new jsPDF();
					doc.addImage(img, 'JPEG', 20, 20);
					doc.save('test.pdf');
				}
			});
		}

		function makePDF() {

//			var quotes = document.getElementById('body');

			var el = document.getElementById('container-fluid');
			 el.parentElement.style.width = '10000px';
			  
			 el.style.display = 'inline-block';
			 el.style.width = "auto";
			html2canvas(
					el,
					{
						onrendered : function(canvas) {
							//! MAKE YOUR PDF
							var pdf = new jsPDF('l', 'mm', [1400,900]);

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