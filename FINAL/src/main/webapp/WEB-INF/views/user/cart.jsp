<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체'
}

#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: hidden;
}

#content {
	display:inline-block;
	margin:10%;
	margin-top: 10px;
	margin-bottom: 40px;
	text-align: center;
	width: 80%;
	height:hidden;
}

#tbl1{
	float:left;
	width:48%;
	margin: 5px;
	overflow: hidden;
	border-collapse: collapse;
}

#tbl2 {
	float:right;
	width:48%;
	margin: 5px;
	overflow: hidden;
	border-collapse: collapse;
	height: 100px;
}

td{
	padding: 15px;
	border-bottom:1px solid #e360f2;
}

th {
	padding: 15px;
	font-size: 25px;
	border-bottom:3px solid #e360f2;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

.btnDel {
	font-size: 20px;
	border: none;
	cursor: pointer;
}

.number{
	width:30px;
}

#COSTUME,#PACKAGE{
	color:#e360f2;
	font-size: 30px;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

.btnDel:hover{
	color: #e360f2;
}

#divFinal{
	text-align: center;
	width:1250px;
	margin: auto;
	height:300px;
	padding-left:12%;
}

#divSum, #divShipping, #divtotalSum {
	padding-top:80px;
	padding-bottom:80px;
	border: 1px solid #e360f2;
	display: block;
	width: 300px;
	height: hidden;
	display: table-cell;
	vertical-align: middle;
	float:left;
}

#divSum input[type='text'],#divShipping input[type='text'],#divtotalSum input[type='text']{
   width: 100px;
   height: 40px;
   margin-top: 7px;
   margin-bottom: 5px;
   text-align: right;
   font-size: 20px;
   color: #dc1c2c;
   font-weight: bold;
   outline: none;
   border: none;
}

.divOper div {
   margin-top: 250%;
   font-size: 40px;
}

.divOper {
   display: block;
   height: 200px;
   width: 50px;
   float: left;
}

.OrderArea {
   text-align: center;
   padding-bottom: 30px;
}

#btnOrder {
   width: 250px;
   margin-top: 50px;
   margin-right: 15px;
   height: 50px;
   border: 1px solid #e360f2;
   border-radius: 4px 4px 4px 4px;
   background: #e360f2;
   color: white;
   font-size:30px;
   font-weight: bold;
   outline: none;
   cursor: pointer;
}

</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="page">
		<jsp:include page="../header.jsp" />
		<div class="title">⊙CART⊙</div>
		<br><br>
		<div id="content">
			<table id="tbl1">
				<tr class="row">
					<th colspan=5 id="PACKAGE">PACKAGE</th>
				</tr>
				<tr class="row">
					<th><input type="checkbox" class="chkAll"></th>
					<th>IMAGE</th>
					<th>INFO</th>
					<th colspan=2>PRICE</th>
				</tr>
				<tr class="row">
					<td><input type="checkbox" class="chk"></td>
					<td>IMAGE(DB)</td>
					<td><span>INFO(DB)</span> <span>단가(DB)</span> <span> <input
							type="number" value="1" min="1" class="number">
					</span></td>
					<td>PRICE(DB)</td>
					<td><button class="btnDel">X</button></td>
				</tr>
			</table>
			<table id="tbl2">
				<tr class="row">
					<th colspan=5 id="COSTUME">COSTUME</th>
				</tr>
				<tr class="row">
					<th><input type="checkbox" class="chkAll"></th>
					<th>IMAGE</th>
					<th>INFO</th>
					<th colspan=2>PRICE</th>
				</tr>
				<tr class="row">
					<td><input type="checkbox" class="chk"></td>
					<td>IMAGE(DB)</td>
					<td><span>INFO(DB)</span> <span>단가(DB)</span> <span> <input
							type="number" value="1" min="1" class="number">
					</span></td>
					<td>PRICE(DB)</td>
					<td><button class="btnDel">X</button></td>
				</tr>
			</table>
		</div>
		<div id="divFinal">
			<div id="divSum">
				<div>
					<h2>PACKAGE</h2>
					<input type="text" id="packageSum" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>+</div>
			</div>
			<div id="divShipping">
				<div>
					<h2>COSTUME</h2>
					<input type="text" id="costumeSum" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>=</div>
			</div>
			<div id="divtotalSum">
				<div>
					<h2>TOTAL</h2>
					<input type="text" id="totalSum" readonly> 원 <br>
				</div>
			</div>
		</div>
		<div class="OrderArea">
			<button id="btnOrder">예약하기</button>
		</div>
	</div>
	<jsp:include page="../chat.jsp" />
</body>
<script>
	//각 행에있는 체크버튼을 클릭 했을 때
	$("#tbl1").on("click", ".row .chk", function() {
		var isChkAll = true;
		$("#tbl1 .row .chk").each(function() {
			if (!$(this).is(":checked")) {
				isChkAll = false;
			}
		});
		if (isChkAll) {
			$("#tbl1 .chkAll").prop("checked", true);
		} else {
			$("#tbl1 .chkAll").prop("checked", false);
		}
	});

	//전체 체크버튼을 클릭 했을때
	$("#tbl1").on("click", ".chkAll", function() {
		if ($(this).is(":checked")) {
			$("#tbl1 .row .chk").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("#tbl1 .row .chk").each(function() {
				$(this).prop("checked", false);
			});
		}
	});

	//각 행에있는 체크버튼을 클릭 했을 때
	$("#tbl2").on("click", ".row .chk", function() {
		var isChkAll = true;
		$("#tbl2 .row .chk").each(function() {
			if (!$(this).is(":checked")) {
				isChkAll = false;
			}
		});
		if (isChkAll) {
			$("#tbl2 .chkAll").prop("checked", true);
		} else {
			$("#tbl2 .chkAll").prop("checked", false);
		}
	});

	//전체 체크버튼을 클릭 했을때
	$("#tbl2").on("click", ".chkAll", function() {
		if ($(this).is(":checked")) {
			$("#tbl2 .row .chk").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("#tbl2 .row .chk").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
</script>
</html>