<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {font-family:'@여기어때 잘난체'}

#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: hidden;
}

#content {
	margin-top:none;
	margin-left:70px;
	margin-right:70px;
	padding: 30px margin-top: 10px;
	text-align: center;
}

#content {
 	width:50%;
	margin:auto;
	overflow: hidden;
	border-collapse:collapse;
}

td{
	padding:15px;
}

.title{
	font-size:50px;
	text-align:center;
	margin:auto;
}

.tbl1Title{
	font-size:40px;
}

input[type=text],input[type=password] {
	height: 50px;
}

.btnShow input[type=button],.btnShowchk input[type=button],#btnCode{
	height: 55px;
	width:90px;
}

#previousPage{
	width:510px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	margin-top: 10px;
	cursor: pointer;
	background: #e6bbea;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}

#btnUpdate{
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

#btnCancel{
	width:250px;
	height: 60px;
	font-size: 30px;
	margin: 2px;
	cursor: pointer;
	background: #969596;
	color: white;
	border:none;
	border-radius:3px 3px 3px 3px;
}
</style>
</head>
<body>
	<jsp:include page="../index_include/menu.jsp" />
	<div id="page">
		<jsp:include page="../index_include/header.jsp" />
		<div class="title">⊙ MY PAGE ⊙</div>
		<br><br>
		<div id="content">
			<br>
			<form name="frm" action="/user/update" method="post">
				<div class="btn">
					<input type="text" size=60 placeholder="　　ID" value="${users_id}" maxlength="20" name="users_id" id="users_id" readonly />
				</div>
				<br>
				<div class="btn">
					<input type="password" size=48 placeholder="　　PASSWORD" value="${vo.users_pass}" maxlength="20" name="users_pass" class="pass" /> 
					<span class="btnShow"><input type="button" value="SHOW"></span>
				</div>
				<br>
				<div class="btn">
					<input type="password" size=48 placeholder="　　PASSWORD CHECK" maxlength="20" class="passchk" /> 
					<span class="btnShowchk"><input type="button" value="SHOW"></span>
				</div>
				<div>
	            	<br><span id="users_passCHK">비밀번호 확인</span>
         		</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　NAME" value="${vo.users_name}" name="users_name" id="users_name" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　BIRTHDAY" value="${vo.users_birthday}" name="users_birthday" id="users_birthday" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=48 placeholder="　　ADDRESSS" value="${vo.users_zipcode}" name="users_zipcode" id="users_zipcode" readonly /> 
					<span><input type="button" value="ZIP CODE" id="btnCode"></span>
				</div>
				<br>
				<div class="btn">
				<input type="text" size=60 placeholder="　　ADDRESS" value="${vo.users_address}" name="users_address" id="users_address" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　PHONE NUMBER" value="${vo.users_phone}" name="users_phone" id="users_phone" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　E-MAIL" value="${vo.users_email}" name="users_email" id="users_email" readonly />
				</div>
				<br>
				<div class="btn">
					<input type="submit" value="UPDATE" id="btnUpdate"/> 
					<input type="reset" value="CANCEL" id="btnCancel"/><br>
					<input type="button" value="PREVIOUS PAGE" id="previousPage"/>
				</div>
				<br>
			</form>
		</div>
	</div>
	<jsp:include page="../index_include/chat.jsp" />

</body>
<script>
	passChk();
	
	// 우편번호
	   $("#btnCode").on("click", function(){
		   openAddress();
	   });
	
	// 우편번호
   	function openAddress() {
	      new daum.Postcode({
	         oncomplete:function(data) {
	            $("#users_zipcode").val(data.zonecode);
	            $("#users_address").val(data.address);
	            $("#users_address").focus();
	            }
	      }).open();
	   }
	
	// 수정버튼 클릭시
	$(frm).submit(function(e){
		e.preventDefault();
		var users_pass=$(".pass").val();
		var users_passchk=$(".passchk").val();
		var users_name=$("#users_name").val();
		var users_birthday=$("#users_birthday").val();
		var users_zipcode=$("#users_zipcode").val();
		var users_address=$("#users_address").val();
		var users_phone=$("#users_phone").val();
		var users_email=$("#users_email").val();
		
		if(users_pass=="" || users_passchk=="" || users_name=="" || users_birthday=="" || users_zipcode=="" || users_address=="" || users_phone=="" || users_email==""){
			alert("회원정보를 모두 입력해주세요.");
		}else{
			if(!confirm("회원정보를 수정하시겠습니까?")) return;
			frm.submit();
			alert("수정되었습니다.");	
		}
	});
	
	// 비밀번호 확인
	function passChk(){
      $(".pass, .passchk").change(function(){
         var users_pass=$(".pass").val();
         var users_passChk=$(".passchk").val();
         
         if(users_pass==users_passChk){
            $("#users_passCHK").html("비밀번호가 일치합니다.");
         }else if(users_pass!=users_passChk){
            $("#users_passCHK").html("비밀번호가 일치하지 않습니다.");
         }
         
         if(users_pass=="" || users_passChk==""){
            $("#users_passCHK").html("");
         }
      });
   }

	$("#previousPage").on("click", function(){
		location.href="/user/mypage";
	})

	//mouseOver   
	$(".btnShow").mouseover(function(){
	   $(".btn .pass").prop("type", "text");
	});
	$(".btnShow").mouseout(function(){
	   $(".btn .pass").prop("type", "password");
	});
	
	//mouseOver   
	$(".btnShowchk").mouseover(function(){
	   $(".btn .passchk").prop("type", "text");
	});
	$(".btnShowchk").mouseout(function(){
	   $(".btn .passchk").prop("type", "password");
	});
</script>
</html>