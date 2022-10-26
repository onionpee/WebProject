<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>세상의 모든 병원이 여기에</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary" aria-label="Tenth navbar example">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" 
        aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
    
    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav " style="color:white; font-size:xx-large; font-weight:1000;">
        <!--버튼-->
        <div class="top-button">
        <div class="nav-item justify-content-md-end d-md-flex">
            <button type="button" class="btn btn-light btn-outline-secondary float-right" 
                style="font-weight: 200; font-size: larger; margin-left:5px; background-color: white" aria-current="page" href="join.html">
            <a href="signup.do">회원가입</a> 
            </button>
        </div>

        <div class="offcanvas-button">
            <button type="button" class="btn btn-light btn-outline-secondary float-right text-dark" 
                style="font-size: larger; background-color:white;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" 
                aria-controls="offcanvasRight ;">로그인
            </button>
        </div>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" 
        style="float: right; width: 80%; height:1500px;"> <!-- 오프캔버스 사이즈 조절-->
            <div class="offcanvas-header">
              <h1 style="margin: 200px 10px 0px 220px;">
                <span>세</span><span>상</span><span>의</span><span>모</span><span>든</span><span>병</span><span>원</span>
              </h1>
            </div>
            
    <!--오프캔버스 내용-->
        <div class="offcanvas-body">
            <div class="container">
            <div class="col-6 mx-auto">
            <div>

             	<form action="loginOk.do" class="form-control" method="post" name="joinform" onsubmit="return check(this)">
                <div>
                <label for="userId" class="form-label" style="margin: 10px 0px 0px 50px;">아이디</label>
                <input type="text" name="userid" id="userId" class="form-control" style="width:80%; margin:10px 10px 10px 50px">
                </div>
                
                <div>
                <label for="password" class="form-label" style="margin: 10px 0px 0px 50px;">비밀번호</label>
                <input type="password" name="userpw" id="password" class="form-control" style="width:80%; margin:10px 10px 10px 50px">
                </div>
                
                <div>
                <button class="btn btn-primary btn-block my-3" style="width: 30%; margin: 10px 10px 10px 80px;">로그인</button>
                <button type="reset" class="btn btn-danger" style="width: 30%;">다시입력</button>
                </div>  
              </form>
            </div>
            </div>
            </div>
        </div>
            
        </div>
        </div>
        </ul>
    </div>

    </div>
    </nav>
</body>

<style>
    h1 {
      font-family: 'Black Han Sans', sans-serif;
        text-align: center;
        margin-top: 180px;
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
    .top-button{
      font-size: large;
      float: right;
    }
    .nav-item{
        font-size: large;
      float: right;
    }
    ul{
      display: flex;
    }
    .offcanvas-button{
      font-family: 'Do Hyeon', sans-serif;
      float: right;
      font-weight: 100;
    }
    .welcome{
      font-family: 'Black Han Sans', sans-serif;
      font-weight: 300;
    }
    .nav-item{
      font-family: 'Do Hyeon', sans-serif;
    }
    a{
      text-decoration-line: none;
      color: black;
    }
    .form-control{
      font-family: 'Do Hyeon', sans-serif;
      font-size: 130%;
    }
</style>

<div>
  <!--구역나누기-->

  <div>
    <!--사이트이름-->
    <div class="index-name">
      <h1>
        <span>세</span><span>상</span><span>의</span><span>모</span><span>든</span><span>병</span><span>원</span>
      </h1>
    </div>

    <div style="margin: 50px 50px 10px 50px" id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">

    <div class="site-discription">
      <div class="col" style="margin-left: 15%; ; width: 70%;">
          <div class="carousel-inner">
            <div class="carousel-item active">
                <img style="height: 450px;"
                src="https://www.bonebest.co.kr/images/hospital-inside-mobile/waiting-room/waiting-room1.jpg" class="d-block w-100" alt="hs1">
            </div>
            <div class="carousel-item">
                <img style="height: 450px;"
                src="https://img.freepik.com/premium-photo/long-hospital-corridor-with-empty-seats_117023-1679.jpg?w=2000" class="d-block w-100" alt="hs2">
            </div>
            <div class="carousel-item">
                <img style="height: 450px;"
                src="https://freight.cargo.site/t/original/i/fa6dbd0830661739dee7be56c4bdd5f1113eb4032ce48cfdd3c04fd34478598f/_-2.jpg" class="d-block w-100" alt="hs3">
            </div>
          </div>
      </div>
    </div>
    </div>
  </div>
</div>


<!-- 병원 설명 -->
	<div class="card-body" style="text-align:center;">
   	 <br>
     <b>본 페이지는 회원가입 후 이용하실 수 있습니다.</b>
     <br><br>본 사이트는 2022년 9월 기준으로 서울 지역 25개 구의 병원 중<br>내과/외과/정형외과/안과/피부과/치과에 대한 정보를 제공합니다.</p>
   <div class="d-flex justify-content-between align-items-center"></div>
	</div>
	<div class="input-group-append"></div>

	<footer class="py-3 my-4">
      <p class="text-center text-muted">© 2022 Company, Inc</p>
    </footer>
    
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<!-- 값이 없을때 뜨는 경고창 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    

<script lang="JavaScript">
	function check() {
		if (!document.joinform.userid.value) {
			alert("아이디를 입력하세요!");
			return false;
		}
		if (!document.joinform.userpw.value) {
			alert("Password를 입력하세요!");
			return false
		}
	}
</script>
<script>
document.getElementById('admin').style.display = 'none';
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>

