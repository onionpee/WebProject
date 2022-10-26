<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String id = (String)session.getAttribute("id");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);


%>



<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<title>회원정보수정 페이지</title>


<style>

h5 {
   font-family: 'Nanum Gothic', sans-serif;
   text-align: center;
   margin-top: 10px;
   margin-bottom: 0px;
   font-size: 20px;


}

h1 {
   font-family: 'Black Han Sans', sans-serif;
   text-align: center;
   margin-top: 10px;
   margin-bottom: 0px;
   font-size: 90px;
}

h1 span:nth-child(1) {
   color: #4285f4;
}

h1 span:nth-child(2) {
   color: #ea4335;
}

h1 span:nth-child(3) {
   color: #fbbc05;
}

h1 span:nth-child(4) {
   color: #4285f4;
}

h1 span:nth-child(5) {
   color: #34a853;
}

h1 span:nth-child(6) {
   color: #ea4335;
}

h1 span:nth-child(7) {
   color: #fbbc05;
}

.search-bar {
   width: 500px;
}

.board {
   margin: 50px;
}

.registerBt {
   margin: 50px;
}

.top-title {
   justify-content: space-between;
   align-items: center;
}

.board {
   font-family: 'Nanum Gothic', sans-serif;
}
</style>
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
</head>
<body>


   <div class="title" style="text-align: center; margin-top: 40px">
      <h3 style="font-family: 'Nanum Gothic', sans-serif; font-weight: 1000;">회원정보수정</h3>
   </div>
   <!-- 회원정보 수정 양식 -->
   <div class="container" style="height:500px; margin-top: 50px">
      <div class="col-6;" style="background-color: #CCCCC; width:40%; margin-top:50px; margin-left:330px; height: 100%" >
         <div class="login" >

            <form class="form-control" action="updateUserOk.do" method="post" style="margin:auto; width:400px;">
            
            <div>
              <label for="userId" class="form-label">이름</label>
              <input type="text" placeholder="${dto.user_name}" class="form-control" disabled>
          </div>
             <div>
            <input type="text" name="name" value="${dto.user_name}" id="divnone">
         </div>
    
            <div>
               <label for="userId" class="form-label">아이디</label>
               <input type="text" placeholder="${dto.user_id}" class="form-control" disabled>
            </div>
         <div>
            <input type="text" name="userid" value="${dto.user_id}" id="divnone1">
         </div>
    
            <div>
               <label for="password" class="form-label">비밀번호</label>
               <input type="password" name="password" id="password" class="form-control">
            </div>
            <div>
               <label for="password" class="form-label">비밀번호확인</label>
               <input type="password" name="ch_password" id="password" class="form-control">
            </div>
            <div>
               <label for="email" class="form-label">이메일</label>
               <input type="text" name="email" value="${dto.user_mail}" class="form-control">
            </div>
            <div>
               <label for="phone" class="form-label">전화번호</label>
               <input type="text" name="phone" value="${dto.user_Num}" class="form-control">
            </div>
            <br>
            
            <%-- 회원수정버튼 --%>
            <div style="margin-left: 70px; margin-bottom:10px">
				  
				  <button type="submit" class="btn btn-primary" onclick="alert('정보 수정이 완료되었습니다!')">완료</button>
				  <button type="reset" class="btn btn-warning">다시입력</button>
				  <button type="button" class="btn btn-danger" onclick="chkDelete()">회원탈퇴</button>
			</div>

<%-- 

       <div>
               <button type ="submit" class="btn btn-primary btn-block my-3" style=" margin-left:90px;" onclick="alert('정보 수정이 완료되었습니다!')">완료</button>
              <button type="reset" class="btn btn-danger float-right" style=" margin-left:25px;">다시입력</button>
              <button type="button" class="btn btn-danger float-right" style=" margin-left:25px;"  onclick="chkDelete()">회원 탈퇴</button>
        </div>
        
   --%>

       </form>

         </div>
      </div>
   </div>

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
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>
      <script>
      document.getElementById('divnone').style.display = 'none';
      document.getElementById('divnone1').style.display = 'none';
      </script>
      <script>
function chkDelete() {
let r = confirm("정말로 회원탈퇴를 진행하시겠습니까?");
if(r) {

   location.href = "deleteUser.do";
}
}
</script>
      
</body>
</html>