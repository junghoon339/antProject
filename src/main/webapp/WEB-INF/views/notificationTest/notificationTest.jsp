<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개미와 베짱이, 대학조별과제 관리시스템</title>
</head>
<body>
        <script type="text/javascript">
           
            //var wsUri = "ws://localhost:8000/controller/notification";
           
            function init() {
                output = document.getElementById("output");
            }
            function send_message() {
                websocket = new WebSocket("${pageContext.request.contextPath}/notification");
                websocket.onopen = function(evt) {
                    onOpen(evt)
                };
                websocket.onmessage = function(evt) {
                    onMessage(evt)
                };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
            }
           
           
            function onOpen(evt) {
                writeToScreen("Connected to Endpoint!");
                doSend(textID.value);
            }
            function onMessage(evt) {
                writeToScreen("Message Received: " + evt.data);
            }
            function onError(evt) {
                writeToScreen('ERROR: ' + evt.data);
            }
            function doSend(message) {
                writeToScreen("Message Sent: " + message);
                websocket.send(message);
                //websocket.close();
            }
            function writeToScreen(message) {
                var pre = document.createElement("p");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                
                output.appendChild(pre);
            }
            window.addEventListener("load", init, false);
        </script>
        <h1 style="text-align: center;">Hello World WebSocket Client</h1>
        <br>
        <div style="text-align: center;">
            <form action="">
                <input onclick="send_message()" value="Send" type="button">
                <input id="textID" name="message" value="Hello WebSocket!" type="text"><br>
            </form>
        </div>
        <div id="output"></div>
</body>
</html>