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

td{
	padding:15px;
}

th{
	padding:15px;
	font-size:30px;
}

.info{
	text-align:left;
	padding-left:20px;
}

.title{
	font-size:50px;
	text-align:center;
	margin:auto;
}

select{
	width:100%;
	height: 25px;
	font-size:20px;
	border:none;
	text-align-last:center; 
}

select option{
	height: 25px;
	font-size:20px;
	border:none;
	text-align-last:center; 
}

.cart button{
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

.cart{
	padding-right:50px;
}

.cart button:active {
	background: #cca6cf;
}

.price input[type='text']{
	width: 100px;
	height: 40px;
	margin-top: 7px;
	margin-bottom: 5px;
	text-align: right;
	font-size: 20px;
	font-weight: bold;
	outline: none;
	border: none;
}

.price{
	padding-right:50px;
	text-align: right;
	font-size: 20px;
	font-weight: bold;
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
			<table id="tbl1" border=1>
				<tr class="row">
					<td rowspan=3 width=500>
						<img src="../display?fileName=${vo.photo_package_image}" width=500 id = "bigPig"/>
						<img src="" width=500 id = "bigImage"/>
					</td><!-- 예시사진 -->
					<th width=150 height=100>TITLE</th>
					<td>"${vo.photo_package_title}"</td>
				</tr>
				<tr>
					<th width=150></th>
					<td width=400 height=100 class="price"><input type="text" value="${vo.photo_package_price}" readonly>원</td>					
				</tr>
				<tr>
					<th rowspan=2 colspan=2 class="cart" height=200><button>장바구니에 담기</button></th>
				</tr>
				<tr class="row">
					<th height=100>
						<c:forEach items="${list}" var="vo">
         				<img src="../display?fileName=${vo}" width=150>
         			</c:forEach>
					</th>
				</tr>
			</table>
		</div>
	</div>
	</form>
	<jsp:include page="chat.jsp" />
</body>

<script>
$("#bigImage").hide();
$("#tbl1 .row").on("click","img",function(){
	var vo_image = $(this).attr("src");
	alert(vo_image);
	$("#bigPig").hide();
	$("#bigImage").show();
	$("#tbl1 .row #bigImage").attr("src",vo_image);
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