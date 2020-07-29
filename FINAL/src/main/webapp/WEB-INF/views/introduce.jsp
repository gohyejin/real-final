<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>INTRODUCE</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	font-family: '@여기어때 잘난체'
}

#page {
	background: white;
	margin: 15px;
	padding-bottom:30px;
	height: hidden;
}

#content {
	margin-top: none;
	margin-left: 70px;
	margin-right: 70px;
	padding: 30px margin-top: 10px;
	text-align: center;
}

.title {
	font-size: 50px;
	text-align: center;
	margin: auto;
}

#map {
	width: 80%;
	height: 600px;
	margin: auto;
}

.text{
	text-align: center;
	margin-top:50px;
}
</style>
</head>
<body>
<jsp:include page="menu.jsp" />
   <div id="page">
		<jsp:include page="header.jsp" />
		<div class="title">⊙ INTRODUCE ⊙</div>
		<br> <br>
		<div id="map"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d06e7f6c04a5b6cff4d94cebfef1694"></script>
		<script>
			var mapContainer = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(37.438754, 126.675112),
				level : 2
			// 
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var markerPosition = new kakao.maps.LatLng(37.438754, 126.675112);

			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			marker.setMap(map);
		</script>
		<div class="text">
			인천 미추홀구 매소홀로 488번길 6-32 태승빌딩 5층<br><br>(지번) 학익동 663-1<br><br>032-876-3332
		</div>
	</div>
   <jsp:include page="chat.jsp" />
</body>
</html>