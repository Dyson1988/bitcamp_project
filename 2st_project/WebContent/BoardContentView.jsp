<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
	//데이터를 게시글 수정에서 사용할 수 있도록 session scope에 등록한다.
	session.setAttribute("bvo", request.getAttribute("bvo"));
	pageContext.setAttribute("cPage", request.getParameter("cPage"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<link rel="stylesheet" href="css/board.css">
<script>
	function modify_go() {
		document.frm.action = "BoardContentModifyView.jsp";
		document.frm.submit();
	}	
	function delete_go() {
		document.frm.action = "BoardContentDeleteView.jsp";
		document.frm.submit();
		
	}
	function list_go() {
		location.href = "BoardController?cPage=${cPage}&type=boardAllList";
	}
</script>
</head>
<body>
<div id="bbs">
<%--게시글 내용 표시 --%>
<form method="get" name="frm">
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${bvo.subject }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${empty bvo.file_name }">
						첨부파일 없음
					</c:if>
					<c:if test="${not empty bvo.file_name }">
						<a href="download.jsp?f_name=${bvo.file_name }">${bvo.file_name }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bvo.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<pre>${bvo.content }</pre>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go()">
					<input type="button" value="삭제" onclick="delete_go()">
					<input type="button" value="목록" onclick="list_go()">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="hidden" name="b_idx" value="${bvo.b_idx }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
<hr>

<%--댓글 입력 폼 --%>
<form method="post" action="ans_write_ok.jsp">
	<p>이름 : <input type="text" name="writer"></p>
	<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
	<p>비밀번호 : <input type="password" name="pwd"></p>
	<input type="submit" value="댓글저장">
	
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">
	<input type="hidden" name="cPage" value="${cPage }">
</form>

<%--댓글 출력(동적 태그 작성) --%>
<hr>
댓글들
<hr>

<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form action="ans_del.jsp" method="post">
		<p>이름 : ${commVO.writer }</p>
		<p>날짜 : ${commVO.write_date }</p>
		<p>내용 : ${commVO.content }</p>
		<input type="submit" value="댓글삭제">
		
		<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		<input type="hidden" name="pwd" value="${commVO.pwd }">
		
		<%--삭제처리 후 게시글 상세페이지로 이동시 사용 --%>
		<input type="hidden" name="b_idx" value="${commVO.b_idx }">
	</form>
</div>
</c:forEach>

</div>
</body>
</html>