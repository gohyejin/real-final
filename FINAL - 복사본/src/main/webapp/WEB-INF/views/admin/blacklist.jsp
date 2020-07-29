<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	
	<h1>블랙리스트목록</h1>
	블랙리스트수 : <span id="total">${pm.totalCount}</span>
	<div>
		<form name="frm" action="/admin/blacklist">
			<select name="searchType">
				<option value="users_id" <c:out value="${cri.searchType=='users_id'?'selected':''}"/>>회원아이디</option>
				<option value="users_name" <c:out value="${cri.searchType=='users_name'?'selected':''}"/>>회원이름</option>
				<option value="users_point" <c:out value="${cri.searchType=='users_point'?'selected':''}"/>>회원포인트</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	<table border=1 id="tbl">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>포인트</th>
			<th>권한</th>
		</tr>
		<c:forEach items="${blacklist}" var="vo">
			<tr class="row">
				<td class="users_id">${vo.users_id}</td>
				<td>${vo.users_name}</td>
				<td><fmt:formatDate value="${vo.users_birthday}" pattern="yyyy년MM월dd일"/></td>
				<td>${vo.users_phone}</td>
				<td>${vo.users_email}</td>
				<td><fmt:formatNumber value="${vo.users_point}" pattern="#,### Point"/></td>
				<td>
					<c:if test="${vo.users_note==0}">
						회원
					</c:if>
					<c:if test="${vo.users_note==2}">
						탈퇴
					</c:if>
					<c:if test="${vo.users_note==3}">
						블랙리스트
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="page2" value="${pm.cri.page}">
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
    		
</body>
<script>
	
	
	
	$("#tbl").on("click", ".row", function(){
		var users_id=$(this).find(".users_id").html();
		var page=$("#page2").val();
		location.href="/admin/blackread?users_id="+users_id+"&page="+page;
	});
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="blacklist?page="+page;
	});
</script>
</html>