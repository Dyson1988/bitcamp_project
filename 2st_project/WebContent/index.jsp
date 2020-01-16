<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search(frm) {
		frm.action = "BoardController?cPage=0&type=boardAllList&selValue=0";
		frm.submit();
	}
</script>
</head>
<body>

	<h1>메인화면</h1>
	<form method="post">
		<input type="button" value="게시판" onclick="all_search(this.form)"/>
	</form>
</body>
</html>











