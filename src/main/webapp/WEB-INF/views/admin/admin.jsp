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
					<h1>Fancy Toggle Sidebar Navigation</h1>
					<p>Bacon ipsum dolor sit amet tri-tip shoulder tenderloin
						shankle. Bresaola tail pancetta ball tip doner meatloaf corned
						beef. Kevin pastrami tri-tip prosciutto ham hock pork belly bacon
						pork loin salami pork chop shank corned beef tenderloin meatball
						cow. Pork bresaola meatloaf tongue, landjaeger tail andouille
						strip steak tenderloin sausage chicken tri-tip. Pastrami tri-tip
						kielbasa sausage porchetta pig sirloin boudin rump meatball
						andouille chuck tenderloin biltong shank</p>
					<p>Pig meatloaf bresaola, spare ribs venison short loin rump
						pork loin drumstick jowl meatball brisket. Landjaeger chicken
						fatback pork loin doner sirloin cow short ribs hamburger shoulder
						salami pastrami. Pork swine beef ribs t-bone flank filet mignon,
						ground round tongue. Tri-tip cow turducken shank beef shoulder
						bresaola tongue flank leberkas ball tip.</p>
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