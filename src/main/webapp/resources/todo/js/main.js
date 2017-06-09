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
updateDataTransfer();
var dropAreas = document.querySelectorAll('[droppable=true]');

// preventDefault (stops the browser from redirecting off to the text)
function cancel(e) {
  if (e.preventDefault) {
    e.preventDefault();
  }
  return false;
}

// update event handlers
function updateDataTransfer() {
    dragItems = document.querySelectorAll('[draggable=true]');
    alert(dragItems+"aaa");
    for (var i = 0; i < dragItems.length; i++) {
        addEvent(dragItems[i], 'dragstart', function (event) {
            event.dataTransfer.setData('obj_id', this.id);
            return false;
        });
    }
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
    if (event.preventDefault) event.preventDefault();

    // little customization
    this.style.borderColor = "#ccc";
    return false;
});

// dragenter event handler
addEvent(dropAreas, 'dragenter', cancel);

// drop event handler
addEvent(dropAreas, 'drop', function (event) {
    if (event.preventDefault) event.preventDefault();

    document.getElementById("gallery").innerHTML+='<a href="#" id="postit'+(++i)+'" draggable="true"><i class="pin"></i><blockquote class="note yellow" style="font-size:20px;"><span id="postitText">내용을 작성해주세요</span><cite class="author">작성자</cite></blockquote></a>'
    // get dropped object
    var iObj = event.dataTransfer.getData('obj_id');
    
    alert(iObj);
    var oldObj = document.getElementById(iObj);
    
    // get its image src
    /*var oldSrc = oldObj.childNodes[0].src;
    oldObj.className += 'hidden';*/

    var oldThis = this;
    alert(oldThis);
    
    setTimeout(function() {
        oldObj.parentNode.removeChild(oldObj); // remove object from DOM
        //alert(oldThis.childNodes[1]);
        // add similar object in another place
       /* oldThis.innerHTML += '<a id="'+iObj+'" draggable="true"><img src="'+oldSrc+'" /></a>';*/
        oldThis.innerHTML +='<a href="#" id="postit" draggable="true"><i class="pin"></i><blockquote class="note yellow" style="font-size:20px;"><span id="postitText">'+oldObj.children[1].children[0].innerHTML+'</span><cite class="author">작성자</cite></blockquote></a>'
       // oldThis.innerHTML += '<a id="'+iObj+'" draggable="true"><img src="'+oldSrc+'" /></a>'
        // and update event handlers
        updateDataTransfer();

        // little customization
        oldThis.style.borderColor = "#ccc";
    }, 500);

    return false;
});