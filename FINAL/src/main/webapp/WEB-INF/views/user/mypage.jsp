<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
* {font-family:'@여기어때 잘난체'}

#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: hidden;
}

#content {
   margin-top:none;
   margin-left:70px;
   margin-right:70px;
   padding: 30px margin-top: 10px;
   text-align: center;
}

#tbl1,#tbl2 {
    width:50%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
}

td{
   padding:15px;
}

.title{
   font-size:50px;
   text-align:center;
   margin:auto;
}
.tbl2Title,.tbl1Title{
   font-size:40px;
}

.userUpdate{
   cursor: pointer;
}

.userUpdate:hover{
   background:#e360f2;
   color:white;
}
</style>
</head>
<body>
   <jsp:include page="../menu.jsp" />
   <div id="page">
      <jsp:include page="../header.jsp" />
      <div class="title">⊙ MY PAGE ⊙</div>
      <br><br>
      <div id="content">
         <table id="tbl1" border=1>
            <tr class="tbl1Title">
               <td>
                  <span id="point"></span> POINT
               </td>
               <td class="userUpdate">UPDATE</td>
            </tr>
         </table><br>
         <table id="tbl2" border=1></table>
         <script id="temp" type="text/x-handlebars-template">
            <tr class="tbl2Title">
               <td colspan=6>ORDER LIST</td>
            </tr>
            {{#each list}}
               <tr style="text-align:left">
                  <td colspan=6>
                     주문일&nbsp;
                     <b>{{orders_day}}</b>
                  </td>
               <tr>
               <tr>
                  <td>대표이미지</td>
                  <td>패키지</td>
                  <td>의상대여</td>
                  <td>수량</td>
                  <td>가격</td>
                  <td>결제방법</td>
               </tr>
               <tr>
                  <td><img src="../display?fileName={{photo_package_image}}" width=150/></td>
                  <td>{{photo_package_title}}</td>
                  <td>{{lend_costume_name}}</td>
                  <td>{{orders_quantity}}</td>
                  <td>{{orders_price}} 원</td>
                  <td>{{orders_paytype}}</td>
               </tr>
            {{/each}}
         </script>
      </div>
   </div>
   <jsp:include page="../chat.jsp" />
</body>
<script>
   var orders_id="${users_id}";
   getList();
   getPoint();
   
   function getList(){
      $.ajax({
         type:"get",
         url:"/order/list",
         data:{"orders_id":orders_id},
         dataType:"json",
         success:function(data){
            var temp=Handlebars.compile($("#temp").html());
            $("#tbl2").html(temp(data));
         }
      });
   }
   
   function getPoint(){
      $.ajax({
         type:"get",
         url:"/user/point",
         data:{"users_id":orders_id},
         dataType:"json",
         success:function(data){
            $("#point").html(data);
         }
      });
   }
   
   /*UPDATE클릭 했을때 이동*/
   $(".userUpdate").on("click", function(){
      location.href="/user/read";
   })

</script>
</html>