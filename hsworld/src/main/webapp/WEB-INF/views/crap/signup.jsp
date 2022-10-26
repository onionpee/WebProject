<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String ip = request.getRemoteAddr();
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet"
 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>
  <header>
  <div class="top-title">
    <a href="index.do" style="text-decoration: none;">
    <h1>
        <span>세</span><span>상</span><span>의</span><span>모</span><span>든</span><span>병</span><span>원</span>
    </h1>
    </a>
  </div>
</header> 
 	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="height:50px" aria-label="Tenth navbar example">
	</nav>
	<div class="title" style="text-align: center; margin-top:40px" >
    	<h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000; margin:10px 10px 30px 10px">회원가입</h3>
	</div>


<!-- 회원가입 양식 -->
<div style="height:600px">
<form action="signOk.do" method="post" name="joinform" onsubmit="return check(this)" style="margin:auto; width:400px;">	 
	<div>
	    <label for="userId" class="form-label">아이디</label>  	    
	    <input type = "button" class="btn btn-outline-primary btn-sm" style="margin-left: 270px;margin-bottom: 10px" id="dbCheckId" value="중복확인" onclick="fn_dbCheckId()" style="float:right; background-color: white;" class="checkId">
	    <input type="text" name="userid" class="form-control" id="exampleInputPassword1" onkeydown="inputIdChk()">
		<input type="hidden" name="idDuplication" value="idUncheck"/>
	</div>
	<div>
	   <label for="userName" class="form-label">이름</label>
	   <input type="text" name="username" class="form-control" id="exampleInputPassword1">
	</div>
 	<div>
	   <label for="password" class="form-label">비밀번호</label>
	   <input type="password" name="userpw" class="form-control" id="exampleInputPassword1">
	</div>
	 <div>
	    <label for="password" class="form-label">비밀번호확인</label>
	    <input type="password" name="reuserpw" class="form-control" id="exampleInputPassword1">
	</div>
	<div>
	    <label for="email" class="form-label">이메일</label>
	    <input type="text" name="usermail" class="form-control" id="exampleInputPassword1">
	</div>
	 <div>
	    <label for="phone" class="form-label">전화번호</label>
	    <input type="text" name="userNum" class="form-control" id="exampleInputPassword1">
	 </div>
 

	    <input type="submit" value="회원가입" class="btn btn-primary btn-block my-3">
	
	
	 <!--제일 아래 버튼-->
	<div class="red-bt">
		<button type="reset" style="margin-left: 70px; width: 30%" class="btn btn-danger">다시입력</button>
	    <button class="btn btn-primary" style="width: 30%" onclick="javascript:history.back();">뒤로가기 !!!</button>
	</div>
  
</form>
</div>
<div>
	<footer class="py-3 my-4">
    	<p class="text-center text-muted">© 2022 Company, Inc</p>
	</footer>
</div>
</body>


<script lang="text/JavaScript">
function inputIdChk() {
	   var joinForm = document.joinform;
	   var dbCheckId = document.joinform.dbCheckId;
	   document.joinform.idDuplication.value="idUncheck";
	   dbCheckId.disabled=false;
	   dbCheckId.style.opacity=1;
	   dbCheckId.style.cursor="pointer";
	}

	function CheckEmail(str) {
	   var email =  /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	   if (!email.test(str)) {
	      return false;
	   } else {
	      return true;
	   }
	}

	function check() {
	   if(!document.joinform.userid.value) {
	      alert("아이디를 입력하세요.");
	      return false;
	   }
	   if(!document.joinform.username.value) {
	      alert("이름을 입력하세요.");
	      return false;
	   }
	   if(!document.joinform.userpw.value) {
	      alert("Password를 입력하세요.");
	      return false;
	   }
	   if(document.joinform.userpw.value != document.joinform.reuserpw.value) {
	      alert("password가 일치하지 않습니다.");
	      return false;
	   }
	   if(!document.joinform.usermail.value) {
	      alert("E-mail을 입력하세요.");
	      document.joinform.usermail.focus();
	      return false;
	   } else {
	      if(!CheckEmail(document.joinform.usermail.value)) {
	         alert("이메일 형식이 잘못되었습니다!");
	         document.joinform.usermail.focus();
	         return false;
	      }
	   }
	   if(!document.joinform.userNum.value) {
	      alert("전화번호를 입력하세요.");
	      return false;
	   }
	   if(document.joinform.idDuplication.value != "idCheck") {
	      alert("아이디 중복확인을 해주세요.");
	      return false;
	   }
	}
	function fn_dbCheckId() {
	   var joinForm = document.joinform;
	   var id = joinForm.userid.value;
	   if (id.length == 0 || id=="") {
	      alert("아이디를 입력해주세요");
	      joinForm.id.focus();
	   } else {
	      window.open("${contextPath}/hosworld/dbCheckId.do?user_id="+id,"","width=500, height=300");
	   }
	}



</script>

<style>
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



  </style>

</html>