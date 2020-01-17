<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
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
		location.href = "BoardController?cPage=${cPage}&type=boardAllList&selValue=${selValue}";
	}
	$().ready(function(){
		     var value10 = "<c:out value="${replyDiv }" />";
		
		 $("input[name='reply']").click(function(){
		     //var value = '<c:out value="${commVO.step }"/>'
		     var value = '<c:out value="${replyDiv }"/>';
		     var value1 = ${replyDiv }
		     //var value2 = '${commVO.step }';

		     console.log(value);
		     console.log(value1);
		     //console.log(value2);
		    
		     console.log("a : " + value10);
		     
	         $("value1").toggle("fast");
	         //$("#2").toggle("fast");
	     });
	});
	function replyView(frm) {
		var re = frm.step.value;
		$("#"+re).toggle("fast");
	}
	
	function replyOpen(frm) {
		var re = frm.step.value;
		$("#"+re).toggle("fast");
		$("input[name='reply']").toggle("fast");
		//$("#reClose").toggle("fast");
		console.log("re : " + re);
	}
	function replyClose(frm) {
		var re = frm.step.value;
		$("#"+re).toggle("fast");
		$("#"+re).toggle("fast");
		$("#reOpen").toggle("fast");
		//$("#reClose").toggle("fast");
		console.log("re : " + re);
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

<%--댓글 입력 폼                                        댓긁ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ                                          

--%>
<form method="post" action="BoardController?type=boardAnsWrite">
	<p>이름 : <input type="text" name="writer"></p>
	<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
	<p>비밀번호 : <input type="password" name="pwd"></p>
	<c:if test="${empty c_list }"> <!-- 댓글이 없을시 step:0, lev:0 -->
		<input type="hidden" name="step" value="0">
		<input type="hidden" name="lev" value="0">
	</c:if>
	<c:if test="${stepResult >= 1 }">
		<input type="hidden" name="step" value="${stepResult}">
		<input type="hidden" name="lev" value="0">
	</c:if>
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">
	<input type="hidden" name="cPage" value="${cPage }">
	<input type="submit" value="댓글저장">
</form>

<%--댓글 출력(동적 태그 작성) --%>
<hr>
댓글들
<hr>

<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form action="BoardController?type=boardAnsDelete" method="post">
		<c:if test="${commVO.lev == 0 }">
			<p>이름 : ${commVO.writer }</p>
			<p>날짜 : ${commVO.write_date }</p>
			<p>내용 : ${commVO.content }</p>
			<input type="hidden" name="b_idx" value="${commVO.b_idx }">
			<input type="hidden" name="pwd" value="${commVO.pwd }">
			<input type="hidden" name="step" value="${commVO.step }">
			<input type="hidden" name="lev" value="${commVO.lev }">
			<input type="hidden" name="cPage" value="${cPage }">
			<input type="hidden" name="selValue" value="${selValue }">
			<input type="submit" value="댓글삭제">
			
			<input type="button" name="reOpen" value="답글" onclick="replyView(this.form)">
		</c:if>
	</form>
	
	<form action="BoardController?type=boardAnsDelete" method="post">
		<c:if test="${commVO.lev >= 1 }">
				<p>&nbsp;&nbsp; ㄴ 이름 : ${commVO.writer }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜 : ${commVO.write_date }</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용 : ${commVO.content }</p>
				<input type="hidden" name="b_idx" value="${commVO.b_idx }">
				<input type="hidden" name="step" value="${commVO.step }">
				<input type="hidden" name="lev" value="${commVO.lev }">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="selValue" value="${selValue }">
				<input type="submit" value="댓글삭제">
				<input type="button" name="reOpen" value="답글" onclick="replyView(this.form)">
		</c:if>
	</form>
	
		<div id="${commVO.step}" style="display:none">
			<form action="BoardController?type=boardAnsReply" method="post">
				<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
				<input type="hidden" name="writer" value="${commVO.writer }">
				<input type="hidden" name="write_date" value="${commVO.write_date }">
				<input type="hidden" name="pwd" value="${commVO.pwd}">
				<input type="hidden" name="b_idx" value="${commVO.b_idx }">
				<input type="hidden" name="step" value="${commVO.step }">
				<input type="hidden" name="lev" value="${commVO.lev }">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="selValue" value="${selValue }">
				<input type="submit" value="답글저장">
			</form>
		</div>
	
</div>
</c:forEach>

<!--   기존 폼 백업
<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form action="BoardController?type=boardAnsDelete" method="post">
		<p>이름 : ${commVO.writer }</p>
		<p>날짜 : ${commVO.write_date }</p>
		<p>내용 : ${commVO.content }</p>
		<input type="hidden" name="b_idx" value="${commVO.b_idx }">
		<input type="hidden" name="pwd" value="${commVO.pwd }">
		<input type="hidden" name="step" value="${commVO.step }">
		<input type="hidden" name="lev" value="${commVO.lev }">
		<input type="hidden" name="cPage" value="${cPage }">
		<input type="hidden" name="selValue" value="${selValue }">
		<input type="submit" value="댓글삭제">
		
		<input type="button" name="reOpen" value="답글" onclick="replyView(this.form)">      -->
		 
		<!-- 
		<div id="${commVO.step}">
			<input type="button" name="reOpen" value="답글" onclick="replyOpen(this.form)">
		</div>
		<div id="${commVO.step}" style="display:none">
			<input type="button" name="reClose" value="답글취소" onclick="replyClose(this.form)">
		</div>
		 -->
		 <!--
	</form>
	
		<div id="${commVO.step}" style="display:none">
			<form action="BoardController?type=boardAnsReply" method="post">
				<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
				<input type="hidden" name="writer" value="${commVO.writer }">
				<input type="hidden" name="write_date" value="${commVO.write_date }">
				<input type="hidden" name="pwd" value="${commVO.pwd}">
				<input type="hidden" name="b_idx" value="${commVO.b_idx }">
				<input type="hidden" name="step" value="${commVO.step }">
				<input type="hidden" name="lev" value="${commVO.lev }">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="selValue" value="${selValue }">
				<input type="submit" value="답글저장">
			</form>
		</div>
	
</div>
</c:forEach>  -->

</div>
</body>
</html>