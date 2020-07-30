<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSTUME</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
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
/*스타일 추가하기*/
input[type=file]{visibility:hidden; height:0px;}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ COSTUME INSERT ⊙</div>
		<br>
		<br>
		<div id="content">
			<form name="frm" action="costumeInsert" method="post"
				enctype="multipart/form-data">
				<table id="tbl1">
					<tr>
						<td>lend_costume_code</td>
						<td width=400><input type="text" name="lend_costume_code" placeholder="ex)Z001"></td>
					</tr>
					<tr>
						<td>lend_costume_name</td>
						<td width=400><input type="text" name="lend_costume_name"></td>
					</tr>
					<tr>
						<td>lend_costume_image</td>
						<td width=400><input type="file" name="file"> 
						<img id="image" src="http://placehold.it/150x120" width=150 height=120>
						</td>
					</tr>
					<tr>
						<td>lend_costume_amount</td>
						<td width=400><input type="text" name="lend_costume_amount" value=1></td>
					</tr>
					<tr>
						<td>lend_costume_price</td>
						<td width=400><input type="text" name="lend_costume_price"></td>
					</tr>
					<tr>
						<td>lend_costume_size</td>
						<td width=400>
							<select name="lend_costume_size">
							<option>S</option>
							<option>M</option>
 							<option>L</option>
 							<option>XL</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>lend_costume_content</td>
						<td width=400><input type="text" name="lend_costume_content" placeholder="소품은 별도입니다."></td>
					</tr>

				</table>
				<input type="submit" value="저장"> 
				<input type="reset"value="취소"> 
				<input type="button" value="목록" id="btnList">
			</form>
		</div>
	</div>
	<jsp:include page="chat.jsp" />
</body>
<script>
	//목록버튼
	$("#btnList").on("click", function() {
		location.href = "costumeList";
	});
	
	//이미지 클릭했을떄
	$("#image").on("click",function(){	//이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
	});
	
	//파일업로드
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];	//1번째 input type="file"에서 이미지 1개만
		$("#image").attr("src",URL.createObjectURL(file));
		var src=$("#image").attr("src");
		alert(src);
	});
</script>
</html>