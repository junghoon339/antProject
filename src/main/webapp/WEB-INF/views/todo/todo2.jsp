<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

<script type="text/javascript">
$( document ).ready(function() {
	   $(function(){
	 //Make every clone image unique.
	   var counts = [0];
	   $(".dragImg").draggable({
	     helper: "clone",
	    //Create counter
	    start: function() { counts[0]++; }
	  });
	    $("#dropHere").droppable({
	       drop: function(e, ui){
	         $(this).append($(ui.helper).clone());
	   //Pointing to the dragImg class in dropHere and add new class.
	         $("#dropHere .dragImg").addClass("item-"+counts[0]).attr('id', "item-"+counts[0]).append("item-"+counts[0]);
	         //  ui.helper.attr('id', "item-"+counts[0]);
	       //  alert("count",counts[0]);
	          document.getElementById('count').innerHTML = counts[0];
	   //Remove the current class (ui-draggable and dragImg)
	         $("#dropHere .item-"+counts[0]).removeClass("dragImg ui-draggable ui-draggable-dragging");
	$(".item-"+counts[0]).dblclick(function() {
	$(this).remove();
	});
	//make the div draggable --- Not working???
	make_draggable($(".item-1"));
	}


	});
	var zIndex = 0;
	function make_draggable(elements)
	{
		elements.draggable({
			containment:'parent',
			start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
			stop:function(e,ui){
			}
		});
	}
	});
	});  
</script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/todo/css/todo.css"/>
</head>
<body>
<div class="container">
	<div class="row"> <h3>Counts<span id="count" class="badge">counts here</span></h3>
		<div class="dragImg"><img width="80" src="http://placehold.it/80x80"><span></span></div>
        <div id="dropHere"></div>
	</div>
</div>


</body>
</html>