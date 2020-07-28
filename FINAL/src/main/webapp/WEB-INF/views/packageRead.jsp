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

.price button{
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

.price button:active {
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

.bigPig{
	width:30%;
	height:700px;
	display: table-cell;
	padding:20px;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>  
<form name="frm" action="update" method="post" enctype="multipart/form-data">
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
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
					<c:forEach items="${list}" var="vo">
         				<img src="../display?fileName=${vo}" width=120 class="smallImage">
         			</c:forEach><hr>
				</div>
				<div class="price">
					\<input type="text" value="${vo.photo_package_price}" size=10 readonly>
					<button>장바구니에 담기</button>
				</div>
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="chat.jsp" />
</body>

<script>
$("#bigImage").hide();
$("#tbl1 .sImage").on("click","img",function(){
	var vo_image = $(this).attr("src");
	$("#bigPig").hide();
	$("#bigImage").show();
	$("#tbl1 .bigPig #bigImage").attr("src",vo_image);
})

//상품이미지 버튼을 눌렀을때
$("#btnImage").on("click", function(){
	$(frm.files).click();
});

//여러 사진파일을 올릴때
 $(frm.files).on("change", function(){
      var files=$(frm.files)[0].files;
      var html="";
      $.each(files, function(index, file){
    	 html += "<img src='" + URL.createObjectURL(file) + "'>"; 
      });
      $("#listFile").html(html);
   });

//삭제버튼
$("#btnDelete").on("click", function(){
	if(!confirm("삭제하시겠습니까?")) return;
	frm.action="delete";
	frm.submit();
});

//수정버튼
$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("수정하시겠습니까?")) return;
	frm.submit();
});

//목록버튼
$("#btnList").on("click", function(){
	location.href="list";
});

$("#image").on("click", function(){
	$(frm.file).click();
});

$(frm.file).on("change", function(){
  var file=$(frm.file)[0].files[0];
  $("#image").attr("src", URL.createObjectURL(file))
})


</script>
</html>