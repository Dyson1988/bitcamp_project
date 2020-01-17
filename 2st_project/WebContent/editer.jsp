<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   $(document).ready(function () {
       $('.editorHTMLDIV').hide();
   });
    
   //HTML코드로 보기
   function convertToHTML() {
       $('.editorHTMLDIV').text($('.editorDIV').html());
       $('.editorHTMLDIV').show();
       $('.editorDIV').hide();
   }
    
   //에디터 화면으로 보기
   function convertToEditor() {
       $('.editorDIV').html($('.editorHTMLDIV').text());
       $('.editorDIV').show();
       $('.editorHTMLDIV').hide();
   }
</script>
</head>
<body>
   <div class="buttons">
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
   </div>
   <div>
      <div class="editorDIV" contenteditable="true"></div>
      <div class="editorHTMLDIV"></div>
   </div>
   <div class="buttons">
      <input type="button" value="에디터로 보기" onclick="convertToEditor()" /> <input
         type="button" value="HTML로 보기" onclick="convertToHTML()" />
   </div>



</body>
</html>