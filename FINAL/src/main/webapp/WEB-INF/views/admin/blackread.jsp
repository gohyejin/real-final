<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 정보보기</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>회원정보</h1>
	<form id="frm" action="/admin/blackUpdate" method="post">
	<input type="hidden" value="${vo.users_id}" name="users_id">
	<input type="hidden" name="page" value="${param.page}">
	<table border=1 id="tbl">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>우편번호</th>
			<th>상세주소</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>포인트</th>
			<th>성별</th>
			<th>가입일</th>
			<th>권한</th>
		</tr>
		<c:forEach items="vo">
		<tr class="row">
			<td>${vo.users_id}</td>
			<td>${vo.users_name}</td>
			<td><fmt:formatDate value="${vo.users_birthday}" pattern="yyyy년MM월dd일"/></td>
			<td>${vo.users_zipcode}</td>
			<td>${vo.users_address}</td>
			<td>${vo.users_phone}</td>
			<td>${vo.users_email}</td>
			<td><fmt:formatNumber value="${vo.users_point}" pattern="#,### Point"/></td>
			<td>${vo.users_gender}</td>
			<td><fmt:formatDate value="${vo.users_regdate}" pattern="yyyy년MM월dd일"/></td>
			<td>
				<select name="users_note">
					<option value="0" <c:out value="${vo.users_note=='0'?'selected':''}"/>>회원</option>
					<option value="2" <c:out value="${vo.users_note=='2'?'selected':''}"/>>탈퇴</option>
					<option value="3" <c:out value="${vo.users_note=='3'?'selected':''}"/>>블랙리스트</option>
				</select>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	<input type="button" value="목록" id="btnList">
	
	</form>
</body>
<script>
	
	
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	})
	
	$("#btnList").on("click", function(){
		var page=$(frm.page).val();
		location.href="/admin/blacklist?page="+page;
	});
</script>
</html>