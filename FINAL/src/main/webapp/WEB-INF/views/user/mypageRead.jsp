<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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

.btnShow button,.btnShowchk button,#btnCode{
	height: 55px;
	width:90px;
}

input[type=button]{
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

input[type=submit]{
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

input[type=reset]{
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
	<jsp:include page="../menu.jsp" />
	<div id="page">
		<jsp:include page="../header.jsp" />
		<div class="title">⊙ MY PAGE ⊙</div>
		<br><br>
		<div id="content">
			<br>
			<form name="frm" action="/user/update">
				<div class="btn">
					<input type="text" size=60 placeholder="　　ID" maxlength="20" />
				</div>
				<br>
				<div class="btn">
					<input type="password" size=48 placeholder="　　PASSWORD" maxlength="20" class="pass" /> 
					<span class="btnShow"><button>SHOW</button></span>
				</div>
				<br>
				<div class="btn">
					<input type="password" size=48 placeholder="　　PASSWORD CHECK"maxlength="20" class="passchk" /> 
					<span class="btnShowchk"><button>SHOW</button></span>
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　NAME" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　BIRTHDAY" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=48 placeholder="　　ADDRESSS" /> 
					<span><button id="btnCode">ZIP CODE</button></span>
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　PHONE NUMBER" />
				</div>
				<br>
				<div class="btn">
					<input type="text" size=60 placeholder="　　E-MAIL" />
				</div>
				<br>
				<div class="btn">
					<input type="submit" value="UPDATE" /> 
					<input type="reset" value="CANCEL" /><br>
					<input type="button" value="PREVIOUS PAGE" id="previousPage"/>
				</div>
				<br>
			</form>
		</div>
	</div>
	<jsp:include page="../chat.jsp" />

</body>
<script>
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