<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>\
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/codebase/dhtmlxscheduler.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	/* 모달 */
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
	});
	/* 모달 */
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

				<h1>Team Calendar</h1>
				${schedule}
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