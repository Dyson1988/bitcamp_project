<%@page import="com.board.vo.Paging"%>
<%@page import="com.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("conSearch", request.getParameter("conSearch"));
	session.setAttribute("searchData", request.getParameter("searchData"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>



<link rel="stylesheet" href="css/BoardSearchView.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script>
	function listValue(e) {
		var selValue = document.getElementById('listValue').value;
		//document.listValue.action =
		location.href="BoardController?cPage=0&type=boardContentSearch&conSearch=${conSearch}&searchData=${searchData}&selValue="+selValue;
		
		//${paging.setNumPerPage(selectValue)}
		//location.href="BoardController?&type=boardContentSearch&conSearch="+${conSearch}+"&searchData="+${searchData};
		//location.href="zdddd.jsp";
		
		//e.action("BoardController?&type=boardContentSearch&conSearch="+${conSearch}+"&searchData="+${searchData});
		//console.log(e.value);
		//var value = document.createElement("form");
		
		//value.action="BoardController?cPage=0&type=boardContentSearch&conSearch=${conSearch}&searchData=${searchData}";
		//value.action="BoardController?type=boardContentSearch";
		//document.body.appendChild(value);
		//value.submit();
		//console.log(value);
		
		//e.submit();
		
		
	}
</script>
</head>
<body>
<div id="bbs">
<table>
	<caption>검색 게시글 목록</caption>
		<h2>게시글 목록</h2>
	<thead>
		<tr>
			<td colspan="5">
				<select id="listValue" name="listValue" onchange="listValue()">
					<option value="5">5개씩</option>
					<option value="10">10개씩</option>
					<option value="15">15개씩</option>
					<option value="20">20개씩</option>
					<option value="30">30개씩</option>
					<option value="40">40개씩</option>
					<option value="50">50개씩</option>
				</select>
			</td>
		</tr>
		
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
					<h3>입력하신 검색어는  등록된 게시글이 없습니다.</h3>
					
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
			<td colspan="5">
				<ol class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우 --%>
					<c:when test="${paging.beginPage == 1}">
						<li class="disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="BoardController?cPage=${paging.beginPage - 1}&type=boardContentSearch&conSearch=${conSearch}&searchData=${searchData}&selValue=${selValue }">이전으로</a>
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
							<a href="BoardController?cPage=${k}&type=boardContentSearch&conSearch=${conSearch}&searchData=${searchData}&selValue=${selValue }">${k}</a>
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
						<li><a href="BoardController?cPage=${paging.endPage + 1}&type=boardContentSearch&conSearch=${conSearch}&searchData=${searchData}&selValue=${selValue }">다음으로</a></li>
					</c:otherwise>
				</c:choose>
				
				</ol>	
			</td>
			
		</tr>
		<form action="BoardController" method="post">
			<tr>
				<td valgn=bottom colspan="5">
					<select name="conSearch">
						<option value="subCon">제목+내용</option>
						<option value="subject">제목만</option>
						<option value="writer">글작성자</option>
					</select>
					<input type="text" class="search-text" placeholder="검색어를 입력해주세요" name="searchData" value="${searchData }">
					<input type="hidden" name="type" value="boardContentSearch">
					<input type="hidden" name="cPage" value="0">
					<input type="hidden" name="selValue" value="${selValue }">
					<input type="submit" class="search-btn" value="검색">
					
					<input type="button" class="writing" value="글쓰기"
					onclick="javascript:location.href='BoardWriteView.jsp'">
				</td>
			</tr>
		</form>
	</tfoot>
</table>
</div>
</body>
</html>