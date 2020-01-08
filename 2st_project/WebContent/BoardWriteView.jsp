<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3) continue; //파일 속성 제외
				alert(firstForm.elements[i].title + " 입력하세요")
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	function list_go() {
		location.href="BoardController?type=boardAllList";
	}
</script>
</head>
<body>

<div id="bbs">
<form action="write_ok.jsp" method="post"
		enctype="multipart/form-data">
	<table>
		<caption>게시판 글쓰기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="writer" size="12" title="이름">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="file_name">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="12" title="패스워드">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendData()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>

</body>
</html>











