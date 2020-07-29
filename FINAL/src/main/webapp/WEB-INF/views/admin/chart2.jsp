<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	
	<h1>주문목록</h1>
	<div>
		<form name="frm" action="/admin/chart2">
			<select name="searchType">
				<option value="photo_package_title" <c:out value="${cri.searchType=='photo_package_title'?'selected':''}"/>>패키지별</option>
				<option value="lend_costume_name" <c:out value="${cri.searchType=='lend_costume_name'?'selected':''}"/>>코스튬별</option>
				<option value="orders_paytype" <c:out value="${cri.searchType=='orders_paytype'?'selected':''}"/>>결제방식</option>
				<option value="orders_day" <c:out value="${cri.searchType=='orders_day'?'selected':''}"/>>월별</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>
		</div>
	전체 결제수:<span id="count"></span>&nbsp;&nbsp;
	<table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template"> 
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
		{{#each ordersList}}
		<tr class="row">
			<td>{{orders_no}}</td>
			<td>{{orders_id}}</td>
			<td>{{users_name}}</td>
			<td>{{photo_package_title}}</td>
			<td>{{photo_package_amount}}</td>
			<td>{{photo_package_price}}</td>
			<td>{{package_total}}</td>
			<td>{{lend_costume_name}}</td>
			<td>{{lend_costume_amount}}</td>
			<td>{{lend_costume_price}}</td>
			<td>{{costume_total}}</td>
			<td >{{orders_day}}</td>
			<td class="orders_paytype">{{printStyle orders_paytype}}</td>
			<td>{{discount}}</td>
			<td>{{total}}</td>
		</tr>
		{{/each}}
	</script>
	<div id="pagination"></div>
</body>
<script>

var page=1;

var orders_paytype="${map.orders_paytype}";


Handlebars.registerHelper("printStyle",function(type){
	   var src;
	   if(orders_paytype == type) {
		   src="카카오 결제";
	   } else if(orders_paytype != type) {
		   src="현금결제";
	   }
	   return src;
	   
	});
	
getList();
function getList(){
	$.ajax({
		type:"get",
		url:"/chart.json",
		data:{"page":page},
		dataType:"json",
		success:function(data){
			var temp=Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
            $("#count").html(data.count);
            
            //결제방식 출력 변경
            if(data.orders_paytype == 0) {
            	$("#tbl .row .orders_paytype").val("카카오 결제");
            } else if(data.orders_paytype == 1) {
            	$("#tbl .row .orders_paytype").val("현금 결제");
            }
            
          	//페이지 리스트 출력
          	
            var str="";
            if(data.pm.prev){
                str += "<a href='" + (data.pm.startPage-1) + "'>◀</a>"
            }
            for(var i=data.pm.startPage; i<= data.pm.endPage; i++){
                if(data.pm.cri.page == i){
                    str += "[<a href='" + i + "' class='active'>" + i + "</a>]";
                }else{
                    str += "[<a href='" + i + "'>" + i + "</a>]";
                }
            }
            if(data.pm.next){
                str += "<a href='" + (data.pm.endPage+1)  +  "'>▶</a>"
            }
            $("#pagination").html(str);
             
		}

           
	});
	
}	

    //페이지 번호를 클릭했을 경우
    $("#pagination").on("click", "a", function(event){
        event.preventDefault();
        page = $(this).attr("href");
        getList();
    });
    
    
</script>
</html>