<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	System.out.println("boardContentModify : "+ request.getParameter("bvo"));
	pageContext.setAttribute("cPage",request.getParameter("cPage"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
	function sendData() {
		var firstForm = document.forms[0];
		//게시글 항목에 값 입력 유무 체크
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3) continue; //파일항목
				alert(firstForm.elements[i].title 
						+ " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		
		//패스워드 일치여부 체크
		//var pwd1 = document.firstForm.pwd.value;
		var pwd1 = document.myForm.pwd.value; //새로 입력한 값
		var pwd2 = "${bvo.pwd}"; //DB에 저장된 패스워드 값
		
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			document.myForm.pwd.value = "";
			document.myForm.pwd.focus();
			return false;
		}
		//firstForm.submit();
		document.myForm.submit();
	}
	function list_go() {
		location.href = "BoardController?cPage=${cPage}&type=boardAllList";
	}
</script>
</head>
<body>

<div id="bbs">
<form action="BoardController?type=boardContentControl&contControl=0" method="post"
		enctype="multipart/form-data" name="myForm">
	<table>
		<caption>게시글 수정</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목"
							value="${bvo.subject }">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" size="12" title="이름"
							value="${bvo.writer }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50">${bvo.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="file_name">${bvo.file_name }
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="12">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="sendData()">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go()">
					
					<input type="hidden" name="b_idx" value="${bvo.b_idx }">
					<input type="hidden" name="cPage" value="${cPage }">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
</body>
</html>