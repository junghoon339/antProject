<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>HTML5 Drag and Drop - sorting photos between albums|
	Script Tutorials</title>
<link href="${pageContext.request.contextPath }/resources/todo/css/main.css" rel="stylesheet" type="text/css" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$(document).on("click","a",function(){
			var val=prompt("포스트잇에 적을 내용을 입력해주세요");
			$(this).find("span").text(val);
		});
		/* $("#postit").click(function(){
			
		}); */
	});
</script>
</head>
<body>


<br/><br/><br/><br/>
	<header tabindex="0"> </header>

	<div class="albums">
		<div class="album" id="drop_1" droppable="true">
			<h2>TO DO</h2>
		</div>
		<div class="album" id="drop_2" droppable="true">
			<h2>DOING</h2>
		</div>
		<div class="album" id="drop_3" droppable="true">
			<h2>DONE</h2>
		</div>
	</div>
	<div style="clear: both"></div>
	<div id="gallery" class="gallery">
		<!-- <div class="quote-container"> -->
	 	  <a href="#" id="postit" draggable="true">
			  <i class="pin"></i>
			  <blockquote class="note yellow" style="font-size:20px;">
			    <span id="postitText">내용을 작성해주세요</span>
			    <cite class="author">작성자</cite>
			  </blockquote>
		  </a>
		<!-- </div> -->
		<%-- <a id="1" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/1.jpg"></a> <a
			id="2" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/2.jpg"></a> <a id="3"
			draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/3.jpg"></a> <a id="4"
			draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/4.jpg"></a> <a id="5"
			draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/5.jpg"></a> <a id="6"
			draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/6.jpg"></a> <a id="7"
			draggable="true"><img src="${pageContext.request.contextPath }/resources/todo/images/7.jpg"></a> <a id="8"
			draggable="true"><img src="images/8.jpg"></a> <a id="9"
			draggable="true"><img src="images/9.jpg"></a> <a id="10"
			draggable="true"><img src="images/10.jpg"></a> <a id="11"
			draggable="true"><img src="images/11.jpg"></a> <a id="12"
			draggable="true"><img src="images/12.jpg"></a> --%>
	</div>
	<script src="${pageContext.request.contextPath }/resources/todo/js/main.js"></script>
</body>
</html>
