<%@page import="com.beans.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");

if (list == null || list.size() == 0) {
%>
<script>
	alert("해당 정보가 삭제되었거나 존재하지 않습니다.");
	history.back();
</script>
<%
	return;
}
%>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);
%>
<%
	UserDTO dto = list.get(0);
	String name = dto.getUser_name();
	String userid = dto.getUser_id();
	String email = dto.getUser_mail();
	String phone = dto.getUser_Num();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>관리자_회원목록</title>

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
    
    #paging{
    text-align: center;
    float: left;
    position: relative;
    
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
</header>


</head>
<body>
<%
admin = dto.getAdmin();
%>
<%--회원개인아이디title --%>
 <div class="title" style="text-align: center; margin-top:40px" >
    <h3 style="color: red; font-weight: 900; ">  <%=userid %> 님의 </h3>
    <h3 style="font-weight: 1000;">회원 정보</h3>
</div>
<br>
<%--회원정보 --%>
<div class="container">
	<div class="col-6;">
         <form name="frm"method="post" class="form-control"action="AdminUpdateUserOk.do" style="margin:auto; width:400px;">
         <%--아이디 --%>
         <input type="hidden" name="userid" value="<%=userid%>"/>
            <div>
               <label for="userId" class="form-label">아이디</label>
               <div type="text" name="userid" class="form-control" value="<%=userid%>">
               <%=userid%>
            </div>   
         <%--아이디끝 --%>
          <%--이름 --%>
          <input type="hidden" name="name" value="<%=name%>"/>
            <div>
               <label for="userId" class="form-label">이름</label>
               <div type="text" name="name" class="form-control" value="<%=name%>">
               <%=name%>
            </div> 
           <%-- 이름끝 --%>
            <div>
               <label for="email" class="form-label">이메일</label>
               <input type="text" name="email"class="form-control" value="<%=email%>" >
            </div>
            <div>
               <label for="phone" class="form-label">전화번호</label>
               <input type="text" name="phone" class="form-control" value="<%=phone%>" >
            </div>
            <div>
               <label for="admin" class="form-label">유저타입</label>
               
               <input type="text" name="admin" id="admin" class="form-control" value="<%=admin%>" >
               <div type="text" name="admin" id="admin_result" class="form-control" value="<%=admin%>" >
				</div>
            </div>
            <div class="d-grid">
            <%--onclick="location.href='AdminuserUpdate.do?id=<%=userid%>'" --%>
               <input type="submit" class="btn btn-primary btn-block my-3" value="수정완료"/>
            </div>
            <br>
            <!--제일 아래 버튼-->
            <div class="red-bt mx-auto">
                  <button type="reset" class="btn btn-danger float-right" style=" margin-left:50px;">다시입력</button>
                  <button type="button" class="btn btn-danger float-right"  onclick="location.href='AdminuserDelete.do?id=<%=userid %>'">삭제하기</button>
				  <button type="button" class="btn btn-danger float-right" onclick="histroy.back()">뒤로가기</button>
            </div>
            
          </form>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>document.getElementById('divnone').style.display = 'none';</script>
<script>document.getElementById('divnone2').style.display = 'none';</script>
<script type="text/javascript">
document.getElementById("admin").style.display ='none';	
var admin = document.getElementById("admin");
if(admin = 0){
	document.getElementById("admin_result").innerHTML="관리자";	
}else{
	document.getElementById("admin_result").innerHTML="일반회원";
}
</script>
</body>
</html>