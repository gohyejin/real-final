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

select option {
	height: 25px;
	font-size: 20px;
	text-align-last: center;
}

select {
	width: 100%;
	height: 25px;
	font-size: 20px;
	border: none;
	text-align-last: center;
}

.cart {
	width: 200px;
	height: 60px;
	font-size: 30px;
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

.active {
	color: red;
}

a {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ COSTUME ⊙</div>
		<br> <br>
		<div id="content">
			<input type="hidden" value="${cri.page}"> [게시글 수: <span>${pm.totalCount}</span>건]
			<form name="frm" action="costumeList">
				<select name="searchType">
				<option value="lend_costume_code"
						<c:out value="${cri.searchType=='lend_costume_code'?'selected':''}"/>>코스튬코드</option>
					<option value="lend_costume_name"
						<c:out value="${cri.searchType=='lend_costume_name'?'selected':''}"/>>코스튬명</option>
				</select> 
				<input type="text" name="keyword" value="${cri.keyword}"> 
				<input type="submit" value="코스튬검색">
			</form>
			<c:forEach items="${list}" var="vo">
				<div class="box">
					<c:if
						test="${vo.lend_costume_image!=null && vo.lend_costume_image!=''}">
						<img id="image" src="/display?fileName=${vo.lend_costume_image}"
							onClick="location.href='costumeRead?lend_costume_code=${vo.lend_costume_code}'"
							width=100 height=130>
					</c:if>
					<c:if
						test="${vo.lend_costume_image==null || vo.lend_costume_image==''}">
						<img id="image" src="http://placehold.it/100x80">
					</c:if>
					<div>
						<a href="costumeRead?lend_costume_code=${vo.lend_costume_code}">${vo.lend_costume_code}</a>
					</div>
					<div>${vo.lend_costume_name}</div>
					<div>${vo.lend_costume_price}</div>
				</div>
			</c:forEach>
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
	</div>
	<jsp:include page="chat.jsp" />
</body>
<script>
	//페이지를 클릭했을 때
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "costumeList?page=" + page;
	});
</script>
</html>