<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/7388a2e534.js"crossorigin="anonymous"></script>
<link id="font-awesome-5-kit-css"
	href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-shims.min.css"
	rel="stylesheet" media="all">
<link id="font-awesome-5-kit-css"
	href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-font-face.min.css"
	rel="stylesheet" media="all">
<link id="font-awesome-5-kit-css"
	href="https://kit-free.fontawesome.com/releases/latest/css/free.min.css"
	rel="stylesheet" media="all">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="css/Wysiwyg.css" rel="stylesheet" type="text/css">

<title>글쓰기 - 게시판</title>
</head>
<body>
	<div class="container">
		<div class="row style"> <!--  -->
			<div class="col-12">
				<h1>
				///Mpower<br><span>글쓰기 게시판 입니다.</span>
				</h1> 
			</div>
			
			<div class="row style">
				<ul class="style-wrap row"> <!-- 툴바 시작 -->
					<br>
					<div class="title">
						<label for="title_name">제목</label>
						<input type="text" name="title_name" id="title_name" class="form-control" required />
					</div>
					<hr>
					<li>
						<div class="input-group">
							<form action="#">
								<div class="form-group">
									<select class="form-control" id="sel1" name="sellist1">
										<option>글꼴</option>
										<option>돋움</option>
										<option>바탕</option>
										<option>고딕</option>
									</select>
								</div>
							</form>
						</div>
					</li>
					
					<li> <!-- font size 부분 -->
						<div class="input-group">
							<form action="#">
								<div class="form-group">
									<select class="form-control" id="sel1" name="sellist1">
										<option>12pt</option>
										<option>22pt</option>
										<option>32pt</option>
										<option>42pt</option>
									</select>
								</div>
							</form>
						</div>
					</li>
					<div> <!-- bold, Italic, Underline, StrikeThrough -->
						<ol class="text-style">
							<div class="bold" name="bold">
								<button type="button" class="bold" onclick="document.execCommand('bold')">가</button>
							</div>
							
							
							<li class="underline" onclick="document.execCommand('Underline')"><span>가</span></li>
							<li class="italic" onclick="alert('야');"><span>가</span></li>
							<li class="lineThrough"><span>가</span></li>
							<li class="color"><span>가</span></li>
							<li class="bgcolor"><span>가</span></li>
						</ol>
					</div>
					<li>
						<ol class="p-style">
							<li class="left"><i class="fas fa-align-left"
								aria-hidden="true"></i></li>
							<li class="center"><i class="fas fa-align-center"
								aria-hidden="true"></i></li>
							<li class="right"><i class="fas fa-align-right"
								aria-hidden="true"></i></li>
						</ol>
					</li>
					<li>
						<ol>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle"
								id="dropdownMenuButton" aria-expanded="false"
								aria-haspopup="true" type="button" data-toggle="dropdown">
								<!-- 이미지 -->
								<i class="fas fa-images" aria-hidden="true"></i>

							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#" onclick="location.href='popUpView.jsp'">이미지 첨부</a> <a
									class="dropdown-item" href="#">동영상 첨부</a> <a
									class="dropdown-item" href="#">성구의 모든것</a>
							</div>
						</div>
						<li class="images"><i class="fas fa-file" aria-hidden="true"></i></li>
						<li class="images"><i class="fa fa-link" aria-hidden="true"></i></li>
						</ol>
					</li>
					
				</ul> <!-- 툴바 종료 -->
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="message-wrapper">
					<div class="message-text" id="message-text" contenteditable="true">
						<img alt="" src="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<input type="submit" name="view" value="미리보기">
		<input type="submit" name="save" value="저장">
	</div>
	
	
	
	
	
	<!-- -------======================================== -->
	<hr>
	<hr>
	<br>
	<br>

	<div class="buttons">
	<li>
		<input type="button" class="BOLD" value="B"
			onclick="document.execCommand('bold')" /> <input type="button"
			class="ITALIC" value="Italic"
			onclick="document.execCommand('Italic')" /> <input type="button"
			class="UNDERBAR" value="abc"
			onclick="document.execCommand('Underline')" /> <input type="button"
			class="BAR" value="abc"
			onclick="document.execCommand('StrikeThrough')" /> <input
			type="button" class="aignLeft" value="왼쪽 정렬"
			onclick="document.execCommand('justifyleft')" /> <input
			type="button" class="aignCenter" value="가운데 정렬"
			onclick="document.execCommand('justifycenter')" /> <input
			type="button" class="aignRight" value="오른쪽 정렬"
			onclick="document.execCommand('justifyright')" />
	</li>
	</div>
	<div>
		<!-- 여기가 글 써지는 부분 시작 -->
		<div class="editorDIV" contenteditable="true" placeholder="질문을 입력하세요.">
		</div>
		<div class="editorHTMLDIV"></div>
		<!-- 여기가 글 써지는 부분 종료 -->
	</div>
	<div class="buttons">
		<input type="button" value="에디터로 보기" onclick="convertToEditor()" /> <input
			type="button" value="HTML로 보기" onclick="convertToHTML()" />
	</div>
</body>
</html>















