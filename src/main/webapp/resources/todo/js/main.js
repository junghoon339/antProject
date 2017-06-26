// add event handler

i=0; //포스트잇 추가시 증가될 변수
var addEvent = (function () {
  if (document.addEventListener) {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.addEventListener(type, fn, false);
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  } else {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.attachEvent('on' + type, function () { return fn.call(el, window.event); });
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  }
})();

// inner variables
var dragItems;
todoSelectAll();
//updateDataTransfer();
var dropAreas = document.querySelectorAll('[droppable=true]');

// preventDefault (stops the browser from redirecting off to the text)
function cancel(e) {
  if (e.preventDefault) {
    e.preventDefault();
    console.log("a");
  }
  return false;
}

// update event handlers
function updateDataTransfer() {
  dragItems = document.querySelectorAll('[draggable=true]');  	
  
  for (var i = 0; i < dragItems.length; i++) {
      addEvent(dragItems[i], 'dragstart', function (event) {
          event.dataTransfer.setData('obj_id', this.id);
          return false;
      });
  }
}
function dropClip(target, event, val){

    target.append(event.dataTransfer.setData('obj_id', val));
    /* event.dataTransfer.el no longer has the object... where'd it go?? */
}

// dragover event handler
addEvent(dropAreas, 'dragover', function (event) {
    if (event.preventDefault) event.preventDefault();

    // little customization
    this.style.borderColor = "#000";
    return false;
});

// dragleave event handler
addEvent(dropAreas, 'dragleave', function (event) {
	console.log("e");
    if (event.preventDefault) event.preventDefault();
    
    // little customization
    this.style.borderColor = "#ccc";
    return false;
});

// dragenter event handler
addEvent(dropAreas, 'dragenter', cancel);

// drop event handler
addEvent(dropAreas, 'drop', function (event) {
	//프로젝트 NO, userNo, 위치
	//기존에 값이 있는지 확인,, 있으면, insert로 없으면, update로
	//포스트잇 id값은 프로젝트NO+"p"+todoNo
	
    if (event.preventDefault) event.preventDefault();
    // get dropped object
    var iObj = event.dataTransfer.getData('obj_id');
    
    var oldObj = document.getElementById(iObj);
    
    var oldThis = this;
    
    if($(oldThis).find("h2").text()=="TO DO"){
    	$("#todoLocation").val("0");
    };
    if($(oldThis).find("h2").text()=="DOING"){
    	$("#todoLocation").val("1");
    };
    if($(oldThis).find("h2").text()=="DONE"){
    	$("#todoLocation").val("2");
    };
    
    //지우기
    if($(oldThis).find("h2").text()==" "){
    	$("#todoLocation").val("3");
    };
  
    $("#todoContent").val(oldObj.children[0].children[0].innerHTML);
    
    if(iObj.indexOf("p")!=-1){
    	var postitSu=iObj.split('p');
    	$("#todoNo").val(postitSu[1]);
    	
    	$.ajax({
			url:url+"/todo/selectText",
			type:"post",
			data:"todoNo="+postitSu[1]+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
			dataType:"json",
			success:function(re){
				if(sessionUserNo==re.userNo){ //본인이 등록한것만 삭제 or 수정
					if($("#todoLocation").val()==3){
			    		$.ajax({
			    			url:url+"/todo/todoDelete",
			    			type:"post",
			    			data:"todoNo="+postitSu[1]+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
			    			dataType:"text",
			    			success:function(re){
			    				if(re>0){
			    					//alert("삭제굿");
			    					todoSelectAll();
			    				}else{
			    					alert("삭제안됨");
			    				}
			    			},
			    			error:function(err){
			    				
			    			}
			    		});
			    	}else{
			    		$.ajax({
			    	    	url:url+"/todo/todoUpdate",
			    	    	type:"post",
			    	    	data:$("#todoForm").serialize(),
			    	    	dataType:"text",
			    	    	success:function(re){
			    	    		if(re>0){
			    	    			//alert("잘변경됨")
			    	    			todoSelectAll();
			    	    		}else{
			    	    			alert("안변경됨");
			    	    		}
			    	    	},
			    	    	error:function(err){
			    	    		console.log("오류 : " + err)
			    	    	}
			    	    });
			    	}
				}else{
		    		alert("포스트잇은 등록한 사용자만 지우거나 움직일수  있습니다.");
		    	}
			},
			error:function(err){
				alert("err:"+err);
			}
    	});
    	
    }else{//새로등록하는것
    	if($("#todoLocation").val()!=3){//trash쪽으로 움직이는것은 막음,,
    		$.ajax({
    	    	url:url+"/todo/todoInsert",
    	    	type:"post",
    	    	data:$("#todoForm").serialize(),
    	    	dataType:"text",
    	    	success:function(re){
    	    		if(re>0){
    	    			//alert("잘드감");
    	    			//포스트잇 새로 생성
    	    			document.getElementById("gallery").innerHTML='<a href="#" id="'+(++i)+'" draggable="true"><blockquote class="note yellow" style="font-size:17px; width:180px;height:120px;"><span id="postitText">메모를 작성해서<br/> 옮겨주세요</span><cite class="author"></cite></blockquote></a>'
    	    		    
    	    			todoSelectAll();
    	    		}else{
    	    			alert("안드감");
    	    		}
    	    	},
    	    	error:function(err){
    	    		console.log("오류 : " + err)
    	    	}
    	    });
    	}
    	
    }
    
    setTimeout(function() {
    	console.log("g");
        updateDataTransfer();

        // little customization
        oldThis.style.borderColor = "#ccc";
    }, 500);

    return false;
});
function todoSelectAll(){
	$("#drop_0 :gt(0)").remove();
	$("#drop_1 :gt(0)").remove();
	$("#drop_2 :gt(0)").remove();
	
	$.ajax({
		url:url+"/todo/selectAll",
		type:"post",
		data:"projectNo="+parseInt($("#projectNo").val())+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
		dataType:"json",
		success:function(re){
			$.each(re,function(index,todoDTO){
				var loc=todoDTO.todoLocation;
				document.getElementById("drop_"+loc).innerHTML+='<a href="#" id="'+todoDTO.projectNo+'p'+todoDTO.todoNo+'" draggable="true"><blockquote class="note yellow" style="font-size:15px; font-family:나눔고딕코딩;"><span id="postitText">'+todoDTO.todoContent+'</span><cite class="author">'+todoDTO.userDTO.userName+'</cite></blockquote></a>'
			});
			updateDataTransfer();
		},
		error:function(err){
			alert("오류 : "+err);
		}
	});
}