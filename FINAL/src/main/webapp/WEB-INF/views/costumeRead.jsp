<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSTUME</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체'
}

#page {
	background: white;
	margin: 15px;
	padding-bottom: 30px;
	height: hidden;
}

#content {
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px;
	margin-top: 10px;
	text-align: center;
}

#tbl1 {
	width: 80%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
}

td {
	padding: 15px;
}

th {
	padding: 15px;
	font-size: 30px;
}

.info {
	text-align: left;
	padding-left: 20px;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

select {
	width: 100%;
	height: 25px;
	font-size: 20px;
	border: none;
	text-align-last: center;
}

select option {
	height: 25px;
	font-size: 20px;
	border: none;
	text-align-last: center;
}

.cart {
	width: 300px;
	height: 100px;
	font-size: 35px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
	float: right;
}

.cart:active {
	background: #cca6cf;
}

	input[type=file]{visibility:hidden; height:0px;}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ COSTUME ⊙</div>
		<br>
		<br>
		<div id="content">
			<form name="frm" action="costumeUpdate" method="post"
				enctype="multipart/form-data">
				<!-- <input type="hidden" value="${users_id}"> -->
				<table id="tbl1">
					<tr>
						<!-- 예시사진 -->
						<td rowspan=6 width=500><input type="file" name="file">
							<c:if
								test="${vo.lend_costume_image!=null && vo.lend_costume_image!=''}">
								<img id="image" src="/display?fileName=${vo.lend_costume_image}"
									width=500 />
							</c:if> <c:if
								test="${vo.lend_costume_image==null || vo.lend_costume_image==''}">
								<img id="image" src="http://placehold.it/100x80" width=100>
							</c:if> <!-- 예시사진 --> 
							
							<input type="hidden" name="lend_costume_image"
							value="${vo.lend_costume_image}"></td>
					</tr>
					<tr>
						<th width=150>TITLE</th>
						<td><input type="text" value="${vo.lend_costume_code}" name="lend_costume_code" readonly></td>
						<td colspan=3>
							<input type="text" value="${vo.lend_costume_name}" name="lend_costume_name">
						</td>
					</tr>
					<tr>
						<th width=150>SIZE</th>
						<td width=200><select name="size">
								<option
									<c:out value="${vo.lend_costume_size=='S'?'selected':''}"/>>S</option>
								<option
									<c:out value="${vo.lend_costume_size=='M'?'selected':''}"/>>M</option>
								<option
									<c:out value="${vo.lend_costume_size=='L'?'selected':''}"/>>L</option>
								<option
									<c:out value="${vo.lend_costume_size=='XL'?'selected':''}"/>>XL</option>
						</select></td>
						<th width=150>PRICE</th>
						<td width=200>
							<input type="text" value="${vo.lend_costume_price}" name="lend_costume_price">
						</td>
					</tr>
					<tr>
						<th>AMOUNT</th>
						<td><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select></td>
					</tr>
					<tr>
						<th>INFO</th>
						<td colspan=3></td>
					</tr>
					<tr>
						<td colspan=4>
							<textarea name=lend_costume_content rows=10 cols=50>${vo.lend_costume_content}</textarea>
						</td>
					</tr>
					<tr>
						<th colspan=4><button class="cart">장바구니에 담기</button></th>
					</tr>
				</table>
				<c:if test="${users_note==1}">
					<input type="submit" value="수정">
				</c:if>
				<input type="button" value="목록" id="btnList"
					onClick="location.href='costumeList'">
			</form>
		</div>
		<jsp:include page="costumeReply.jsp" />
	</div>
	<jsp:include page="chat.jsp" />
</body>
<script>
	//이미지 클릭했을떄
	$("#image").on("click", function() { //이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
	});

	//파일업로드
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0]; //1번째 input type="file"에서 이미지 1개만
		$("#image").attr("src", URL.createObjectURL(file));
	});
	
	//장바구니 버튼을 클릭했을 때
	$(".cart").on("click", function(){
		if(!confirm("상품을 장바구니에 담으시겠습니까?")) return;
		frm.action="cartInsert";
		frm.submit();
		alert("장바구니에 담겼습니다!");
	});
	
	//수정버튼을 눌렀을 대
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("상품정보를 수정하시겠습니까?")) return;
		frm.submit();
		alert("상품정보를 수정하였습니다!");
	});
</script>
</html>