<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
   <title>RESERVATION</title>
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

#tbl1, #tbl2 {
	width: 38%;
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

#tbl2 th {
	border-right: 3px solid #e360f2;
	border-bottom: 1px solid #e360f2;
}

#Rbutton {
	border: none;
}

#Rbutton input {
	width: 150px;
	height: 50px;
	font-size: 20px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	text-align: center;
}

#users_name {
	border: none;
	height: 25px;
	font-size: 18px;
	text-align: center;
}

#Rdate {
	border: none;
	height: 25px;
	font-size: 18px;
}

#timeSelect {
	border: none;
	height: 25px;
	font-size: 18px;
	margin-left: 15px;
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
				<div id="calendar"></div>
				<br>
			</div>
			<div id="reservation2">
				<table id="tbl2">
					<tr>
						<th>예약자</th>
						<td>
							<input type="text" value="${users_name}" id="users_name" readonly>
							<input type="hidden" value="${users_id}" id="users_id" readonly>
						</td>
					</tr>
					<tr>
						<th>날짜 선택</th>
						<td>
							<input type="date" id="Rdate">
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
						<td colspan=2 id="Rbutton"><input type="button" value="예약하기" id="btnReser"></td>
					</tr>
				</table>
				<table id="tbl1"></table>
				<script id="temp" type="text/x-handlebars-template"> 
               <tr>
                  <th>NO.</th>
                  <th>ID</th>
                  <th>NAME</th>
                  <th>TIME</th>
               </tr>
               {{#each plist}}
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
			$.each(json, function(i, obj) {
				events.push({
					"title" : json[i].users_name,
					"start" : json[i].reservation_redate
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
             getList();
             } else {
                alert("이미 예약되어있는 시간입니다.");
             }
             }
          });
   });
   
</script>
</html>