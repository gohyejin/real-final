<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>네이버로그인</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
   <%
      String clientId = "bkD4xjtArMlE7W11ZuTX";//애플리케이션 클라이언트 아이디값";
      String clientSecret = "pLuqjp_X8r";//애플리케이션 클라이언트 시크릿값";
      String code = request.getParameter("code");
      String state = request.getParameter("state");
      String redirectURI = URLEncoder.encode("http://localhost:8088/index", "UTF-8");
      String apiURL;
      apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
      apiURL += "client_id=" + clientId;
      apiURL += "&client_secret=" + clientSecret;
      apiURL += "&redirect_uri=" + redirectURI;
      apiURL += "&code=" + code;
      apiURL += "&state=" + state;
      String access_token = "";
      String refresh_token = "";
      System.out.println("apiURL=" + apiURL);
      try {
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection) url.openConnection();
         con.setRequestMethod("GET");
         int responseCode = con.getResponseCode();
         BufferedReader br;
         System.out.print("responseCode=" + responseCode);
         if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else { // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         String inputLine;
         StringBuffer res = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
            res.append(inputLine);
         }
         br.close();
         if (responseCode == 200) {
            out.println(res.toString());
         }
      } catch (Exception e) {
         System.out.println(e);
      }
   %>
</body>
</html>