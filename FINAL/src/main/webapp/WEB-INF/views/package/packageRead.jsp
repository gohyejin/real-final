<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PACKAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
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
   padding: 30px ;
   margin-top: 10px;
   text-align: center;
}

#tbl1{
    width:80%;
   margin:auto;
   overflow: hidden;
   border-collapse:collapse;
}

.tTitle{
   font-size:70px;
   font-weight:bold;
   margin-bottom:0px;
   margin:auto;
}


.title{
   font-size:50px;
   text-align:center;
   margin:auto;
}

.price #btnCart,input[type="submit"]{
   width:300px;
   height: 100px;
   font-size: 35px;
   margin: 2px;
   cursor: pointer;
   background: #e6bbea;
   color: white;
   border:none;
   border-radius:3px 3px 3px 3px;
   float:right;
}

.price #btnCart:active {
   background: #cca6cf;
}

.price input[type='text']{
   height: 60px;
   margin-bottom: 5px;
   text-align: left;
   font-size: 60px;
   font-weight: bold;
   outline: none;
   border: none;
   color:#fc8da0;
   margin:20px;
}

.price{
   padding-right:50px;
   text-align: left;
   font-size: 40px;
   font-weight: bold;
}

.smallImage{
   cursor: pointer;
}

.hiddenFile{
   width:150px;
}

.bigPig{
   width:30%;
   height:700px;
   display: table-cell;
   padding:20px;
   text-align: center;
   vertical-align: middle;
}
.sImageDiv{
   margin: auto;
   cursor: pointer;
    max-width:100%; 
    max-height:100%;
    display: inline-block;
}

.sImage{
   width:100%;
   text-align:center;
   height:200px;
}

</style>
</head>
<body>  
   <jsp:include page="../index_include/menu.jsp" />
   <div id="page">
      <form name="frm" action="update" method="post" enctype="multipart/form-data">
      <jsp:include page="../index_include/header.jsp" />
      <div class="title">⊙ PACKAGE ⊙</div>
      <br><br>
      <div id="content">
         <div id="tbl1">
            <div class="tTitle"><${vo.photo_package_title}></div>
               <div class="bigPig">
                  <img src="../display?fileName=${vo.photo_package_image}" width=500 id="bigPig"/>
                  <img src="" width=500 id="bigImage"/>
               </div><br>
              <div class="sImage">
                 <input type="hidden" value="${param.photo_package_code}" name="photo_package_code">
                    <div class="sImageDiv">
                       <c:if test="${users_note==1}">
                        <input type="file" name="files" accept="image/*" multiple>
                     </c:if>
                        <div id="listFile">
                           <c:forEach items="${list}" var="image">
                              <img src="../display?fileName=${image}" width=150 class="smallImage" id="image">
                           </c:forEach>
                        </div>
                      </div>
                   
            </div><br>
                  <hr>
             
             <div class="price">
               \<input type="text" value="${vo.photo_package_price}" size=10 readonly>
               <c:if test="${users_note==1}">
                  <input type="submit" value="수정">
               </c:if>
               <c:if test="${users_note!=1}">
               <input type="button" value="장바구니에 담기" id="btnCart">
               </c:if>
            </div>
         </div>
      </div>
      </form>
   </div>
   
   <jsp:include page="../index_include/chat.jsp" />
</body>

<script>
$("#bigImage").hide();
$("#tbl1 .sImage").on("click","img",function(){
   var vo_image = $(this).attr("src");
   $("#bigPig").hide();
   $("#bigImage").show();
   $("#tbl1 .bigPig #bigImage").attr("src",vo_image);
})

$("#btnCart").on("click", function(){
   var title="${vo.photo_package_title}";
   var id="${users_id}";
   var package_code="${vo.photo_package_code}";
   var price="${vo.photo_package_price}";
   if(id!="") {
   if(!confirm(title + " 패키지를 장바구니에 담으시겠습니까?")) return;
   $.ajax({
      type:"get",
      url:"/cart/pinsert",
      data:{"package_cart_id":id, "package_cart_package_code":package_code, "package_cart_price":price},
      success:function(){}
   });
   if(!confirm("담겼습니다. 장바구니로 이동하시겠습니까?")) return;
   location.href="/user/cart";
   } else {
      alert("로그인후 이용해주세요.");
      var options = 'width=500, height=700, top=30, left=30, resizable=no, scrollbars=no, location=no';
      window.open('/user/login', 'LOGIN', options);
   }
});

//수정버튼
$(frm).submit(function(e){
   e.preventDefault();
   if(!confirm("수정하시겠습니까?")) return;
   frm.submit();
   alert("수정되었습니다.");
});

$("#imageUpdate").on("click", function(){
   $(frm.file).click();
});

/* $(frm.file).on("change", function(){
   var file=$(frm.file)[0].files[0];
   $("#image").attr("src", URL.createObjectURL(file));
}); */

 $(frm.files).on("change", function(){
   var files=$(frm.files)[0].files;
   var html="";
   $.each(files, function(index, file){
      html += "<img src=" + URL.createObjectURL(file) + ">";
      $("#listFile").html(html);
   });
});


/*  //이미지미리보기 
$(frm.file).change(function(e){
    var reader = new FileReader(); 
    var a=$(this).parent();
    reader.onload=function(e){ 
        a.find(".smallImage").attr("src", e.target.result); 
    } 
    reader.readAsDataURL(this.files[0]); 
}); */
</script>
</html>