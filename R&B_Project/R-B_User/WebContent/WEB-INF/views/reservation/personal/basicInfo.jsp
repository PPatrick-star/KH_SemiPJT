<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본정보 입력</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/R&B%20CI.png">
<style>
	#wrapping{
		width: 1100px;
		height: 620px;
		/*border: 1px solid black;*/
		margin-left: auto;
		margin-right: auto;
		margin-top:100px;
	}
	form>#content{
		border: 1px solid lightgray;
		width: 1100px;
		height: 500px;
		background-color: lightgray;
	}
	form>#content>#content_sub{
		width: 900px;
		height: 350px;
		margin-top: 25px;
		margin-left: 25px;
		background-color: white;
		padding-top: 100px;
		padding-left: 150px;
	}
	form>#content_radio{
		width: 400px;
		height: 37px;
		float:right;
		margin-top: 10px;
		font-size: 18pt;
		/*border: 1px solid black;*/
	}
	
	form>#content>#content_sub>ul{
		list-style: none;
		width: 600px;
		height: 300px;
		
	}
	form>#content>#content_sub li{
		font-size: 22pt;
		float: right;
	}
	li input {
		width : 300px;
		height : 50px;
		padding : 5px;
		border : 2px solid #ccc;
		-webkit-border-radius : 5px;
		border-radius : 5px;
		margin-right : 10px;
	}
	.userName{
		width: 350px;
		height: 45px;
		font-size: 16pt;
	}
	.userBirth{
		width: 150px;
		height: 45px;
		font-size: 16pt;
	}
	#content_btn input {
			width : 100px;
			height : 50px;
			padding : 5px;
			margin-top : 10px;
			border : 2px solid #ccc;
			-webkit-border-radius : 5px;
			border-radius : 5px;
			font-size : 20px;
			float : right;
		}
</style>
<script>
	function check(){
		var birth = RegExp(/([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/);
		var name = $('#userName').val();
		if(!birth.test($('#userBirth').val())){
			alert("생년월일을 다시 입력해주세요")
			$("#userBirth").focus();
			return false;
		}
		
	}
</script>
</head>
<body>
	<div id="wrapping">
		<h1 style="font-size:30pt; text-align : center;" >기본정보 입력</h1>
			<form method="post" action="/auto/paper/weight" name="infoagree">
				<input type="hidden" name="onLine" value="${onLine }">
				<input type="hidden" name="reservation" value="${reservation }">
				<div id="content">
					<div id="content_sub">
						<ul>
							<li>이름  <input type="text" placeholder="이름을 입력하세요" class="userName" name="name" id="userName" required><br><br><br></li>
							<li>주민등록번호  <input type="text" placeholder="생년월일" class="userBirth" name="numberfront" id="userBirth" maxlength="6" required> - <input type="password" placeholder="뒷자리 7자리" class="userBirth" name="numberback" maxlength=7 minlength=7 required></li>		
						</ul>
					</div>
				</div>
				<div id="content_btn">
					<input type="submit" value="next >" onclick="return check()">
				</div>
			</form>
	</div>
</body>
</html>