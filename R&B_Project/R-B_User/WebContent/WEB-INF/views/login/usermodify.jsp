<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>정보수정 및 탈퇴</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/R&B%20CI.png">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=302qxax7hb&submodules=geocoder"></script>

<script>


function addSearch(){
    //주소찾기 API가 한 일은 주소검색창 팝업 띄어주고 검색결과 항목을 선택했을 때 선택한 값에 대한 데이터를 보내주는 역할
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭하면 그 때의 데이터가 data매개변수로 넘어오고 console.log로 그 data를 출력해봄
            console.log(data);
            console.log(data.zonecode);
            console.log(data.address);
            // 내가 선택한 input태그에 api서버가 응답한 값을 셋팅을 해줌
            $("#postCode").val(data.zonecode);
            $("#roadAddr").val(data.address);
            $("#jibunAddr").val(data.jibunAddress);
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
             // 예제를 참고하여 다양한 활용법을 확인해 보세요.
         }
     }).open();
 }
	function checkz(){
			var BD = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
			var phone = RegExp(/^01[01][0-9]{7,8}$/);
	if(!BD.test($("#BD").val())){
		alert("생년월일을 다시 입력해주세요")
		$("#BD").focus();
		return false;
	}
	if(!phone.test($("#phone").val())){
		alert("폰번호를 다시 입력해주세요")
		$("#phone").focus();
		return false;
	}
	}
	
</script>
<script>
	function question(){
		var question = confirm('정말로 삭제하시겠습니까?');
		if(question = true){
			
		}
	}
</script>


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

      });
</script>
 <!-- <link href="/common/memberSearch/MemberList.css" rel="stylesheet" type="text/css"> -->
<style>
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
	/*border : 1px solid black;*/
	border-right: 1px solid black;
	box-sizing: border-box;
	float: left;
}

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
	width: 1200px;
	height: 1000px;
	/*border : 1px solid black;*/
	margin-left: 300px;
}

/*----------------------------------------------*/
/*section-right꾸미기*/
.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	margin-left: 25%;
	position: absolute;
}

.table th {
	color: #168;
	/*background: #f0f6f9;*/
	background: #dcdcdc;
}

.table th, .table td {
	padding: 15px;
	border: 1px solid #ddd;
	width: 155px;
	height: 10px;
}

.table th:first-child, .table td:first-child {
	border-left: none;
	border-right: none;
}

.table th:last-child, .table td:last-child {
border-left: none;
	border-right: none;
	width: 400px;
}

.td_label{
	text-align: left;
}

.table tr td:first-child {
}

/* .table tbody tr:hover {
	background-color: #eeeeee;
	color: #168;
}
 */

.inputBox{
	padding: 5px;
	height: 20px;
	width: 300px;
}

.address1{
	padding: 5px;
	margin-top: 5px;
	height: 20px;
	width: 300px;
}


.btn2{
	height: 30px;
	margin-left: 10px;
}

.searchBox {
	float: left;
	position: absolute;
	margin-left: 840px;
	display: block;
	margin-top: 14px;
	height: 30px;
	width: 300px;
}

.searchBtn {
	position: absolute;
	float: left;
	height: 37px;
	width: 50px;
	margin-top: 14px;
	margin-left: 1140px;
	font-size: 15px;
	font-weight: bolder;
}

.searchTag {
	position: absolute;
	float: left;
	display: block;
	height: 37px;
	font-size: 20px;
	font-weight: bold;
	margin-left: 650px;
	margin-top: 17px;
}

#right_whole{
	width: 1200px;
	height: 920px;
}
</style>
</head>
<body>
<c:if test="${sessionScope.member ne null }">
	<div id="wrapping1">
		<div id="wrapping2">
			<header id="headers"></header>
			<br>
			<nav id="navs"></nav>
			<br>

			<section>
				<div id="section_left">
					<div id="left_mainNav"><h1 style="margin-left:20px; position: absolute;">마이페이지</h1></div>
					<div class="left_subNav"><a href="/ResList" class="subA">헌혈기록 및 검사결과 조회</a></div>
					<div class="left_subNav"><a href="/modify/form" class="subA">정보수정 및 탈퇴</a></div>
				</div>
				<div id="section_right">


					<div id="right_whole">
						<div id="right_head">
							<h1 style="font-size: 35px; font-weight: 900; text-align: center;">정보수정 및 탈퇴</h1>
						</div>
						<br>
						<div id="right_middle">
							<form onsubmit="return checkz()" action="/confirm/password" method="post">
							<table class="table">
								<tbody>
								<tr>
									<td class="td_label">아이디 </td>
									<td class="td_input"> <input type="text" class="inputBox" placeholder="아이디를 입력하세요"  name="userId" value="${memberInfo.userId }" readonly>
									</td>
								</tr>
								<tr>
									<td class="td_label">기존비밀번호</td>
									<td class="td_input"> <input type="password" class="inputBox" name="beforeUserPwd" placeholder="비밀번호를 입력하세요" required></td>
								</tr>
								<tr>
									<td class="td_label">새비밀번호</td>
									<td class="td_input"> <input type="password" class="inputBox" name="userPwd" placeholder="새로운 비밀번호를 입력하세요" required></td>
								</tr>
								<tr>
									<td class="td_label">새비밀번호 확인</td>
									<td class="td_input"><input type="password" class="inputBox" placeholder="비밀번호를 다시입력해주세요" name="userPwd"  id="pwd2" minlength="8" required></td>
								<tr>
								<tr>
									<td class="td_label">이름 </td>
									<td class="td_input"> <input type="text" class="inputBox" placeholder="이름을 입력하세요"  name="userName" value=${memberInfo.userName } required></td>
								</tr>
								<tr>
									<td class="td_label">생년월일 </td>
									<td class="td_input"> <input type="text" class="inputBox" placeholder="생년월일8자리를 입력해주세요"  name="BD"  maxlength="8"  id="BD" value="${memberInfo.userBD }" readonly >
									</td>
								</tr>
								<tr>
									<td class="td_label">이메일</td>
									<td class="td_input"> <input type="email" class="inputBox" name="email"placeholder="이메일을 입력하세요" value="${memberInfo.userEmail }" required></td>
								</tr>
								<tr>
									<td class="td_label">폰번호 </td>
									<td class="td_input"> <input type="tel" class="inputBox" placeholder="폰번호를 - 빼고 입력하세요" name="phone"   maxlength="11" id="phone" value=${memberInfo.userPhone } required></td>
								</tr>
								<tr>
									<td class="td_label">주소 </td>
									<td class="td_input">
										<input type="text" class="address" id="postCode" style="display:inline-block;" placeholder=" 우편번호 " name="postAddr" value="${memberInfo.userAddrPost }" readonly> 
										<input type="button" onclick="addSearch();" value="주소검색">
										<br>
										<input type="text" id="roadAddr" class="address1" placeholder=" 도로명주소" name="roadAddr" style="display:inline-block;" value="${memberInfo.userAddrRoad }" readonly>
										<input type="text" class="address1" id="detailAddr" placeholder=" 상세주소" name="detailAddr" style="display:inline-block;" value="${memberInfo.userAddrDetail }" required>
									</td>
								</tr>
								<tr>
									<td class="td_label">성별 </td>
									<td class="td_input"> 
									<c:if test="${memberInfo.userGender eq 'M' }">
										<input type="radio" id="Male" value="M" name="gender" checked>
									    <label for="Male">남</label>
										<input type="radio" id="FEMALE" value="F" name="gender" disabled>
									    <label for="FEMALE">여</label>
									</c:if>
									<c:if test="${memberInfo.userGender eq 'F' }">
										<input type="radio" id="Male" value="M" name="gender" disabled>
									    <label for="Male">남</label>
										<input type="radio" id="FEMALE" value="F" name="gender" checked>
									    <label for="FEMALE">여</label>
									</c:if>
									    
									</td>
								</tr>
								<tr>
									<td class="td_label">혈액형</td>
									<td class="td_input">
										<c:if test="${memberInfo.userABO eq 'A' }">
											<input type="radio" id="A" value="A" name="abo" checked>
											<label for="A">A형</label>
											<input type="radio" id="B" value="B" name="abo" disabled>
										    <label for="B">B형</label>
										    <input type="radio" id="O" value="O" name="abo" disabled>
											<label for="O">O형</label>
											<input type="radio" id="AB" value="AB" name="abo" disabled>
										    <label for="AB">AB형</label>
										</c:if>
										<c:if test="${memberInfo.userABO eq 'B' }">
											<input type="radio" id="A" value="A" name="abo" disabled>
											<label for="A">A형</label>
											<input type="radio" id="B" value="B" name="abo" checked >
										    <label for="B">B형</label>
										    <input type="radio" id="O" value="O" name="abo" disabled>
											<label for="O">O형</label>
											<input type="radio" id="AB" value="AB" name="abo" disabled>
										    <label for="AB">AB형</label>
										</c:if>
										<c:if test="${memberInfo.userABO eq 'O' }">
											<input type="radio" id="A" value="A" name="abo" disabled>
											<label for="A">A형</label>
											<input type="radio" id="B" value="B" name="abo" disabled>
										    <label for="B">B형</label>
										    <input type="radio" id="O" value="O" name="abo" checked >
											<label for="O">O형</label>
											<input type="radio" id="AB" value="AB" name="abo" disabled>
										    <label for="AB">AB형</label>
										</c:if>
										<c:if test="${memberInfo.userABO eq 'AB' }">
											<input type="radio" id="A" value="A" name="abo" disabled>
											<label for="A">A형</label>
											<input type="radio" id="B" value="B" name="abo" disabled>
										    <label for="B">B형</label>
										    <input type="radio" id="O" value="O" name="abo" disabled>
											<label for="O">O형</label>
											<input type="radio" id="AB" value="AB" name="abo" checked>
										    <label for="AB">AB형</label>
										</c:if>
									    
									</td>
								</tr>
								<tr>
								<td colspan="2" align="center">
								<input type="submit" value="수정하기" class="btn2"/>
								<input type="reset" value="취소하기" class="btn2">
								</td>
								</tr>
							</tbody>
							</table>
							</form>	
						</div>
					</div>
					<div>
						<input type="button" value="탈퇴하기" class="btn2" style="margin-left:580px;" onclick="return question()">
					</div>
				</div>

			</section>
			<br> <br>

			<footer id="footers"></footer>
		</div>
	</div>
	</c:if>
	<c:if test="${sessionScope.member eq null }">
	<jsp:forward page="/login/user"></jsp:forward>
	</c:if>
</body>
</html>


