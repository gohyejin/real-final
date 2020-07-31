<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ORDER LIST</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
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
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px margin-top: 10px;
	text-align: center;
}

#tbl1 {
	width: 85%;
	margin: auto;
	overflow: hidden;
	border-collapse: collapse;
	text-align: center;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
	margin-top:10px;
}

td {
	padding: 15px;
	border-bottom: 1px solid #e360f2;
}

th {
	padding: 15px;
	font-size: 25px;
	border-bottom: 3px solid #e360f2;
}

#btnInsert {
	text-align: center;
}

.row:hover {
	background:hotpink;
	cursor: pointer;
	color:#fff;
}

#pagination{
	padding:20px;
	text-align:center;
}

.search{
	margin:auto;
	text-align:center;
	padding:20px;
}

input[type="submit"]{
	width: 100px;
	height: 30px;
	font-size: 15px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border: none;
	border-radius: 3px 3px 3px 3px;
}


input[type="submit"]:active {
	background: #cca6cf;
}

input[type="text"]::placeholder {
	text-align: center;
}

input[type="text"]{
	height: 25px;
	font-size: 20px;
	text-align: center;
	border: none;
	padding: 5px;
}

select{
	height: 30px;
	font-size: 20px;
	border: none;
}

hr{
	border: 2px solid #e360f2;
	width:85%;
}

#total{
	text-align:center;
}

.a button{
	width: 100px;
	height: 30px;
	font-size: 15px;
	cursor: pointer;
	background: #e6bbea;
	color: #e360f2;
	border: none;
	border-radius: 3px 3px 3px 3px;
	
}

.a{
	width: 100%;
	height: 30px;
	float:right;
	text-align: center;
	margin-top:20px;
	margin-bottom:20px;
}

.a button:hover {
	color: black;
}

.active {
	color: hotpink;
}

</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="page">
	<jsp:include page="../header.jsp" />
	<div id="total">ORDERS COUNT : ${pm.totalCount}</div>
	<div class="title">⊙ ORDERS LIST ⊙</div>
	<div class="a">
		<button onClick="location.href='/admin/PCchart'">CHART <i class="fas fa-chart-line"></i></button>
	</div>
	<div id="orderList">
		<div>
		<form name="frm" action="/admin/chart">
		<div class="search">
			<select name="searchType">
				<option value="photo_package_title" <c:out value="${cri.searchType=='photo_package_title'?'selected':''}"/>>PACKAGE</option>
				<option value="lend_costume_name" <c:out value="${cri.searchType=='lend_costume_name'?'selected':''}"/>>COSTUME</option>
				<option value="orders_paytype" <c:out value="${cri.searchType=='orders_paytype'?'selected':''}"/>>PAY TYPE</option>
				<option value="orders_day" <c:out value="${cri.searchType=='orders_day'?'selected':''}"/>>MONTH</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}" size=50 placeholder="SEARCH TERM"> 
			<input type="submit" value="SEARCH">
		</div><hr>
		</form>
		</div>
		<table id="tbl1">
			<tr>
				<th width=20>NO.</th>
				<th>ID</th>
				<th>NAME</th>
				<th>PACKAGE</th>
				<th>COSTUME</th>
				<th>ORDER DATE</th>
				<th>DISCOUNT</th>
				<th>ALL TOTAL</th>
			</tr>
			<c:forEach items="${ordersList}" var="vo">
			<tr class="row">
				<td class="orders_no">${vo.orders_no}</td>
				<td>${vo.orders_id}</td>
				<td>${vo.users_name}</td>
				<td>${vo.photo_package_title}</td>
				<td>${vo.lend_costume_name}</td>
				<td><fmt:formatDate value="${vo.orders_day}" pattern="yyyy년MM월dd일"/></td>
				<td><fmt:formatNumber value="${vo.discount}" pattern="#,### Point" /></td>
				<td><fmt:formatNumber value="${vo.total}" pattern="#,### 원" /></td>
			</tr>
			</c:forEach>
		</table>
		<div id="pagination">
		        <c:if test="${pm.prev}">
		            <a href="${pm.startPage-1}">◀</a>
		        </c:if>
		        <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
		            <c:if test="${pm.cri.page == i }">
		                [<a href="${i}" class='active'>${i}</a>]
		            </c:if>
		            <c:if test="${pm.cri.page != i }">
		                [<a href="${i}">${i}</a>]
		            </c:if>
		        </c:forEach>
		        <c:if test="${pm.next}">
		            <a href="${pm.endPage+1}">▶</a>
		        </c:if>
		        <input type="hidden" id="page2" value="${pm.cri.page}">
    	</div>
	</div>
	</div>
		<jsp:include page="../chat.jsp"/>
	<jsp:include page="../top.jsp"/>
	
</body>
<script>
$("#tbl1").on("click", ".row", function(){
	var orders_no=$(this).find(".orders_no").html();
	var page="${param.page}";
	location.href = "/admin/orderread?orders_no=" + orders_no+ "&page="+page;
});

$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="chart?page="+page;
});
</script>
</html>