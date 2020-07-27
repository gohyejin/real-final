<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PACKAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ PACKAGE ⊙</div>
		<br><br>
		<div id="content">
			<table id="tbl1" border=1>
				<tr>
					<td rowspan=3 width=500><img src="display?fileName=jpg1.jpg" width=500 /></td><!-- 예시사진 -->
					<th width=150 height=100>TITLE</th>
					<td>title(DB)</td>
				</tr>
				<tr>
					<th width=150></th>
					<td width=400 height=100 class="price"><input type="text" value="DB" readonly>원</td>					
				</tr>
				<tr>
					<th rowspan=2 colspan=2 class="cart" height=200><button>장바구니에 담기</button></th>
				</tr>
				<tr>
					<th height=100>
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
					</th>
				</tr>
				<tr>
					<td height=100>
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
						<img src="display?fileName=jpg1.jpg" width=100 />
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="chat.jsp" />
</body>
<script>

</script>
</html>