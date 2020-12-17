<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/R&B%20CI.png">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
   $(document).ready(
         
      // 시멘틱 구조 불러오기
      function() {

			// header.html 삽입 script
			$("#headers").load("/common/htmlTag/header.jsp");
			
			// nav.html 삽입 script
			$("#navs").load("/common/htmlTag/nav.jsp");

			// footer.html 삽입 script
			$("#footers").load("/common/htmlTag/footer.html");

         //sectionleft html삽입
         $("#section_left").load("/common/htmlTag/sideNav.html");
      });
</script>


<style type="text/css">

/* 시멘틱 구조영역 스타일 */
#wrapping1 {
	width: auto;
	height: 1410px;
	margin: 0 auto;
	background-image: linear-gradient(to top, #e3eeff 0%, #e3eeff 20%, #f3e7e9 100%);
}

#wrapping2 {
	width: 1550px;
	height: 1410px;
	margin: 0 auto;
	background-color: white;
}

header {
	position: static;
	width: 1500px;
	margin: 0 auto;
}

nav {
	position: relative;
	width: 1500px;
	z-index: 3;
	margin: 0 auto;
}

section {
	width: 1500px;
	height: 1050px;
	padding-top: 20px;
	margin: 0 auto;
	z-index: 1;
	display: block;
}

#section_left {
	position: absolute;
	display: block;
	width: 300px;
	height: 1000px;
	border-right: 1px solid black;
	box-sizing: border-box;
	float: left;
}

/* 왼쪽 네브바 css */
#left_mainNav {
	position: relative;
	background-color: #f3e7e9;
	display: block;
	width: 275px;
	height: 80px;
	margin-top: 0;
}

.left_subNav {
	position: relative;
	border-bottom: 2.7px solid #cfe2ff;
	display: block;
	width: 275px;
	height: 70px;
}

.subA:hover {
	background-color: #e3eeff;
}

.subA {
	text-decoration: none;
	color: black;
	font-size: 17px;
	font-weight: bold;
	display: block;
	padding: 25px;
}

#section_right {
	position: absolute;
	display: block;
	width: 1150px;
	height: 1000px;
	margin-left: 300px;
	padding-left: 50px;
}

#mapSearch {
	height: 30px;
}

#mapSearch_btn {
	height: 35px;
}

.faqTitle {
	float: left;
	margin-left: 5px;
	font-size: 20px;
}

.subfaq {
	float: left;
	margin-left: 5px;
}

.q {
	background: url(/images/question.png) no-repeat 0px center;
	margin-left: 5px;
text-decoration:none;
color:black;
}

.a {
	margin-top: 10px;
	margin-left: 5px;
	background: url(/images/answer.png) no-repeat 0px top;
	background-color: lightgray;
}

#page {
	position: relative;
	text-align: center;
	margin-bottom: 10px;
	height: 30px;
	align-content: center;
	clear: both;
}

#page>li {
	display: inline-block;
	align-content: center;
}

#page a {
	display: inline-block;
	color: gray;
	font-size: 1.5em;
	background-color: white;
	margin-right: 5px;
}

#page>li:hover {
	/*font-style: firebrick;*/
	font-weight: bold;
	/* transform: scale(1.3); */
}
</style>
</head>
<body>
	<div id="wrapping1">
		<div id="wrapping2">
			<header id="headers"></header>
			<br>
			<nav id="navs"></nav>
			<br>

			<section>
				<div id="section_left">
					<div id="left_mainNav">
						<h1 style="margin-left: 20px; position: absolute;">게시판</h1>
					</div>
					<div class="left_subNav">
						<a href="/memboard/list" class="subA">고객의 소리</a>
					</div>
					<div class="left_subNav">
						<a href="/faq/list" class="subA">FAQ</a>
					</div>
					<div class="left_subNav">
						<a href="/notice/list" class="subA">공지사항</a>
					</div>
				</div>
				<div id="section_right">
					<h2>FAQ</h2>
					<p>자주하는 질문내용들을 정리하였습니다. 원하시는 질문을 클릭하시면 답변내용을 볼 수 있습니다.</p>
					<br> 	<br> <br> <br>
				
					

					<c:forEach items="${fList }" var="faq" varStatus="index">
						<br>
						<a class="q" href=#none
							onclick="if(a${faq.faqNo}.style.display=='none')
						{a${faq.faqNo}.style.display='';}
						else {a${faq.faqNo}.style.display='none';}">&nbsp;&nbsp;&nbsp;&nbsp;${faq.faqQ }</a>
					
						<div class="a" id="a${faq.faqNo }" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;${faq.faqA }
						</div>
						<hr>
					</c:forEach>
					<div id="pagediv">

						<ul id="page">
							<li>${pageNavi}</li>
						</ul>
					</div>
				</div>
			</section>
			<br> <br>
			<footer id="footers"></footer>
		</div>
	</div>
</body>
</html>