<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("id1");
int admin = (Integer)session.getAttribute("admin");
String workgroup = null;
request.setAttribute("userid", id);
request.setAttribute("admin", admin);


%>

<%--<%=id --%>
<html>
<head>
<meta charset="UTF-8">
<title>세상의 모든 병원 메인페이지</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>검색메인</title>
</head>

<body>
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

  
  <div class="container marketing">
  
      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <a href="search.do"><img style="width:60%; margin:70px 10px 10px 50px" src="data:image/png;base64,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" class="rounded" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" style="width:150px; height:150px" focusable="false">
          <rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"></text> </a>
          <h2 id="h2">나와 가까운 병원 찾기!</h2>
          <p id="h3">가장 가까운 병원을 조회해서<br>시간을 절약해 보아요</p>
          <p><a class="btn btn-secondary" href="search.do" style="margin: 10px 10px 10px 80px">병원검색 바로가기 »</a></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
           <a href="search.do"><img style="width:60%; margin:70px 10px 10px 50px" src=" data:image/png;base64,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" 
          class="rounded" aria-label="Placeholder: 140x140"preserveAspectRatio="xMidYMid slice" 
          style="width:150px; height:150px" focusable="false"><title>Placeholder</title>
          <rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"></text></a>
          <h2 id="h2">진료과목 검색하기!</h2>
          <p id="h3">진찰을 원하는 부위만 검색하여<br>전문병원으로 찾아가요!</p>
          <p><a class="btn btn-secondary" href="search.do" style="margin: 10px 10px 10px 80px">병원검색 바로가기 »</a></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
           <a href="list.do"><img style="width:60%; margin:70px 10px 10px 50px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABRFBMVEX///8cLWvu4EXt5J3TuioZK2oAHWTZvybt5J7u4EAYKmoAGGLz6Z8AG2Pt5KAAFWEAIm0AHGkQJWfRtyYMJW0ADl8AGWgAHW4NI2YGIGX1658AEmCPlbDawCX29/oAFmjf4ekACl/KzdoAAF1/hqW0sY7u7/NocZeJkKzR1N9gaZEqOnSmq8CYnbaik0HAw9I5RHBOWYbn109nZFeVlYW1ojdET3/v4lHw5GM2P2XHsS/TzZbgzVDAvJFydn0gMGnv5HDv5YxlannLwk1CSGE0QXA+RWOjoonf2JrWvzpSVF2Dek1LU3Pu5H+9uY/hzjutnDzOyJVybVQAC26De01LT19dXVq5tGnGvl7w5Gk8SX5rcHuChXt+f2vf14KbjkJ0bVGamYa/qjKUklhvc2mcmFaSiE9IUnS9tVpYX3gmNmaOjVmUcfwgAAAU+UlEQVR4nO1d/VcaydJ2lGFghq8ZBx1AvhQhCAZlI0SNkmhM1HxpYvLmGvdN4t1NVvf///12Vc9Hz8AMkEjM8fRzzp69d6NNPV3V1VXdT5OpKQ4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODl8UqtXCbdswSZQqjXS6Uanfth0TQzOcEQVBzCSbt23JhNAqE36I9N2kWM3IJkFBNEq3bc0ksBAm3ORiEXhmKrdtzQRQiAPBg/39Z0AxWb1te24e6ML5/4tGPxbvphOrAnGd9v1hdHr6WCMUc3fOiasQpHPL3enp6fupu+jEArhQPsgSgt0374kTRe2OORFdWFzOkiCdfnMyT/5P+N5t23SjKEAxI69FngDDdv7p3XOiuQpjj5FhiDpx4batukEUZBESaSTxH2DYDUmwEoX0Heoy0IXq81gCUul090jCdHqHVmKhAavwYGYmAS6cnj4KhXAlGndmJTYVWIXPY5EsZfho1nTiXVmJhR64sBGbibyiDNuzoTxUp6JwR5xouXAm8dhmKN2HdBpfvW3bHLRq6+s/ePpQ13AVRsgyfEgZPpwNhaRNcKK8+GPm1CvrnVrrx353MFZyhqxl0uOtm0K9tVo7F8Oy6cIZmkoJQiHTiWJYPF9ZaC2OGa0L6YwmG7mV8X4rCCtx2puXRzp9KFRLrdVKx1jKKWFDFuHoQlsjLow8MQmSVBOi6RTcqGWU3FKmU1lt1kc8h1s1j0PiN0ZxMW2fPgyb7FKzsnIeLiM1wYZY3IlFEk/MICU74qPQrLShy85PCLIRVtLxxkpltTTMnGrGPu/5wSDvwzrMNtozbJOuZBRDYw1HL+nl5RjhN20RBI5tsu2ruih4flYz4vHaEE/ew+MQHUJj/WYILiaB4J/Y85SDPr1wHvZw04yUmhI+bWdfdaMMP5Pj1h89PZXSNdlNNNwIpFiAGNXe/wUUkzfjRHChOD/9EVJDJsiJNZugrOkptSiuXe0+WD5NZJ946ZnLUZrduH/2x/vNXkrVdcf3mUDX3MvAccjH6aJ4U05czJERUxfRLlZasv9KrCuYVAi1Yu/l7sXz08NENhuLkX3wPwMJwr4Ykghmt4Do8bU6Txw6bH1VYfPRXnajf0JZlLsJJ6IL1f+PTt9XgystXB+pqwfPdw4jM8DMgr1LeBGyAURDsxufz44h+IyAIw480VJfR6P7qRty4uISupCUI2+GVForZCqMT1mWmwk/hkchDyQp/4VQlDu+5lRh99HWSCv9Bn5SKP+8E8GFsrxNGLaHVFrAMPU166U3DkPC8XMqkKF5HEIYti/FG3EiLi59N0b2sraETtT8Ml3NILb1Dvs8OBMZg+EWVHP+ZhdwFa7NvAJz3hInisrP3mSBY0T9EJbSmyHlchN2Fa2x3Ucx8XAwwe5snwe3NrXAODFdGIHcFbpEuj9Z2NST6MLsDBhkVlpxHycWGvJgilbXNCiXeghewweIfp8wVYA2RftOa/ij/B/gxOSPO7FQqjc74MLi4QwedNJFIhi1Vr00yIbWEm4XPS9Fq/P1IPrIS/CSEhxc/hJzWrAQBHU5hnH/KLQFMaV1mvXSuI1mdbG1UOs0tGQcvEJcSI8BiRGwSgRDSWqNTq2/J2hC3hU0wUtxcJh2BxMUyt4YxSal05AVBQjKa2TO8Nw1JIETBTmezPTOV+61FksjsWvVGrl0UiHtiVljyKntmQTGGZw+zFtVC/QEybRyXmGHbUFQk4rm1E1xcJh6glS67CFB9w1xqXKuEHOsJgVXISlyo/T3L63KVqTmpBtDu8bCStlwl4li8UFs5hWd9HZIOk65a2U5U2YLuRbWNbK84/HiIIZHAwm6Q/ReOeMp5NWrWOQVTc6ken8x7zZWNsorwYX7etj9C1qq/CBGymYrsNqzH+Z1zxTk2KhqYaDK+o5rX0w87KfoDlJpgxJ0X4Av5ES3OXp5L/GEMSf0Yl73NDPhwB2ylTOHwq5AVXtXF9sxV4g9kk7ePhVSKbYnSFddQ8j9FOk6DghSk6CYcxGspm1qaI74/WIn5kpbbenyxfue25xcUKDC7icYc6ke6Qq+vj6NkMrZUze/Idbk81gqvz8gQwOduMusRWxQ5dRrhmJkJjhIpQ10hJh0G9fEe2NVFQ5efiJNymGW2ONe03Colc+TFuXbW9Ki6CraH7RDdsjnGLuvT8n2kLXKS3eEvTFnnlTK+dDlxv2ncl+hvBinFJcZiv3tBbvdSyeUoHf2K1AlvVw+3TablAFZizWHzPsfWmDNRxlqVzOuNDGYoV2DyP23nYu4emSVodgfpkyQSiciRnbSG16VDJzSHbqW9GCGFs/jYQxxR9VfJlwMH0cHGwb5T9D68jtB3ZApRWaqvLXpEUMQT0jEeN/6oXWg7Npe+6KUwex77L1qAQzraZh9/TtL0T397tUjIBOhLz/XqVOMbZ95cpm2RUM03t8HFXAYTXBvr74MZ58CQTEdWMbdw+xFKDpjRrJ+q8dM8H3BRVAyaDUUGzxP5oEiHeYtFiaZQY0erSC0HkuR7ae77ITPPtMxsw87LeunyA7Jrh7qQZ9D1JIBErYiEwpuhoxpPejJMoMnnirFNJmhyEZDdwDBoRKIBZw248Dp8xJM5DNTvzE/MP9ZqIfJOEXHsoSLIWPaBlReYb9WvUWzVvl0YDSwsb6JBJMjXEquohcZisyQjmFmgpfDfttrFS4N55zqLTHtyxDG8W0OWmGzgrDNYfZWuzsxG0thtIuH1bKHYqKfoXSChbmo+NYPJahQi0yqcUepw/ASapG4f3YwS13NLpKYTuXIQ7A84s0K9aJ2fdi351tRIZ1gMSMHHPu1krAOY8MZSnC96D9TcKmAFO14cPaLh1aQ0s5ZSI98W4f7kGDAdYp7SGvOLilB39UD0xSGVo7JgX6ZJg+H6YEnzYs0UK2AcFaNNeGz1IO5MWSrTUxhc1/NQskqdq3kLH3AtaMFneRBxcXsFjMxz27h+BB2i+DTlkVc88aeFadd9yDSNzjJ9Tka8KUIgap9z3rm35yzLQgsMRy4s0IBmHrgZMCs7374Dc4PzwO7OkzMcu/Qs31ZUYCCznGFx00SZGLKM2lWVGD6ywUSLECjObc8wo5P9UNDFFL1HJhz6s4LVt7L434zrrIaGhdZ8GGI6S9dCvr9EiTkucMZP4ZsuQUMg0utqVIaTmq3fRhCSMXHZQg3PNqVxdA0y6rZtq7lwcWag5YC+guG4StfhhKMNsRAyMyky3BHqc0Qc9W4ck7ohfULK8g861CCrjAcmJohlZI+zJch04VhyxOYTM3hXmYHr0Ppy9Bc1Q+UManPvQytIaHRDB4Sr2l2sx6GUYTXhyMY6BqujyEc44rB96p9qMKBjVVVRmKe/dBMf0EDQFWe+sps+IRhNLr/3z/f/rsPHFmG1MBAe85lZsJthtamujEPBfJ4p8KLmLsOPZne3g9PUkMUTQVMNDuujiC6/5eq6rqqHhOOD5lMAwYK5SADqwKE1GtrOM9+GNqCZDrmZSmmUrumyZLQ6hIX2O3YJVwYBNSSNLvLTlVK8l/7L1OZIOrzH/bZRnNLHGZgPQ77rz0ciALIP/a1wOzm8FzlBZyQGJ+sOXvy5qz37t3m3zZDSRhSS2IqPXCOCmKHf5Yd5YWol/+6lByKz4YZiMPJljnZ7t+b7971ztpty5wP4ydTqEisVJo9vBCgDpXnD76FqF15SKZB6Q83Gyv3wQhiivLTDEpS195e5lkDg2626XBmhRWLPN+E1lROiV+2JCdXBR5A9QNKb3qQFJt50EvZVxgHn/MwKK0lA058cLPZtUx60FNxBNEo12pLhulH+UuINTAocdXs4WLZ5TXVNqf3Aoegd2LKOASrkCjUbeD3XLYGxEHVzfuSNLyWdHIfM4KmrJTI2LW4Ya5H42zWNlDM+ZtTsIaLxV6vFVlzUhqG1UZqWK7yAkuIxmE2snwwZ1kXp/9Dnn9/IkknamAtiZelkPtISNkjJFfM1FRaSWrUj6keY6D/fFXhx4s72djOlclPjltDqNefSQMMdVtwkeUBSELllyQgTOvkdGex1VDMpZQ63sBaslzyHQAKBv0iy4xQXmeSZX29bP7n1OZnKX8Gqbnsbw4WucWZ0z3VpKU0WovOEM/uY15QxkmmwFDsrZkDyskGTk8zEzbdodN+hWFYdV9P0guQ794RHCye5ywDD/DunE0Udc/VK9Tdgvxdp9Eth2nebZ0n7Wkadk7QhxLckYmyNWH25KwKYepHPKRx6qTF86VcmdUXtPAgxLxklZXzAR/e6lgG4r+c9m5BSeeWOuxmizWkQO+WxLCwan0uCStzCPijpdIYDKfWzaSO/JgFUr1n2NpHxT72aS7Rg0WmtlzP2OmAmSE3mpYTwN+2CzsKhkmanZQFxTInk7nH+LfQtJbO2MqakmHQCQuvehJAtVI2/6hj/UnJ+hSH81T1nKpuxXCy6ZtCCk05Tn813LDsrphqXddL2kKHxo5RrniyW2E1bP7RuC9vS51kPJzUFgZYR9K9ElYUZzfE+xz4GNdbpkomGQ4n5UEjMFgVyU8p8Yo9W3gJDYO5apRCTSGfGa8NyN6FBS0Zjic7pZG5Wag3F1o+20GpudB0BkTNjYy3UC6FbbW1utoa2tIUFslPOZ8D5SIZCigmXTa7P9MF8kHNib7xRxcW9/FpaPgnX1CgC7UP+/NeJ94mcLPS/4r+A+97f/YZDLrw3ccoHlcu/SYPTsCFqD8dLpMeiirsUsbVdPQf9fdxYgkuh4y9x9HpG3jLBC4U1Z3paBtj/vf4YgJ0Yer0IWmPn2k/+ZapiqvwKjs93T35bZyIqcHYi4E6c5hMeihwFao7T0gHjyeEv8X7vRoYVT4Fhu08vmUSf9iqEupFr0Ci1D06+U3SaSlO4wru+ts/+yANpfDlnQgypC9plVt3IsZV8XTmCT0gRJl05gfHwtc+2vcsqouOpFtfidXF5sJKw6CrEG8luiEJV6KodSrN1kCNrR9KrWalg71RcYe+Fn5kPofONFYWmuO+bftJVEk5R8wp55SMhsWoSowCfQScxD1D/Z0Gz7TK8ExrCNECoXZvpZEuJ8MoT4FVGMHj0Lb5kpYMllGS5cx5baFZ/yVEW+vhtJJhNaj6XiwR69IbM+pEq9PRMuFkruG/LAsLjVwyTubJOWacex2j0o/u0ayECicTspFR0pn1yX/FVDOtCS7IqcZh4pV1N3UkvZ33KF7lpF/fVugooutHRbl8EctaooF2aEv2Pm7TxrnI/iHYLxEFqmdV5+TdxBPm2V07/+0atJ6sqlXxyRbOQzAUkOqqevA8+9h5BNZ9s/VB9rxtE3OlyTLENgJfps0VxbW93a87h9mIS7t4JM1ufP7y4em1Pm/bNrjhwI0GdMu6WlSvX366WD6NeOSxs9Llybe3x896qv22bcLJtYB9W+r66uLr8jZ9meZ5EYNXCaj1JLZ9+fAM88fgYz584i3ra5/gldthBAWk7pvih+bbNjLY/bO3x9eoywu+o/pZVPELPHbAGEbZ59JVMm8owDjJ/84EHqHJBziWz20/c3sDQ+UxuSoT/TaNAojsZM+jmH4fMiTxQUSAD1O77rH6fMiMdYkSv8n6kK5D7dpF0a0hdj8x+ANm3ad+picyqotixLMOWYIbvV/xPWh1VAq6nza5buhdTwykD7hn+8kF6amauusS9bMB8Wi2j6AcL02WIdkPkaLB6D1d885Ou/n6xP/VPH3coe6x8lhWSszEg6V1H+tu4gcpmo9iTgenGnYZDiM4NbVCKX4avBC7LEE9UMx6ozDFkAKjHHVeGrCqZEpQCZKVF+iXNah7TEAMiofhWs+bpUhVu7rtRWYhMtNOi8pAglPW91GoV850OQHhyGPNEP1FBOFyET+vbOs9YwOm/SnVJA8hSLKzQilGLIb2dDmigft4wyoGaT1vGC367scWJjvzfuT2YHKE1E4ppiyKzkLs2h5ECcBgMf+kQN/9aJbWwkmAlt7mC67B3Eh7F6U4Zwk1bS1x25Z64jbhI+afFOjXJ8yZIiV73q0iZAsr7tEIkn0xidnZmi6rgLBm6yyFxf6v/vLhuiA6EmB7RzSnnZ5IDdHiMajgxYeZueyAsATAx3gKW5ocFx8sgMLF2qtjHoYjCNVYYMtiqW29DENwXDO2PPYG4JJxexhS1W9u5CagmkQfzgz24Q/onW4E54yM2xuloS04Nhui+mVAZYLetGUxHConmhBg25977ck0zuuAscQfoCmXv0c8FZLF8LMaLCeaEFB3nfI+gLByKVX9jnyB4ZIJ2rnUWocomw8WlU8CVHt46McQZW8jayNAJhi+sBl6qgeqd/qV2z2CyriZZzqobraOHVD2JmqjDgaJxn64kOjSseBNNR0Mrgp+fTJltYfAsP3Pv3/vR+2DFdQQj3qrUioLVCZIGU5H9//+95921GKYR23m0AL3ptFjddexV2fifGpefb9vKUYvUWE7YjI1ZYLmWNmP71U1VRTOHpkSW+nF+OLRn0eVXmUiw1jiAX2WL2rF4w1TMXowRjIFxbX2ko4VO70qavSxu/ECpZkhvL8QG7/4mg111yjjjiW+9lT7TFqb/4Dq5vzxGNs0HG8Zn1Aee7pXtG8NQJqJHC+BYaY0UUJ9wFR6jfLYA1Mea7LUdVA30ycUIyZTq3jIbu+mTP2wKQ8EaaYUkvRxxaM3APPNUHbZ4qflznNUqyfq2pfZ/BhvPAoivjTIHu5qppY/k2zY0szN+3m8PA9+oXPzgMDS9nYsRbKsdFpT1Uo4Y6qb9bPPo68dFADryxdFi59RqTLa0flnJ+OE/E0BvxZOM+W/Ys6Uj5ZqSUuljj3diMUkNpPWt0QaSfMrfQhHM1bV4C/Hmgzqzi0bK7Cdqq+UnfvFUad9xbB/RSvXStZ/LjQF535RVEr+A0wEK6ZAVo4b7j2hvm5KzAUxPeqOv2QS0ZKeO95VzZQkC/FfvuMXOgoJLplRJNtodYCjmPF9qd+HFj5PIPz6is/Cgkw4iv73yBNEYfU8l24sDHRTaz1eFpxwG45STSuH1wfOSPVeo5w7v6W/Wyjgr98qjPs3cwX8QqF666ohDg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODo5fiP8B9baZktSMVNYAAAAASUVORK5CYII=" 
           class="rounded" aria-label="Placeholder: 140x140"preserveAspectRatio="xMidYMid slice" 
           style="width:150px; height:150px" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777">
           </rect><text x="50%" y="50%" fill="#777" dy=".3em"></text></a>
          <h2 id="h2">리뷰 좋은 최고의 병원 찾기!</h2>
          <p id="h3">후기게시판을 이용하면 보다<br>생생한 진료후기를 볼수있어요!</p>
          <p><a class="btn btn-secondary" href="list.do" style="margin: 10px 10px 10px 80px">후기게시판 바로가기 »</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
  

  <!--제목-->
  <div class="search-main-title">
    <h2 style="margin: 70px 10px 10px 10px">현재 뜨고있는 병원을 확인해보세요!</h2>
  </div>
  
  
  <!--메인 이미지슬라이드 영역-->
 <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://img.freepik.com/premium-photo/long-hospital-corridor-with-empty-seats_117023-1679.jpg?w=2000" class="d-block w-100" alt="hs1">
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
            <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
    <div class="carousel-item" data-bs-ride="">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://www.bonebest.co.kr/images/hospital-inside-mobile/waiting-room/waiting-room1.jpg" class="d-block w-100" alt="hs2">
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
          <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <img  class="bd-placeholder-img" style ="width:80%; height:40%; margin: 40px 10px 10px 130px;" 
      src="https://freight.cargo.site/t/original/i/fa6dbd0830661739dee7be56c4bdd5f1113eb4032ce48cfdd3c04fd34478598f/_-2.jpg" class="d-block w-100" alt="hs3">
      
      <div class="container">
        <div class="carousel-caption">
          <p style="color: black;"> </p>
          <p><a class="btn btn-lg btn-primary" href="search.do">more view</a></p>
        </div>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
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

<%--  
      관리자한테 보이는 부분
<input type="button" value="회원정보 수정" onClick="location.href='updateUser.do?userid=${userid}'" >
<input type="button" value="회원 삭제" onClick="location.href='deleteUser.do'" >
<input type="button" value="로그 아웃" onClick="location.href='logout.do'" >
<script>
<% if (id == null) {
%>

alert('비정상적인 접근입니다.');
history.back();

<%
}
%>
document.getElementById('admin').style.display = 'none';

<%
if ("일해라".equals(id)) {
%>
document.getElementById('admin').style.display = '';
<%
}
%>
</script> --%>

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
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</html>