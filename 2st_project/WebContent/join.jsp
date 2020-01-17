<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//String result = request.getParameter("result");
	pageContext.setAttribute("result", request.getParameter("result"));

	//System.out.println("result : " + result);
%>

	<c:set var="변수이름" value="값" scope="Session"/>
<!DOCTYPE html>
<html>
<head>
<style>
	.bg {
		background-image: url('images/lionheart.gif') !important;
		background-color: lightgreen;
		width: 480px;
		height: 480px;
	}
	
</style>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입창</title>
<script>
	
	if(!("${result}" == "")) {
		if("${result}" == 1) {
			alert("중복된 아이디입니다.");
		} else {
			alert("사용 가능한 아이디입니다.");
		}
	}
	/* 이전 스크립트
	function sendData() {
	for (var i = 0; i < document.forms[0].elements.length; i++) {
			alert(document.forms[0].elements[i].name);
			if (i == 1) continue;
		if (document.forms[0].elements[i].value == "") {
			alert(document.forms[0].elements[i].name + "를 입력하세요");
			document.forms[0].elements[i].focus();
			return;//수행 중단
		}
	}
		document.forms[0].submit();
	}
	*/
	
	// 수정 스크립트
	function sendData() {
		var frm = document.getElementsByClassName("form-control");
	for (var i = 0; i < frm.length - 1; i++) {
		if (frm[i].value == "") {
			alert(frm[i].name + "를 입력하세요");
			frm[i].focus();
			return;
		}
			
	}
		document.forms[0].submit();
		alert("회원가입 완료");
	}
	
	function Duplicate_go() {
		alert("dup 진입");
		//var id = document.form-control.value;
		location.href="BoardController?type=Duplicate_go&id=" + document.getElementsByClassName("form-control")[0].value;
	}
	
</script>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="main.jsp">JSP 웹 게시판 만들기</a>

	<ul class="navbar-nav">
		<li class="nav-item">
		<a class="nav-link" href="main.jsp">메인</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="BoardController?cPage=0&type=boardAllList&selValue=0">게시판</a>
		</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" aria-expanded="false">${sessionScope.userID}</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown">회원관리</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="login.jsp">로그인</a>
				<a class="dropdown-item" href="join.jsp">회원가입</a>
	    	</div>
			</li>
		</ul>
	</nav>
	<br><br><br><br>
	<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron bg">
				<form method="post" action="BoardController"> <!-- joinAction으로 가게 할것 -->
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						
						<label for="user_id"></label>
						<input type="text" class="form-control" placeholder="아이디" name="ID" maxlength="20">
						<div><button type="button" onclick="Duplicate_go()">ID중복확인</button></div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="PWD" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="사용자 이름" name="name" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="나이" name="age" maxlength="5">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소" name="address" maxlength="100">
					</div>
					
					<input type="hidden" name="type" value="join">
					<input type="button" onclick="sendData()" class="btn btn-primary form-control" value="회원가입">
				</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>





