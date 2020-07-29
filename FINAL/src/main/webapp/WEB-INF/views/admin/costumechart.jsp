<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>패키지별 차트</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    
</head>
<body>
	<h1>코스튬 차트</h1>
		<a href="/admin/chart">전체 결제</a>
		<a href="/admin/packagechart">패키지차트</a>
		<select id="selMonth" style="height:25px;">
			<option value="">선택하세요</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<button id="btnMonth">보기</button>
		<div id="chart_div" style="width:600px; height:500px;"></div>
		<div id="chart_div2" style="width:600px; height:500px;"></div>
</body>
<script type="text/javascript">
var varTitle;

$("#btnMonth").click(function(){
	var month=$("#selMonth option:checked").val();
	varTitle=$("#selChart option:checked").text();
	changeChart();
});

changeChart();

function changeChart(){
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
    function drawVisualization() { 
    	
    	var month=$("#selMonth option:checked").val();
    	
        $.ajax({
            type:"get",
            url:"/costumechartt",
            data:{"month":month},
            dataType:"json",
    		
            success:function(result){
              //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                /* 데이터 셋팅 */
                var data = google.visualization.arrayToDataTable(result);

                /* 옵션 셋팅 */
                var options = {
                	title : varTitle,
                    seriesType: 'bars',
                    
                };

                /* 차트 그리기 */
                var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart.draw(data, options);
                
            }
        });
        $.ajax({
            type:"get",
            url:"/costumechartt2",
            dataType:"json",
            data:{"month":month},
            success:function(result){
              //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                /* 데이터 셋팅 */
                var data = google.visualization.arrayToDataTable(result);

                /* 옵션 셋팅 */
                var options = {
                	title : varTitle,
                    seriesType: 'line'
             		
                };

                /* 차트 그리기 */
                var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
                chart.draw(data, options);
                
            }
        });
    }
}

</script>
</html>