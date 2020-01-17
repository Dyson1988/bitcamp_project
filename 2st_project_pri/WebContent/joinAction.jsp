<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.dao.LoginDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.board.dao.LoginDAO" scope="page"/>
<jsp:setProperty name="user" property="idx"/>
<jsp:setProperty name="user" property="ID"/>
<jsp:setProperty name="user" property="PWD"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="age"/>
<jsp:setProperty name="user" property="address"/>
<jsp:setProperty name="user" property="regdate"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입창</title>
</head>
<body>
<script>
	function regCheckFunction() {
		var id = $(".id").val();
		var idRegExp = /^[a-zA-Z0-9]{4,12}$/;
		if(idRegExp.test(id)){
	       $.ajax({
	         url : "checking_id",
	         type: 'POST',
	         data : {id:id},
	         success: function(result){
	            if(result == 1){
	               $(".check_id").html("이미 존재하는  아이디 입니다.");
	               $(".check_id_count").val(0);
	            }else{
	               $(".check_id").html("사용할수 있는 아이디 입니다.");   
	               $(".check_id_count").val(1);
	            }
	         }
		})
	}
	//중복체크 여부
	if(checkCount == 0) {
		alert("중복체크를 해주세요");
		return false;
	}
		
}
	
</script>	
	
	
	
<!--   		String userID = null;
// 		if(session.getAttribute("userID") != null) {
// 			userID = (String) session.getAttribute("userID");
// 		}
// 		if(userID != null) {
// 			PrintWriter script = response.getWriter();
// 			script.println("<script>");
// 			script.println("alert('이미 로그인이 되어있습니다.')");
// 			script.println("location.href = 'main.jsp'");
// 			script.println("</script>");
// 		}
	
// 		LoginDAO loginDAO = new LoginDAO();
// 		Map<String, String> map = new HashMap<String, String>();
// 		map.put("ID", request.getParameter("ID"));
// 		map.put("PWD", request.getParameter("PWD"));
// 		map.put("name", request.getParameter("name"));
// 		map.put("age", request.getParameter("age"));
// 		map.put("address", request.getParameter("address"));
		
// 		int result = LoginDAO.login(map);
// 		if (result == 1) {//회원가입 성공시 1
// 			PrintWriter script = response.getWriter();
// 			script.println("<script>");
// 			script.println("location.href = 'main.jsp'");
// 			script.println("</script>");
// 		}
// 		else if (result == 0) {//회원가입 실패시 0
// 			PrintWriter script = response.getWriter();
// 			script.println("<script>");
// 			script.println("alert('비밀번호가 틀립니다.')");
// 			script.println("history.back()");
// 			script.println("</script>");
// 		} -->


	<nav class="navbar navbar-default"> <!-- navbar 기본값 출력 -->
		<div class="navbar-header"> 
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false"> <!-- toggle키를 이용한 접속하기 창 열고 닫기  -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="BoardController?cPage=0&type=boardAllList">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<!-- toggle키는 우측 상단부, toggle키 클릭시 하단으로 내려오는 형식으로 동작 -->
				<ul class="dropdown-menu">
					<li class="active"><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
				</li>	
			</ul>	
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="BoardController"> <!-- joinAction으로 가게 할것 -->
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" onkeydown="inputIdChk()">
						<input type="button" value="중복확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="사용자 이름" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="나이" name="age" maxlength="5">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소" name="address" maxlength="100">
					</div>
					
					<input type="hidden" name="type" value="join">
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>





