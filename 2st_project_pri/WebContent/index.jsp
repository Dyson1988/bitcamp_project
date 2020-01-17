<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>

</head>
<body>
	<h1>메인화면</h1>
	<form action="BoardController" method="post">
		<input type="hidden" name="type" value="boardAllList"/>
		<input type="hidden" name="cPage" value="0"/>
		<input type="hidden" name="selValue" value="0"/>
		<input type="submit" value="게시판"/>
	</form>
</body>
</html>











