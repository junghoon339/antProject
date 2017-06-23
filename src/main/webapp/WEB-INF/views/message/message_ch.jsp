<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
   href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
   href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
   name='viewport' />
<meta name="viewport" content="width=device-width" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<!-- Bootstrap core CSS     -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Animation library for notifications   -->
<link
   href="${pageContext.request.contextPath }/resources/css/animate.min.css"
   rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link
   href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
   rel="stylesheet" />

<%--     <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/css/demo.css" rel="stylesheet" />
 --%>
<!--  Fonts and icons     -->
<!-- <link
   href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
   rel="stylesheet"> -->
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
   rel='stylesheet' type='text/css'>
<link
   href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
   rel="stylesheet">
<script type="text/javascript">
   /* 모달 */
   $(document).ready(function() {
      $("#receiveBtn").click(function(){
         location.href="${pageContext.request.contextPath}/message/main?userNo=${sessionScope.userDTO.userNo}&flag=false";
      });
      
      $("#sendBtn").click(function(){
         location.href="${pageContext.request.contextPath}/message/main?userNo=${sessionScope.userDTO.userNo}&flag=true";
      });
      
       $("#mytable #checkall").click(function() {
          alert(11)
         if ($("#mytable #checkall").is(':checked')) {
            alert("checkall");
            $("#mytable input[type=checkbox]").each(function() {
               $(this).prop("checked", true);
            });

         } else {
            $("#mytable input[type=checkbox]").each(function() {
               $(this).prop("checked", false);
            });
         }
      });
      $("#checkAll").click(function(){
         //alert($(this).attr("class"));
         
         var s=$(this).attr("class");
         if(s=="checkbox checkbox-blue"){
            alert("A");
            s="checkbox checkbox-blue checked";
         }else if(s=="checkbox checkbox-blue checked"){
            alert("b");
            s="checkbox checkbox-blue";
         } 
         
         alert(s);
         $(".checkbox-blue:not(#checkAll)").each(function(){
            $(this).prop("class",s);
         })
         /* alert($(this).attr("checked"));
         if($(this).attr("checked")){
            alert("A");
            $(".checkbox-blue").each(function(){
               $(this).prop("class","checkbox checkbox-blue checked");
            })
         }else{
            $(".checkbox-blue").each(function(){
               $(this).prop("class","checkbox checkbox-blue");
            })
         } */
         
         
      });

      $("[data-toggle=tooltip]").tooltip();
      
      
      $(document).on("click","#reply",function(){
         refresh();
         $("#messageTopEmail").val($(this).attr("name"));
      });
      
      $(document).on("click","#sendMessageBtn",function(){
         refresh();
      });
      
      function refresh(){
         $("#messageContent").attr("disabled",false);
         $("#messageContent").val("");
         
         $("#messageTopLabel").text("받을사람");
         $("#messageTopEmail").attr("readonly",false);
         $("#messageTopEmail").val("");
         
         $("#messageBottom").html('<input type="submit" id="anmelden" name="anmelden" class="btn btn-success" value="보내기">');
      }
      
      $("#messageDeleteBtn").click(function(){
         var messageNos="";
         $(":checked").each(function(index,item){
            if($(item).val()!=-1){
               messageNos+=$(item).val()+";";
            }
         });
         alert(messageNos);
         location.href="${pageContext.request.contextPath}/message/messageDelete?messageNos="+messageNos+"&flag=${flag}";
         
      });
      
      var messageNo="";
      $(document).on("click","#deleteBtn",function(){
         messageNo=$(this).attr("name")
         
      });
      
      
      $(document).on("click","#deleteYesBtn",function(){
         alert(messageNo);
         /* var flag=$("#flag").val();
         var endPage=$("#endPage").val();
         var curPage=$("#curPage").val();
         var totalRow=$("#totalRow").val();
         var rowCount=$("#rowCount").val();
         var projectState=$("#projectState").val();
         
         if(flag=="true"&&curPage==endPage){   
            if(totalRow%rowCount==1){
               curPage=curPage-1;      
            }
         } */
         
         location.href="${pageContext.request.contextPath}/message/sendCancel?messageNo="+messageNo;
         
      });
      
      /* 검색 */
      $("#submitBt").click(function(){
         location.href="${pageContext.request.contextPath}/message/main?searchText="+$("#searchText").val()+"&userNo=13&categoryNo="+$("#category").val()+"&flag=${flag}";
      })
      
      /* 검색 */
      
      /* insert 유효성 검사 */
      $("#anmelden").click(function(){
         alert("adf");
         if($("#messageTopEmail").val()==""){
            alert("받는분을 입력해주세요");
            $("#messageTopEmail").focus();
            return false;
         }
      }) 
      /* insert 유효성 검사 */
   });
   /* 모달 */
   function messageSelect(messageNo){
         //alert(messageNo);
         $.ajax({
            url:"${pageContext.request.contextPath}/message/selectMessage",
            type:"post",
            data:"messageNo="+messageNo+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val()+"&flag=${flag}",
            dataType:"json",
            success:function(re){
               //모달창을 메모읽는 창으로 바꿔줌
               
               $("#messageContent").val(re.messageContent);
               $("#messageContent").attr("disabled",true);
               $("#messageTopLabel").text("보낸사람");
               $("#messageTopEmail").val(re.userDTO.userId);
               $("#messageTopEmail").attr("readonly",true);
               var str="";
               if("${flag}"=="true"){
                  str='<button data-dismiss="modal" id="anmelden" name="anmelden" class="btn btn-success">닫기</button>';
               }else{
                  var str='<input type="button" id="reply" name="'+re.userDTO.userId+'" class="btn btn-success" value="답장하기"><button data-dismiss="modal" id="anmelden" name="anmelden" class="btn btn-success">닫기</button>';
               }
               $("#messageBottom").html(str);
               $("#danger").modal('show');
               
            },
            error:function(err){
               alert("에러발생 : "+err);
            }
         });
   }
   
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
   <div class="wrapper">
      <%-- 
      관리자로 쪽지함들어왔을때
      <jsp:include page="/WEB-INF/views/admin/admin_sidebar_ch.jsp" /> --%>
      <jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />


      <div class="main-panel">
         <jsp:include page="/WEB-INF/views/project/header_ch.jsp"
            flush="false" />



         <div class="content">
            <div class="container-fluid">
               <div class="row">
                  
                   <div class="row">
                   
                      <div class="card">
                        <c:choose>
                            <c:when test="${flag==true }">
                               <div class="col-sm-6">
                                      <h2 class="title">보낸메시지</h2>      
                                    </div>
                                 </c:when>   
                                 <c:otherwise>
                                    <div class="col-sm-6">
                                      <h2 class="title">받은메시지</h2>
                                   </div>
                                 </c:otherwise>
                        </c:choose>
                      
                        
                     <div class="col-sm-6" style="text-align: right;">
                      
                  <button type="button" class="btn btn-Info btn-filter"
                     id="messageDeleteBtn"><div class="icon-container">
                                    <span class="ti-trash"></span>
                                 </div></button>
                                 
                  <button type="button" class="btn btn-Info btn-filter"
                     id="receiveBtn"><div class="icon-container">
                                    <span class="ti-shift-left"></span>
                                 </div></button>
                                 
                  <button type="button" class="btn btn-Info btn-filter"
                     id="sendBtn"><div class="icon-container">
                                    <span class="ti-shift-right"></span>
                                 </div></button>

                  <a class="btn btn-Info" href="#danger" data-toggle="modal"
                     id="sendMessageBtn"><div class="icon-container">
                                    <span class="ti-pencil-alt"></span>
                                 </div></a>
                           </div>
                  </div>
                  
                  
                  <!--쪽지보내기 Modal -->
                  <div class="modal fade" id="danger" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header modal-header-Info">
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-hidden="true">×</button>
                              <h1>
                                 <div class="icon-container">
                                    <span class="ti-email"></span><span class="icon-name"> 쪽지보내기</span>
                                 </div> 
                              </h1>
                           </div>
                           <div class="modal-body">
                              <!-- 인설트 폼 -->

                              <form class="form-horizontal"
                                 action="${pageContext.request.contextPath}/message/messageInsert"
                                 method="post">

                                 <input type="hidden" id="securityInfo"
                                    name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
                                    type="hidden" name="userNoMessageSender"
                                    value="${sessionScope.userDTO.userNo}">

                                 <fieldset>

                                    <!-- Form Name -->

                                    <!-- Text input-->
                                    <div class="form-group" id="messageTop">
                                       <label class="col-md-4 control-label" for="name"
                                          style="text-align: right; width:70px" id="messageTopLabel">받을사람</label>
                                       <div class="col-md-4">
                                          <input id="messageTopEmail" name="messageReceiver"
                                             type="email" placeholder="이메일주소를 입력해주세요"
                                             class="form-control input-md" style="width:470px">
                                          
                                       </div>
                                    </div>


                                    <!-- Textarea -->
                                    <div class="form-group">
                                       <label class="col-md-4 control-label" for="anschrift" style="width:70px">내용</label>
                                       <div class="col-md-4">
                                          <textarea class="form-control" id="messageContent"
                                             name="messageContent" cols="470"
                                             placeholder="내용을 입력하세요"></textarea>
                                       </div>
                                    </div>




                                    <!-- Button (Double) -->
                                    <div class="form-group">
                                       <label class="col-md-4 control-label" for="anmelden"></label>
                                       <div id="messageBottom" class="col-md-8">
                                          <input type="submit" id="anmelden" name="anmelden"
                                             class="btn btn-Info btn-filter" value="보내기"> <!-- 이거 왜 새로고침 안되냐? -->
                                       </div>
                                    </div>
                                 </fieldset>
                              </form>

                           </div>


                        </div>
                        <!-- /.modal-content -->
                     </div>
                     <!-- /.modal-dialog -->
                  </div>
                  <!-- /.modal -->
                  <!-- Modal -->

                  <!-- 검색 -->
                     <div class="container" style="width: 600px;">
                        <div class="row">
                           <div class="col-xs-8 col-xs-offset-2">
                              <div class="input-group">
                                 <div class="input-group-btn search-panel">
                                    <!-- <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                      <span id="search_concept">검색 옵션</span> <span class="caret"></span>
                                   </button>
                                   <ul class="dropdown-menu" role="menu">
                                     <li><a href="#contains" id="searchByName">이름</a></li>
                                     <li><a href="#its_equal" id="searchByTitle">제목</a></li>
                                   </ul> -->
                                    <select class="btn btn-Info dropdown-toggle"
                                       data-toggle="dropdown" style="width: 90px" id="category">
                                       <option value="-1">선택</option>
                                       <option value="0">이름</option>
                                       <option value="1">내용</option>
                                    </select>
                                 </div>
                                 <input type="hidden" name="search_param" value="all"
                                    id="search_param"> <input type="text"
                                    class="form-control" name="x" placeholder="검색어를 입력하세요."
                                    id="searchText" style="border:1px solid #66615b"> <span class="input-group-btn">
                                    <button class="btn btn-Info" type="button" id="submitBt" style="height:40px">
                                       <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                 </span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- 검색 -->

                  <div class="table-responsive">


                     <table id="mytable" class="table table-bordred table-striped">

                        <thead>
                        
                         <th class="col-md-1">
                        
                         <input type="checkbox" id="checkall" value="-1">
                           
                        </th>    
                           
                           <c:choose>
                              <c:when test="${flag==false }">
                                 <th class="col-md-3">보낸사람</th>
                              </c:when>
                              <c:otherwise>
                                 <th class="col-md-2">받는사람</th>
                              </c:otherwise>
                           </c:choose>

                           
                           <c:choose>
                              <c:when test="${flag==false }">
                                 <th class="col-md-6">내용</th>
                                 <th class="col-md-2">날짜</th>
                              </c:when>
                              <c:otherwise>
                                 <th class="col-md-5">내용</th>
                                 <th class="col-md-1">보낸날짜</th>
                                 <th class="col-md-1">받은날짜</th>
                                 <th class="col-md-1">발송취소</th>
                              </c:otherwise>
                           </c:choose>




                        </thead>
                        <tbody>
                           <c:forEach var="messageDTO" items="${messageList}">
                              <c:choose>
                                 <c:when test="${flag==false}">
                                    <!-- 받은쪽지함 -->
                                    <c:if test="${messageDTO.messageState!=1 }">
                                       <tr>
                                           <%-- <td><input type="checkbox" class="checkthis"
                                             name="messageNoArr" value="${messageDTO.messageNo }" /></td>  --%>
                                             
                                             <td>
                                                    <input type="checkbox" class="checkthis" name="messageNoArr" value="${messageDTO.messageNo }">
                                             </td>   
                                             
                                          <td>${messageDTO.userDTO.userId}
                                             (${messageDTO.userDTO.userName})</td>
                                          <td><div style="white-space: nowrap;text-overflow:ellipsis;width: 400px;overflow: hidden;"><a
                                             href="javascript:messageSelect(${messageDTO.messageNo });">${messageDTO.messageContent}</a></div></td>
                                          <td>${messageDTO.messageSendTime }</td>
                                       </tr>
                                    </c:if>

                                 </c:when>
                                 <c:otherwise>
                                    <!-- 보낸쪽지함 -->
                                    <c:if test="${messageDTO.messageState!=2 }">
                                       <tr>
                                          <td><input type="checkbox" class="checkthis"
                                             name="messageNoArr" value="${messageDTO.messageNo }" /></td>
                                          <td>${messageDTO.userDTO.userId}
                                             (${messageDTO.userDTO.userName})</td>
                                          <td><div style="white-space: nowrap;text-overflow:ellipsis;width: 400px;overflow: hidden;"><a
                                             href="javascript:messageSelect(${messageDTO.messageNo });">${messageDTO.messageContent}</a></div></td>
                                          <td>${messageDTO.messageSendTime }</td>


                                          <c:choose>
                                             <c:when test="${messageDTO.messageReceiveTime==null }">
                                                <td>-</td>
                                                <td><p data-placement="top" data-toggle="tooltip"
                                                      title="Delete">
                                                      <button class="btn btn-Info btn-filter"
                                                         data-title="Delete" id="deleteBtn"
                                                         data-toggle="modal" data-target="#delete"
                                                         name="${messageDTO.messageNo}">
                                                         <div class="icon-container">
                                                                  <span class="ti-close"></span>
                                                               </div>
                                                      </button>
                                                   </p></td>
                                             </c:when>
                                             <c:otherwise>
                                                <td>${messageDTO.messageReceiveTime }</td>
                                                <td>&nbsp;</td>
                                             </c:otherwise>
                                          </c:choose>
                                       </tr>
                                    </c:if>




                                 </c:otherwise>
                              </c:choose>



                           </c:forEach>

                        </tbody>

                     </table>





                  <!-- paging -->
                     <div style="text-align:center">
                     
                     <ul class="pagination">

                  
                        <c:choose>
                           <c:when test="${startPage==1}">
                              <li class="disabled"><a href="#"><div class="icon-container">
                                                         <span class="ti-angle-double-left"></span>
                                                      </div></a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="disabled"><a
                                 href="${pageContext.request.contextPath}/message/main?userNo=13&flag=${flag }&pageNumber=${endPage-pageSu}"><div class="icon-container">
                                                         <span class="ti-angle-double-left"></span>
                                                      </div></a></li>
                           </c:otherwise>
                        </c:choose>

                        <c:forEach begin="${startPage}" end="${endPage}" var="pageNum"
                           step="1">
                           <li><a
                              href="${pageContext.request.contextPath}/message/main?userNo=13&flag=${flag}&pageNumber=${pageNum}&searchText=${searchText}&categoryNo=${categoryNo}">${pageNum}</a></li>
                        </c:forEach>

                        <c:choose>
                           <c:when test="${stopLastPage==true}">

                              <li class="disabled"><a href="#"><div class="icon-container">
                                                      <span class="ti-angle-double-right"></span>
                                                   </div></a></li>
                           </c:when>
                           <c:otherwise>
                              <li><a
                                 href="${pageContext.request.contextPath}/message/main?userNo=13&flag=${flag }&pageNumber=${startPage+pageSu}"><div class="icon-container">
                                                      <span class="ti-angle-double-right"></span>
                                                   </div></a></li>
                           </c:otherwise>
                        </c:choose>
                     </ul>

                  

                  </div>

                  <!-- paging -->
                  </div>

               </div>
            </div>
         </div>
      </div>

      <div class="modal fade" id="delete" tabindex="-1" role="dialog"
         aria-labelledby="edit" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">
                     <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                  </button>
                  <h4 class="modal-title custom_align" id="Heading">쪽지 발송 취소</h4>
               </div>
               <div class="modal-body">
                  
                  <div class="icon-container">
                           <h3><span class="ti-eraser"></span><span class="icon-name"> 발송을 취소하실건가요?</span></h3>
                        </div>

               </div>
               <div class="modal-footer ">
                  <button type="button" class="btn btn-Info" data-dismiss="modal"
                     id="deleteYesBtn">
                     <span class="glyphicon glyphicon-ok-sign"></span> Yes
                  </button>
                  <button type="button" class="btn btn-Info" data-dismiss="modal">
                     <span class="glyphicon glyphicon-remove"></span> No
                  </button>
               </div>

            </div>
         </div>
      </div>

      <jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
   </div>
   </div>

   <%-- <c:import url="/project/chat"/> --%>
</body>

<!--   Core JS Files   -->
<script
   src="${pageContext.request.contextPath }/resources/js/jquery-1.10.2.js"
   type="text/javascript"></script>
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

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/demo.js"></script> --%>
</html>