<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>네이버로그인</title>
</head>
<body>
   <%
      String clientId = "bkD4xjtArMlE7W11ZuTX";//애플리케이션 클라이언트 아이디값";
      String redirectURI = URLEncoder.encode("http://localhost:8088/index", "UTF-8");
      SecureRandom random = new SecureRandom();
      String state = new BigInteger(130, random).toString();
      String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
      apiURL += "&client_id=" + clientId;
      apiURL += "&redirect_uri=" + redirectURI;
      apiURL += "&state=" + state;
      session.setAttribute("state", state);
   %>
   <a href="<%=apiURL%>"><img height="50" src="../display?fileName=naver.png" /></a>
</body>
</html>