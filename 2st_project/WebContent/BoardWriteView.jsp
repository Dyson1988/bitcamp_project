<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완벽한듯 완벽하지 못한(?) 게시판</title>
<link rel="stylesheet" type="text/css" href="css/YM.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  
</head>
<body>
<h2>게시판 만들기(연문)</h2>
	
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" title="제목" placeholder="제목을 입력하세요">
			</td>
		</tr>
		<table>
		<tr>
			<th>이름</th>
			<td colspan="5"><input type="text" name="name" title="이름" placeholder="이름을 입력하세요">
			</td>
		</tr>
		
		<tr>		
			<th rowspan="4">내용</th>
		<tr>
				<td class="font-size"><select id="font-size" name="font-size">
				<option value="크기">크기</option>
				<option value="16">16</option>
				<option value="18">18</option>
				<option value="20">20</option>
				<option value="22">22</option>
				<option value="24">24</option>
				</select></td>
	       		<td class="font-weight"><button type="button" id="thickness"><img src="images/btn_n_bold.gif"></button></td>
	       		<td class="font-decoration"><button type="button" id="underline"><img src="images/btn_n_underline.gif"></button></td>
	       		<td class="font-style"><button type="button" id="italic"><img src="images/btn_n_Italic.gif"></button></td>
	        	<td class="alignleft"><button type="button" id="alignleft">
	        	<img src="images/btn_n_alignleft.gif"></button>
	        	</td>
	        	<td class="aligncenter"><button type="button" id="aligncenter"><img src="images/btn_n_aligncenter.gif"></button></td>
	        	<td class="alignright"><button type="button" id="alignright"><img src="images/btn_n_alignright.gif"></button></td>
	       		<td class="color"><select id="color" name="color">
	       			<option value="글자색">글자색</option>
					<option value="black">검정</option>
	       			<option value="yellow">노랑</option>
	        		<option value="red">빨강</option>
	        		<option value="blue">파랑</option>
	        		<option value="coral">코랄</option>
	       			<option value="lightblue">담청색</option>
	       			<option value="khaki">카키</option>
	       			<option value="pink">핑크</option>
	     	</select>
	       	</td>
	       	<td class="background-color">
	       		<select id="background-color" name="background-color">
	       			<option value="배경색">배경색</option>
	       			<option value="white">하얀</option>
					<option value="yellow">노랑</option>
	       			<option value="red">빨강</option>
	       			<option value="blue">파랑</option>
	       			<option value="coral">코랄</option>
	       			<option value="lightblue">담청색</option>
	       			<option value="khaki">카키</option>
	       			<option value="pink">핑크</option>
	       		</select>
	       	</td>
	    </tr>	
	         <tr>
	         <td colspan="9">
	         	<textarea id="ymcontent" name="content" rows="8" cols="50"
				title="내용">대한민국</textarea>
	       	</td>
	        </tr>
	       		
	       		<tr>
 				
					<!-- 이것저것 버튼 생성, 버튼을 눌렀을시, 글씨 굵게  등 기능구현하기~~ -->
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
					<input type="password" name="password">
				</td>
			</tr>
		</table>
		<script>
	var ss = false;	
		
	$( "#font-size" ).change(function() {

		$('#ymcontent').css('font-size', parseInt($("#font-size option:selected").val()));

	});
	
	$( "#thickness").click(function() { //boldTrigger being the element initiating the trigger
	   
		$("#ymcontent").toggleClass("bold");  //text being the element to where applied to it.
		
	});
	
	$( "#italic").click(function() {

		$('#ymcontent').toggleClass('italic');
		
	});
	
	$( "#underline").click(function() {

		$('#ymcontent').toggleClass('underline');
		
	});

	$().ready(function(){
		
	    $("#alignleft").on('click', function(){
	    	
           $("#ymcontent").removeClass("aligncenter");  //분기처리를 위한 removeClass
           $("#ymcontent").removeClass("alignright"); 
           $("#ymcontent").addClass("alignleft"); //Class 추가
        });
	});
	
	$().ready(function(){
		
	    $("#aligncenter").on('click', function(){
	    	
           $("#ymcontent").removeClass("alignleft"); 
           $("#ymcontent").removeClass("alignright"); 
           $("#ymcontent").addClass("aligncenter"); 
        });
	});

	
	$( "#alignright").click(function() {
	
		$('#ymcontent').toggleClass('alignright');
	
	});
	
	$( "#color").change(function() {
		
		$('#ymcontent').css('color', $("#color option:selected").val());
		
	});
	
	$( "#background-color").change(function() {
		
		$('#ymcontent').css('background-color', $("#background-color option:selected").val());
		
	});

</script>
</body>
</html>