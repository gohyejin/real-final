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

#tbl2 {
    width:50%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
}

#tbl3 {
    width:50%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
}

#tbl22 {
   width:50%;
   overflow: hidden;
   border-collapse:collapse;
   display:inline-block;
   float:letf;
}

#tbl33 {
    width:50%;
   overflow: hidden;
   border-collapse:collapse;
   float:left;
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
.orderday{
background:black;
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
         <div id="tbl22">
         <table id="tbl2" border=1></table>
         <script id="temp2" type="text/x-handlebars-template">
            <tr class="tbl2Title">
               <td colspan=6>PackageOrder LIST</td>
            </tr>
            {{#each packagelist}}
               <tr style="text-align:left">
                  <td colspan=6 class="orderday">
                     주문일&nbsp;
                     <b>{{orders_day}}</b>
                  </td>
               <tr>
               <tr>
                  <td>대표이미지</td>
                  <td>패키지</td>
                  <td>수량</td>
                  <td>가격</td>
                  <td>결제방법</td>
              <td>합계</td>
               </tr>
               <tr class="row">
                  <td><img src="../display?fileName={{photo_package_image}}" width=150/></td>
                  <td>{{photo_package_title}}</td>
                  <td>{{orders_package_quantity}}</td>
                  <td>{{package_cart_price}} 원</td>
                  <td>{{printStyle orders_paytype}}</td>
              <td>{{total}} 원</td>
               </tr>
            {{/each}}
         </script>
         </div>
         <div id="tbl33">
         <table id="tbl3" border=1></table>
         <script id="temp3" type="text/x-handlebars-template">
            <tr class="tbl2Title">
               <td colspan=6>CostumeOrder LIST</td>
            </tr>
            {{#each costumelist}}
               <tr style="text-align:left">
                  <td colspan=6 class="orderday">
                     주문일&nbsp;
                     <b>{{orders_day}}</b>
                  </td>
               <tr>
               <tr>
                  <td>대표이미지</td>
                  <td>코스튬</td>
                  <td>수량</td>
                  <td>가격</td>
                  <td>결제방법</td>
              <td>합계</td>
               </tr>
               <tr class="row">
                  <td><img src="../display?fileName={{lend_costume_image}}" width=150/></td>
                  <td>{{lend_costume_name}}</td>
              <td>{{orders_costume_quantity}}</td>
                  <td>{{costume_cart_price}} 원</td>
                  <td>{{printStyle2 orders_paytype}}</td>
                  <td>{{total}} 원</td>
               </tr>
            {{/each}}
         </script>
         </div>
      </div>
   </div>
   <jsp:include page="../chat.jsp" />
</body>
<script>
   var users_id="${users_id}";
   getpackageList();
   getcostumeList();
   getPoint();
   
   
   var orders_paytype="${map.orders_paytype}";
   
   Handlebars.registerHelper("printStyle",function(type){
         var src;
         if(orders_paytype == type) {
            src="카카오 결제";
         } else if(orders_paytype != type) {
            src="현금결제";
         }
         return src;
         
      });
   
  

   Handlebars.registerHelper("printStyle2",function(type){
         var src;
         if(orders_paytype == type) {
            src="카카오 결제";
         } else if(orders_paytype != type) {
            src="현금결제";
         }
         return src;
         
      });
   
   function getpackageList(){
      $.ajax({
         type:"get",
         url:"/order/packagelist",
         data:{"users_id":users_id},
         dataType:"json",
         success:function(data){
            var temp=Handlebars.compile($("#temp2").html());
            $("#tbl2").html(temp(data));
         }
      });
   }
   
   function getcostumeList(){
         $.ajax({
            type:"get",
            url:"/order/costumelist",
            data:{"users_id":users_id},
            dataType:"json",
            success:function(data){
               var temp=Handlebars.compile($("#temp3").html());
               $("#tbl3").html(temp(data));
            }
         });
      }
   
   function getPoint(){
      $.ajax({
         type:"get",
         url:"/user/point",
         data:{"users_id":users_id},
         dataType:"json",
         success:function(data){
            $("#point").html(data);
         }
      });
   }
   
   /*UPDATE클릭 했을때 이동*/
   $(".userUpdate").on("click", function(){
      location.href="/user/mypageRead";
   })

</script>
</html>