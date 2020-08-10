<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
   <title>예약하기</title>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
   <link
      href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
      rel='stylesheet' />
   <link
      href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
      rel='stylesheet' media='print' />
   <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>

/* pc 화면 */
@media ( min-width : 768px) {
   #button {
      position: fixed;
      z-index: 999;
      right: 30px; /* 화면 오른쪽으로부터의 거리 */
      bottom: 90px; /* 화면 아래쪽으로부터의 거리 */
   }
}
/* 모바일 화면 */
@media ( max-width :767px) {
   #button {
      position: fixed;
      z-index: 999;
      right: 15px; /* 화면 오른쪽으로부터의 거리 */
      bottom: 45px; /* 화면 아래쪽으로부터의 거리 */
   }
}

#button{
   cursor:pointer;
   }
#external-events {
    position: fixed;
    z-index: 2;
    top: 300px;
    left: 140px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
  }
 
  #calendar-container {
    position: relative;
    z-index: 1;
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
    padding-left:50px;
    float:left;
  }
  #reservation {
     
     
  }
  

</style>
</head>
<body>
   <div class="container calendar-container">
       <div id="calendar" style="max-width: 900px; margin: 40px auto;"></div>
   </div>
   <div id="reservation2">
         <table>
            <tr>
               <td>날짜 선택</td>
               
               <td><input type="date" id="Rdate"></td>
               <td>
                  <select id="timeSelect">
                     
                     <option>시간선택</option>
                     <option value="09:00:00">09:00 AM</option>
                     <option value="10:00:00">10:00 AM</option>
                     <option value="11:00:00">11:00 AM</option>
                     <option value="12:00:00">12:00 PM</option>
                     <option value="13:00:00">13:00 PM</option>
                     <option value="14:00:00">14:00 PM</option>
                     <option value="15:00:00">15:00 PM</option>
                     <option value="16:00:00">16:00 PM</option>
                     <option value="17:00:00">17:00 PM</option>
                     
                  </select>
               </td>
               
            </tr>
            <tr>
               <td>예약자</td>
               <td><input type="text" value="${users_name}" id="users_name" readonly></td>
               <td><input type="hidden" value="${users_id}" id="users_id" readonly></td>
            </tr>
            <tr>
               <td><input type="button" value="예약하기" id="btnReser"></td>
            </tr>
         </table>
         <table id="tbl" border=1></table>    
            <script id="temp" type="text/x-handlebars-template"> 
               <tr>
                  <th>예약번호</th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>예약시간</th>
                  <th>삭제</th>
               </tr>
               {{#each plist}}
               <tr class="row">
                  <td class="reno">{{reservation_reno}}</td>
                  <td>{{reservation_id}}</td>
                  <td>{{users_name}}</td>
                  <td>{{reservation_redate}}</td>
                  <td><button>삭제</button></td>
               </tr>
               {{/each}}
            </script>
   </div>
</body>
<script type="text/javascript">



$(document).ready(function() {
 $('#calendar').fullCalendar({
  header:{
   left: 'prevYear,prev,next,nextYear,today',
   center: 'title',
   right:'month,agendaWeek,agendaDay'
  },
  timeFormat: 'H(:mm)시',         
  events: function (title, start, timezone, callback) {
   $.ajax({
      type :"get" //"POST", "GET"
     ,url :"/reservationlist" //Request URL
     ,dataType :"json"//jSonCalList에 json정보 담기
     ,success : function(data) {
    var json = data.list;
    var events = [];
      $.each(json,function(i,obj){
      
         events.push({
            "title": json[i].users_name, 
            "start": json[i].reservation_redate
            });
      }); 
      callback(events);
     }
      });
  }
 });
});


</script>
<script>


var users_id="${users_id}";

getList();

function getList() {
   $.ajax({
         type : "get",
         url : "ReservationPrivateList",
         data:{"users_id":users_id},
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
            }
         });
      }
      
      
   $("#tbl").on("click", ".row button", function(){
      var reservation_reno=$(this).parent().parent().find(".reno").html()
      $.ajax({
         type : "post",
         url : "redelete",
         data:{"reservation_reno":reservation_reno},
         success : function() {
            alert("삭제 되었습니다.");
            location.href="/calendar";
            }
         });
   });
   
   
   $("#btnReser").on("click", function(){
      var date=$("#Rdate").val();
      var time=$("#timeSelect").val();
      var id=$("#users_id").val();
      
      var yyyy = date.substr(0,4);
      var MM = date.substr(5,2);
      var dd = date.substr(8,2);  
      
      var kk = time.substr(0,2);
      var mm = time.substr(3,2);   
      var ss = time.substr(6,2);  
      
      var trueDate = new Date(yyyy, MM-1, dd, kk, mm, ss);
   
         
            $.ajax({
               type : "post",
               url : "reinsert",
               data:{"reservation_id":id, "reservation_redate":trueDate},
               success : function(data) {
                  if(data==1) {
                  alert("저장 되었습니다.");
                  location.href="/calendar";
                  } else {
                     alert("이미 예약이 잡혀있습니다.");
                  }
                  }
               });
         
            
   });
   
</script>
</html>