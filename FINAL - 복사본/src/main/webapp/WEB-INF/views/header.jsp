<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	*{font-family:'여기어때 잘난체 OTF'}
	body {background:black;}
	#logo {text-align:center;width:500px;margin:auto;} 
	#logoimg {margin-top:60px;cursor:pointer;}
	h2 {cursor:pointer;}
</style>
<div id="logo">
	<img id="logoimg" src="../display?fileName=gif7.gif" width=300>
	<h2>방 울 방 울</h2>
	<br>
</div>
<script>
	$("#logoimg,h2").on("click",function(){
		location.href="/index";
	})
</script>
