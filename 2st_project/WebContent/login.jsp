<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인 창</title>
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
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="BoardController"> <!-- loginAction으로 가게 할것! -->
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="hidden" name="type" value="login">
					<input type="submit" class="btn btn-primary form-control" value="로그인">
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





