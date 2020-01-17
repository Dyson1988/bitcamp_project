<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 또는 scope에 존재하는 데이타를 사용해서 
	게시글 삭제 작업을 하기 위해 암호를 입력 받고
	암호가 일치하면 delete_ok.jsp로 삭제 처리 요청
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제암호확인</title>
<script>
	function del_go() {
		var frmDel = document.frm;
		//비밀번호 일치여부 확인
		if (frmDel.pwd.value == "${bvo.pwd}") {
			//비밀번호 일치하는 경우 
			var isDelete = confirm("정말 삭제 할까요?");
			if (isDelete) {
				frmDel.submit();
			} else {
				history.back();
			}
		} else {
			//비밀번호 불일치
			alert("비밀번호가 일치하지 않습니다.");
			frmDel.pwd.value = "";
			frmDel.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>

<form action="delete_ok.jsp" method="post" name="frm">
	비밀번호 : <input type="password" name="pwd">
	<input type="button" value="삭제"
			onclick="del_go()">
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">						
</form>

</body>
</html>