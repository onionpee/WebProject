<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);
out.print(admin);

%>
<html>
<head>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>Contact Us</title>
  <header>
    <div class="top-title">
      <a href="main.do" style="text-decoration: none;">
      <h1>
          <span>세</span><span>상</span><span>의</span><span>모</span><span>든</span><span>병</span><span>원</span>
      </h1>
      </a>
    </div>
  </header>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" aria-label="Tenth navbar example">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="notice.do">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="search.do">병원검색</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="contactUs.do">contact us</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">회원전용</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown08">
              <li><a class="dropdown-item" href="updateUser.do?userid=${id}">회원정보수정</a></li>
              <li><a class="dropdown-item" href="list.do">후기게시판</a></li>
              <li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
            </ul>
          </li>
          
<%

	 if(admin==0){%>
	 		<li class="nav-item dropdown">
				          	<a class="nav-link dropdown-toggle row justify-content-start" href="#" id="dropdown08" 
				          	data-bs-toggle="dropdown" aria-expanded="false">관리자전용</a>
				         	<ul class="dropdown-menu" aria-labelledby="dropdown08">
				          	<li><a class="dropdown-item" href="AdminHospitalList.do">병원목록조회</a></li>
				          	<li><a class="dropdown-item" href="memList.do">회원목록조회</a></li>
				        		<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
				         	</ul>
				       </li>
<%
	 }
 
%>
					
			</ul>
      </div>
    </div>
  </nav>
        
 
  <style>
 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
 h1 {
        font-family: 'Black Han Sans', sans-serif;
        text-align: center;
        margin-top: 10px;
        margin-bottom: 0px;
        font-size: 90px;
    }
    h1 span:nth-child(1) {
        color:#4285f4;
    }
    h1 span:nth-child(2) {
        color:#ea4335;
    }
    h1 span:nth-child(3) {
        color:#fbbc05;
    }
    h1 span:nth-child(4) {
        color:#4285f4;
    }
    h1 span:nth-child(5) {
        color:#34a853;
    }
    h1 span:nth-child(6) {
        color:#ea4335;
    }
    h1 span:nth-child(7) {
        color:#fbbc05;
    }
    .search-bar {
      width: 500px;
    }
    .board{
        margin: 50px;
    }
    .registerBt{
        margin: 50px;
    }
    .top-title{

        justify-content: space-between;
        align-items: center;
    }
    
    .board{
      font-family: 'Nanum Gothic', sans-serif;

    }
    .search-main-title{
      font-family: 'Black Han Sans', sans-serif;
        text-align: center;
    }

	#h2{
	font-family: 'Jeju Myeongjo', sans-serif;
        text-align: center;
        margin-top: 0px;
        margin-bottom: 0px;
        margin-left:20px;
        font-size: 20px;
        height:30px;
        background-color: #fbbc05;
        width:80%;
	}
	#h3{
		font-family: 'Nanum Gothic', sans-serif;
        text-align: center;
        margin-bottom: 20px;
        margin-top: 30px;
        margin-bottom: 20px;
        font-size: 18px;
	}


  </style>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBABVhi2DXYR4wJe-Wi3NzGaPO3egIuxLU&callback=initMap"></script>
   <script type="text/javascript">
   function initialize() {
	     
       var mapOptions = {
                           zoom: 18, // 지도를 띄웠을 때의 줌 크기
                           mapTypeId: google.maps.MapTypeId.ROADMAP
                       };
        
        
       var map = new google.maps.Map(document.getElementById("map"), // div의 id과 값이 같아야 함. "map-canvas"
                                   mapOptions);
        
       var size_x = 40; // 마커로 사용할 이미지의 가로 크기
       var size_y = 40; // 마커로 사용할 이미지의 세로 크기
    
       // 마커로 사용할 이미지 주소
       var image = new google.maps.MarkerImage( 'https://image.news1.kr/system/photos/2022/4/7/5306119/high.jpg/dims/optimize',
                                                   new google.maps.Size(100, 100),
                                                   new google.maps.Point(0, 0),

                                                   new google.maps.Point(6, 20),
                                                   new google.maps.Size(size_x, size_y));
        
       // Geocoding *****************************************************
       var address = '서울특별시 영등포구 영중로8길 6, 6층'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
       var marker = null;
       var geocoder = new google.maps.Geocoder();
       geocoder.geocode( { 'address': address}, function(results, status) {
           if (status == google.maps.GeocoderStatus.OK) {
               map.setCenter(results[0].geometry.location);
               marker = new google.maps.Marker({
                               map: map,
                               icon: image, // 마커로 사용할 이미지(변수)
                               title: '휴먼교육센터', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                               position: results[0].geometry.location
                           });

               var content = "와 곧 전역이당!";
            
               // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
               var infowindow = new google.maps.InfoWindow({ content: content});
               google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
           } else {
               alert("Geocode was not successful for the following reason: " + status);
           }
       });
       // Geocoding // *****************************************************
        
   }
   google.maps.event.addDomListener(window, 'load', initialize);
   </script>
</head>
<body onload="initMap();">
<br><br><br>
<!--메인화면내용-->
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
  
    <div class="container marketing">

      <!-- START THE FEATURETTES -->
      <hr class="featurette-divider">
  
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">Contact us <span class="text-muted">위치안내</span></h2>
          <p class="lead">서울특별시 영등포구 영중로8길 6, 6층</p>
        </div>
        <div class="col-md-5 order-md-1">
            <div id="map" style="height:300px;"></div>
  
        </div>
      </div>
  
      <hr class="featurette-divider">
  
      <!-- /END THE FEATURETTES -->
  
    </div><!-- /.container -->
  
  
    <!-- FOOTER -->
	<br>
<footer class="py-3 my-4">
  <ul class="nav justify-content-center border-bottom pb-3 mb-3">
    <li class="nav-item"><a href="main.do" class="nav-link px-2 text-muted">Home</a></li>
    <li class="nav-item"><a href="notice.do" class="nav-link px-2 text-muted">Notice</a></li>
    <li class="nav-item"><a href="list.do" class="nav-link px-2 text-muted">Review</a></li>
    <li class="nav-item"><a href="updateUser.do?userid=${id}" class="nav-link px-2 text-muted">MyPage</a></li>
    <li class="nav-item"><a href="logout.do" class="nav-link px-2 text-muted">LogOut</a></li>
  </ul>
  <p class="text-center text-muted">© 2022 Company, Inc</p>
</footer>


  </main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <!--지도 스크립트-->

</body>
</html>