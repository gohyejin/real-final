<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COSTUME</title>
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

.cart{
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

.cart:active {
	background: #cca6cf;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ COSTUME ⊙</div>
		<br><br>
		<div id="content">
			<table id="tbl1">
				<tr>
					<td rowspan=6 width=500><img src="display?fileName=jpg1.jpg" width=500 /></td><!-- 예시사진 -->
				</tr>
				<tr>
					<th width=150>TITLE</th>
					<td colspan=3>title(DB)</td>
				</tr>
				<tr>
					<th width=150>SIZE</th>
					<td width=200>
						<select>
							<option>S</option>
							<option>M</option>
							<option>L</option>
							<option>XL</option>
						</select>
					</td>
					<th width=150>PRICE</th>
					<td width=200>price(DB)</td>
				</tr>
				<tr>
					<th>INFO</th>
					<td colspan=3></td>
				</tr>
				<tr>
					<td colspan=4>info(DB)</td>
				</tr>
				<tr>
					<th colspan=4><button class="cart">장바구니에 담기</button></th>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="chat.jsp" />
</body>
<script>

</script>
</html>