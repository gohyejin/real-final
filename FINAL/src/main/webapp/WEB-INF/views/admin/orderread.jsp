<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ORSER READ</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style>
* {
	font-family: '@여기어때 잘난체'
}

#page {
	background: white;
	margin: 15px;
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

#tbl1,#tbl4 {
	width: 100%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
	text-align: center;
	margin-top: 10px;
   margin-bottom: 40px;
}

#tbl2{
   float:left;
   width:48%;
   margin: 2px;
   overflow: hidden;
   border-collapse: collapse;
   text-align: center;
   margin-top: 50px;
   margin-bottom: 50px;
}

#tbl3 {
   float:right;
   width:48%;
   margin: 2px;
   overflow: hidden;
   border-collapse: collapse;
   height: 100px;
   text-align: center;
   margin-top: 50px;
   margin-bottom: 50px;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	margin-top:10px;
}

#tbl2 td,#tbl3 td,#tbl4 td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
}

#tbl2 th,#tbl3 th,#tbl4 th {
	padding: 15px;
	font-size: 25px;
	border-bottom: 3px solid #e360f2;
}

#tbl1 th {
	padding: 15px;
	font-size: 25px;
	border-right: 3px solid #e360f2;
}

#pagination{
	padding:20px;
	text-align:center;
}

#total{
	text-align:center;
}

#COSTUME,#PACKAGE{
   color:#e360f2;
   font-size: 30px;
   text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}

#btnList {
   width:250px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}
.btn{
	text-align: center;
	padding:30px;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="page">
	<jsp:include page="../header.jsp" />
	<div class="title">⊙ ORDERS READ ⊙</div>
	<div id="content">
	<input type="hidden" name="page" value="${param.page}">
	<table id="tbl1">
		<tr>
			<th class="id" width=20%>ID</th>
			<td>${vo.orders_id}</td>
			<th class="name" width=20%>NAME</th>
			<td>${vo.users_name} 님</td>
		</tr>
	</table>
		<table id="tbl2">
			<tr>
               <th colspan=4 id="PACKAGE">PACKAGE</th>
            </tr>
			<tr>
				<th>PACKAGE</th>
				<th>QUANTITY</th>
				<th>PRICE</th>
				<th>TOTAL</th>
			</tr>
			<tr>
				<td>${vo.photo_package_title}</td>
				<td>${vo.orders_package_quantity}개</td>
				<td><fmt:formatNumber value="${vo.photo_package_price}" pattern="#,### 원" /></td>
				<td><fmt:formatNumber value="${vo.package_total}" pattern="#,### 원" /></td>
			</tr>
			</table>
			<table id="tbl3">
			<tr>
               <th colspan=4 id="COSTUME">COSTUME</th>
            </tr>
			<tr>
				<th>COSTUME</th>
				<th>QUANTITY</th>
				<th>PRICE</th>
				<th>TOTAL</th>
			</tr>
			<tr>
				<td>${vo.lend_costume_name}</td>
				<td>${vo.orders_costume_quantity} 개</td>
				<td><fmt:formatNumber value="${vo.lend_costume_price}" pattern="#,### 원" /></td>
				<td><fmt:formatNumber value="${vo.costume_total}" pattern="#,### 원" /></td>
			</tr>
			</table>
		<table id="tbl4">
			<tr>
				<th>ORDER DATE</th>
				<th>PAY TYPE</th>
				<th>ALL PRICE</th>
				<th>ALL TOTAL</th>
			</tr>
			<tr>
				<td><fmt:formatDate value="${vo.orders_day}" pattern="yyyy년MM월dd일"/></td>
				<td>
					<c:if test="${vo.orders_paytype==0}">
						카카오 결제
					</c:if>
					<c:if test="${vo.orders_paytype==1}">
						현금 결제
					</c:if>
				</td>
				<td><fmt:formatNumber value="${vo.discount}" pattern="#,### P" /></td>
				<td><fmt:formatNumber value="${vo.total}" pattern="#,### 원" /></td>
			</tr>
		</table>
		<div class="btn">
			<input type="button" value="LIST" id="btnList">
		</div>
	</div>
	</div>
		<jsp:include page="../chat.jsp"/>
	<jsp:include page="../top.jsp"/>
</body>
<script>
	
	$("#btnList").on("click", function(){
		var page="${param.page}";
		if(page=="") {
			page=1;
		}
		location.href="/admin/chart?page="+page;
	});
</script>
</html>