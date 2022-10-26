<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   
<title>회원 정보 수정 완료 페이지</title>
</head>
<script>

window.onload = function(){

   var sec = document.querySelector('b');

   var a = function(){

   location.href = 'memList.do';

   };

   setInterval(function(){

   var tmp = sec.innerHTML;

   tmp = Number(sec.innerHTML) - 1;

   sec.innerHTML = tmp;

   }, 1000);

   setTimeout(a, 5000);


   }; 
</script>

<body>
<div style="height:800px">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="height:100px"  aria-label="Tenth navbar example"></nav>

</body>

<style>
    h1 {
      font-family: 'Black Han Sans', sans-serif;
        text-align: center;
        margin-top: 180px;
        font-size: 90px;

    }
    h2 {
      font-family: 'Do Hyeon', sans-serif;
        text-align: center;
        font-size: 30px;

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
</html>