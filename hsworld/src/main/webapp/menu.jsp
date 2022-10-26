<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드</title>
<link href="../../css/button.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--영역 나누기-->
   <div class="view" style=" width: 100vw; height: 100vh; background-color: yellow;">
   <!--영역 안에서 세로로 나누기-->    
      <!--1(왼쪽)-->
      <div class="left" style="float: left; width: 30%; height: 100vh; background-color:whitesmoke;border-right: 5px double #DCDCDC;">
   

              <!-- 부트스트랩 활용 include -->
                  <hr>

        
            <!-- 가이드 리스트 -->

            <div style="float: left; width: 100%; height: 700px;margin: 20px; text-align: center;"><br><br>
                  <input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="1" onclick="test(1)">강원도 <br><br><br>
                  <input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="2" onclick="test(2)">경상도<br><br><br>
                  <input class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="3" onclick="test(3)">수도권<br><br><br>
                  <button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="4" onclick="location(4)">전라도</button> <br><br><br>
                  <button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="5" onclick="location(5)">제주도</button> <br><br><br>
                  <button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" value="6" onclick="location(6)">충청도</button> <br><br><br>
                  

            </div>

            

        </div>

        
        <!--2(오른쪽)--> 
        <div class="right" style="float: right; width: 70%; height: 100vh; background-color: whitesmoke;">
        <% double test1 = 37.5181236;
   double test2 = 126.8999252;
%>
<!-- 공유하기 -->
<div style="width:100%;height:100%; float: right; position: relative;">
    <div style="cursor:pointer; float: right; padding:5px; height:5%; width:70px; position:absolute; z-index:100; right: 2%;">
         <input type="button" value="공유하기" onclick="alert('로그인해주세요')">      
    </div>
<!-- 나중에 자바스크립트활용하여 구현 -->
      <!-- 지도영역부분 -->
   <div id="map" style="width:100%; height:100%; float:left; position:absolute; z-index:10;">
   </div>
   <!-- 버튼 -->
</div>
          </div>

    </div>
 
</body>
     <script type="text/javascript" 
     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7d3428f35bb9a9deb43f36f2716406"></script>
     <script>
	 var je = "36.62723585";
	 var je2 = "127.4987411";
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
     mapOption = { 
         center: new kakao.maps.LatLng(je, je2), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     };
     var map = new kakao.maps.Map(mapContainer, mapOption); 
     console.log(je, je2);
     function test(n) {

    	 
    	 switch(n) {
    	 case 1:
    		 je = "37.5181236";
    		 je2 = "126.8999252";
    		 break;
    	 case 2:
    		 je = "35.1816394";
    		 je2 = "129.1633844";
    		 break;
    	 }
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = { 
             center: new kakao.maps.LatLng(je, je2), // 지도의 중심좌표
             level: 5 // 지도의 확대 레벨
         };
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         console.log(je, je2);
     }

     console.log(je, je2);



     // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다

     </script>
</html>