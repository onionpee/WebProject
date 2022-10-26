<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  
<style type="text/css">
	body {
	text-align: center;
	}
	#paging {
	font-size: 22pt;
	}
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
</head>
<body>
<div id="paging">
	<div class="container row justify-content-center">

			<div class="col">
				<nav>
					<ul class="pagination">
							<c:url var="action" value="searchOk.do"/>
								<c:if test="${param.prev}">
									<li class="page-item active">
									<a href="${action}?page=${param.beginPage-1}">prev</a>
									</li>
								</c:if>
							<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
					        <c:choose>
					            <c:when test="${param.page==index}">
					            	<li class="page-item active"><a href="${action}?page=${index}" class="page-link">${index}</a></li>
					            </c:when>
					            <c:otherwise>
					            	<li class ="page-item">
					                <a href="${action}?page=${index}" class="page-link">${index}</a>
					                </li>
					            </c:otherwise>
					        </c:choose>
					    	</c:forEach>
					    	<c:if test="${param.next}">
					    	<li class ="page-item">
							<a href="${action}?page=${param.endPage+1}">next</a>
							</li>
							</c:if>
					</ul>
				</nav>
			</div>
		
	</div>
</div>
<%-- 
<div id="paging">
	<c:url var="action" value="searchOk.do"/>
	<c:if test="${param.prev}">
	<a href="${action}?page=${param.beginPage-1}">prev</a>
	</c:if>
	<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
	<c:choose>
	<c:when test="${param.page==index}">
	${index}
	</c:when>
	<c:otherwise>
	<a href="${action}?page=${index}">${index}</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${param.next}">
	<a href="${action}?page=${param.endPage+1}">next</a>
	</c:if>
</div>
--%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>