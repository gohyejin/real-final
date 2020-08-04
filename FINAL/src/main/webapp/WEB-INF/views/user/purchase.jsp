<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>구매</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.img {
	width: 100px;
}

#divFinal {
	text-align: center;
	width: 1250px;
	margin: auto;
	height: 300px;
	padding-left: 12%;
}

#divSum, #divShipping, #divPoint, #divtotalSum {
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

#btnKakao {
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
	<div>구매자정보</div>
	<table border=1>
		<tr>
			<td>이름</td>
			<td>생년월일</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>핸드폰번호</td>
			<td>이메일주소</td>
			<td>포인트</td>
			<td>성별</td>
		</tr>
		<tr>
			<td>${vo.users_name}</td>
			<td>${vo.users_birthday}</td>
			<td>${vo.users_zipcode}</td>
			<td>${vo.users_address}</td>
			<td>${vo.users_phone}</td>
			<td>${vo.users_email}</td>
			<td>${vo.users_point}</td>
			<td>${vo.users_gender}</td>
		</tr>
	</table>
	<div>구매할내용</div>
	<table border=1 id="tbl1">
		<tr>
			<td>패키지번호</td>
			<td>제목</td>
			<td>이미지</td>
			<td>수량</td>
			<td>개당가격</td>
			<td>총가격</td>
		</tr>
		<c:forEach items="${plist}" var="vo">
			<tr class="row">
				<td class="no">${vo.package_cart_no}</td>
				<td>${vo.photo_package_code}</td>
				<td>${vo.photo_package_title}</td>
				<td><img class="img" src="/display?fileName=${vo.photo_package_image}" onClick="location.href='/costumeRead?id=${vo.photo_package_code}'"></td>
				<td>${vo.package_cart_quantity}개</td>
				<td>${vo.package_cart_price}원</td>
				<td>${vo.package_cart_price*vo.package_cart_quantity}원</td>
			</tr>
		</c:forEach>
	</table>
	<table border=1 id="tbl2">
		<tr>
			<td>코스튬번호</td>
			<td>제목</td>
			<td>이미지</td>
			<td>수량</td>
			<td>개당가격</td>
			<td>총가격</td>
		</tr>
		<c:forEach items="${clist}" var="v">
			<tr class="row">
				<td class="no">${v.costume_cart_no}</td>
				<td>${v.lend_costume_code}</td>
				<td>${v.lend_costume_name}</td>
				<td><img class="img" src="/display?fileName=${v.lend_costume_image}" onClick="location.href='costumeRead?id=${v.lend_costume_code}'"></td>
				<td>${v.costume_cart_quantity}개</td>
				<td>${v.costume_cart_price}원</td>
				<td>${v.costume_cart_price*v.costume_cart_quantity}원</td>
			</tr>
		</c:forEach>
	</table>
	<div id="divFinal">
			<div id="divSum">
				<div>
					<h2>PACKAGE</h2>
					<input type="text" id="packageSum" value="${psum}" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>+</div>
			</div>
			<div id="divShipping">
				<div>
					<h2>COSTUME</h2>
					<input type="text" id="costumeSum" value="${csum}" readonly> 원
				</div>
			</div>
			<div class="divOper">
				<div>-</div>
			</div>
			<form>
			<div id="divPoint">
				<div>
					<h2>Point</h2>
					내 포인트:<span id="myPoint">${point}</span><br>
					<input type="text" id="point" value="0" > 원<br>
					<input type="button" value="사용하기" id="btn">
					<input type="reset" value="초기화" id="reset">
				</div>
			</div>
			<div class="divOper">
				<div>=</div>
			</div>
			<div id="divtotalSum">
				<div>
					<h2>TOTAL</h2>
					<input type="text" id="totalSum" value="${psum+csum}" readonly> 원 <br>
				</div>
			</div>
			</form>
	</div>
	<div class="OrderArea">
		<button id="btnKakao">카카오페이</button>
	</div>
</body>
<script>
	$("#tbl1 .no").hide();
	$("#tbl2 .no").hide();
	var point="0";
	
	$("#btn").on("click", function(){
		var totalSum=parseInt($("#totalSum").val());
		var myPoint=parseInt($("#myPoint").html());
		point=parseInt($("#point").val());
		
		if(point<=myPoint) {
			$("#totalSum").val(totalSum-point);
			$("#btn").attr('disabled', true);
		} else if(point>myPoint){
			alert("보유한 포인트를 초과합니다.");
			$("#point").val("");
			$("#point").focus();
			return;
		}
	});
	   
	$("#reset").on("click", function(){
		$("#btn").attr('disabled', false);
		$("#point").val("");
		$("#point").focus();
		point="0";
	});
	
	/*카카오페이*/
	$("#btnKakao").on("click", function() {
		var totalSum = $("#totalSum").val();
		var IMP = window.IMP;
		
		IMP.init("imp56975225");
		IMP.request_pay({
			pg : "kakaopay",
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "패키지+코스튬",
			amount : totalSum,
			buyer_email : 'iamport@siot.do',
			buyer_name : "홍길동",
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var packageNO = new Array();
				var costumeNO = new Array();
				var users_id = "${users_id}";
				var orders_paytype="0";
				
				$("#tbl1 .row .no").each(function() {
					var package_cart_no=$(this).parent().find(".no").html();
					packageNO.push(package_cart_no);
				});
				
				$("#tbl2 .row .no").each(function() {
					var costume_cart_no=$(this).parent().find(".no").html();
					costumeNO.push(costume_cart_no);
				});
				
				$.ajax({
					type : "post",
					url : "/order/insert",
					data : {"packageNO[]":packageNO, "costumeNO[]":costumeNO, "orders_paytype":orders_paytype, "orders_id":users_id, "point":point},
					success : function() {
						location.href="/user/mypage?users_id="+users_id;
					}
				});
				var msg = '결제가 완료되었습니다.';
			} else {
				var msg = '결제가 취소되었습니다.';
			}
			alert(msg);
		});
	});
</script>
</html>