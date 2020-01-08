<%@page import="com.board.vo.Paging"%>
<%@page import="com.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/board.css">
</head>
<body>
<div id="bbs">
<table>
	<caption>게시글 목록</caption>
	<thead>
		<tr class="title">
			<th class="no">번호</th>
			<th class="subject">제목</th>
			<th class="writer">글쓴이</th>
			<th class="regdate">날짜</th>
			<th class="hit">조회수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="5">
					<h2>현재 등록된 게시글이 없습니다.</h2>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.b_idx }</td>
					<td>
						<a href="BoardController?b_idx=${vo.b_idx}&cPage=${paging.nowPage}&type=boardContent">
							${vo.subject }
						</a>
					</td>
					<td>${vo.writer }</td>
					<td>${vo.write_date.substring(0, 10) }</td>
					<td>${vo.hit }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
	
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${paging.beginPage == 1}">
						<li class="disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="BoardController?cPage=${paging.beginPage - 1}&type=boardAllList">이전으로</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<%-- 블록내에 표시할 페이지 표시(시작페이지~끝페이지) --%>
				<c:forEach var="k" begin="${paging.beginPage }" end="${paging.endPage }">
				<c:choose>
					<c:when test="${k == paging.nowPage}">
						<li class="now">${k }</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="BoardController?cPage=${k}&type=boardAllList">${k}</a>
						</li> 
					</c:otherwise>
				</c:choose>
				</c:forEach>
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 
						endPage가 전체페이지 수보다  크거나 같으면 --%>
					<c:when test="${paging.endPage >= paging.totalPage }">
						<li class="disable">다음으로</li>
					</c:when>
					<c:otherwise>
						<li><a href="BoardController?cPage=${paging.endPage + 1}&type=boardAllList">다음으로</a></li>
					</c:otherwise>
				</c:choose>
				</ol>	
			</td>
			<td>
				<input type="button" value="글쓰기"
					onclick="javascript:location.href='BoardWriteView.jsp'">
			</td>
		</tr>
	</tfoot>
</table>
</div>
</body>
</html>