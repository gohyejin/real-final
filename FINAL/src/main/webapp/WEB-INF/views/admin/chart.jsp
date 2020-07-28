<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>운영 정보</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>운영정보</h1>
	<span>
		<a href="/admin/packagechart">패키치차트</a>
		<a href="/admin/costumechart">코스튬차트</a>
	</span>
	<div id="orderList">
		결제수 : <span id="total">${pm.totalCount}</span>
		<div>
		<form name="frm" action="/admin/chart">
			<select name="searchType">
				<option value="photo_package_title" <c:out value="${cri.searchType=='photo_package_title'?'selected':''}"/>>패키지</option>
				<option value="lend_costume_name" <c:out value="${cri.searchType=='lend_costume_name'?'selected':''}"/>>코스튬</option>
				<option value="orders_paytype" <c:out value="${cri.searchType=='orders_paytype'?'selected':''}"/>>결제방식</option>
				<option value="orders_day" <c:out value="${cri.searchType=='orders_day'?'selected':''}"/>>월별</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>
		</div>
		<table border=1>
			<tr>
				<th>주문번호</th>
				<th>계정</th>
				<th>이름</th>
				<th>패키지</th>
				<th>수량</th>
				<th>가격</th>
				<th>총합</th>
				<th>코스튬</th>
				<th>수량</th>
				<th>가격</th>
				<th>총합</th>
				<th>주문일</th>
				<th>결제방식</th>
				<th>포인트</th>
				<th>전체총합</th>
			</tr>
			<c:forEach items="${ordersList}" var="vo">
			<tr>
				<td>${vo.orders_no}</td>
				<td>${vo.orders_id}</td>
				<td>${vo.users_name}</td>
				<td>${vo.photo_package_title}</td>
				<td>${vo.photo_package_amount}</td>
				<td>${vo.photo_package_price}</td>
				<td>${vo.package_total}</td>
				<td>${vo.lend_costume_name}</td>
				<td>${vo.lend_costume_amount}</td>
				<td>${vo.lend_costume_price}</td>
				<td>${vo.costume_total}</td>
				<td>${vo.orders_day}</td>
				<td>
					<c:if test="${vo.orders_paytype==0}">
						카카오 결제
					</c:if>
					<c:if test="${vo.orders_paytype==1}">
						현금 결제
					</c:if>
				</td>
				<td>${vo.discount}</td>
				<td>${vo.total}</td>
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
    		</div>
    		
	</div>
	
	<div id="costumeList">
		
	</div>
</body>
<script>


$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="chart?page="+page;
});
</script>
</html>