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
	width: 80%;
	margin: auto;
	overflow: hidden;
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

.box {
	width: 30%;
	float: left;
	text-align: center;
	margin: 20px;
	font-size:30px;
}

.image img {
	whitd: 170px;
	height: 120px;
	margin: auto;
	margin-bottom: 5px;
}

.image{

	cursor: pointer;
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
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.lend_costume_image!=null && vo.lend_costume_image!=''}">
					<img class="image" src="/display?fileName=${vo.lend_costume_image}" onClick="location.href='costumeRead?id=${vo.lend_costume_code}'" width=300>
				</c:if>
				<c:if test="${vo.lend_costume_image==null || vo.lend_costume_image==''}">
					<img class="image" src="http://placehold.it/200x200">
				</c:if>
				<div>
					<a href="costumeRead?id=${vo.lend_costume_code}">${vo.lend_costume_code}</a>
				</div>
				<div>${vo.lend_costume_name}</div>
			</div>
		</c:forEach>
	</div>
      </div>
   <jsp:include page="chat.jsp" />
</body>
<script>

</script>
</html>