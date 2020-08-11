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
* {
	font-family: '@여기어때 잘난체'
}

#page {
	background: white;
	margin: 15px;
	height: hidden;
}

#content {
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
	width: 90%;
	margin: auto;
	height: 800px;
}

#tbl1 {
	width: 40%;
	float: right;
	overflow: hidden;
	border-collapse: collapse;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
}

th {
	padding: 15px;
	font-size: 20px;
	border-bottom: 3px solid #e360f2;
}

#button {
	cursor: pointer;
}

#calendar {
	width: 60%;
	float: left;
}

.X {
	float: right;
	border: none;
	font-size: 20px;
	margin-botton: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ RESERVATION ⊙</div><br><br>
		<div id="content">
   <div class="container calendar-container">
       <div id="calendar" style="max-width: 900px; margin: 40px auto;"></div>
   </div>
   <div id="reservation2">
         <table id="tbl1"></table>    
            <script id="temp" type="text/x-handlebars-template"> 
               <tr>
                  <th>예약번호</th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>예약시간</th>
               </tr>
               {{#each list}}
               <tr class="row">
                  <td class="reno">{{reservation_reno}}</td>
                  <td>{{reservation_id}}</td>
                  <td>{{users_name}}</td>
                  <td>
					{{reservation_redate}}
					<button class="X">X</button>
				  </td>
               </tr>
               {{/each}}
            </script>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">



$(document).ready(function() {
 $('#calendar').fullCalendar({
  header:{
   left: 'prevYear,prev,next,nextYear,today',
   center: 'title',
   right:'none'
  },
  timeFormat: 'H(:mm)시',         
  events: function (title, start, timezone, callback) {
	$.ajax({
		type : "get" /* "POST", "GET" */,
		url : "/reservationlist" /* Request URL */,
		dataType : "json"/* jSonCalList에 json정보 담기 */,
     	success : function(data) {
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
         url : "reservationlist",
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl1").html(temp(data));
            }
         });
      }
      
      
   $("#tbl1").on("click", ".row .X", function(){
      var reservation_reno=$(this).parent().parent().find(".reno").html()
      $.ajax({
         type : "post",
         url : "redelete",
         data:{"reservation_reno":reservation_reno},
         success : function() {
            alert("삭제 되었습니다.");
            getList();
            }
         });
   });
   
</script>
</html>