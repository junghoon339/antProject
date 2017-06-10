<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/todo2/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<header tabindex="0">
        </header>

        <div class="albums">
            <div class="album" id="drop_1" droppable="true"><h2>Album 1</h2></div>
            <div class="album" id="drop_2" droppable="true"><h2>Album 1</h2></div>
            <div class="album" id="drop_3" droppable="true"><h2>Album 3</h2></div>
        </div>
        <div style="clear:both"></div>
        <div class="gallery">
            <a id="1" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/1.jpg"></a>
            <a id="2" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/2.jpg"></a>
            <a id="3" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/3.jpg"></a>
            <a id="4" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/4.jpg"></a>
            <a id="5" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/5.jpg"></a>
            <a id="6" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/6.jpg"></a>
            <a id="7" draggable="true"><img src="${pageContext.request.contextPath }/resources/todo2/images/7.jpg"></a>
            <a id="8" draggable="true"><img src="images/8.jpg"></a>
            <a id="9" draggable="true"><img src="images/9.jpg"></a>
            <a id="10" draggable="true"><img src="images/10.jpg"></a>
            <a id="11" draggable="true"><img src="images/11.jpg"></a>
            <a id="12" draggable="true"><img src="images/12.jpg"></a>
        </div>
        <script src="${pageContext.request.contextPath }/resources/todo2/js/main.js"></script></a>    
</body>
</html>