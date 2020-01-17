<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Multiple File Upload</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script>
var editBtn = document.getElementById('editBtn');
var editables = document.querySelectorAll('#title, #author, #content');

if (typeof(Storage) !== "undefined") {
  if (localStorage.getItem('title') !== null) {
    editables[0].innerHTML = localStorage.getItem('title');
  }
  if (localStorage.getItem('author') !== null) {
    editables[1].innerHTML = localStorage.getItem('author');
  }
  if (localStorage.getItem('content') !== null) {
    editables[2].innerHTML = localStorage.getItem('content');
  }
}

editBtn.addEventListener('click', function(e) {
  if (!editables[0].isContentEditable) {
    editables[0].contentEditable = 'true';
    editables[1].contentEditable = 'true';
    editables[2].contentEditable = 'true';
    editBtn.innerHTML = 'Save Changes';
    editBtn.style.backgroundColor = '#6F9';
  } else {
    // Disable Editing
    editables[0].contentEditable = 'false';
    editables[1].contentEditable = 'false';
    editables[2].contentEditable = 'false';
    // Change Button Text and Color
    editBtn.innerHTML = 'Enable Editing';
    editBtn.style.backgroundColor = '#F96';
    // Save the data in localStorage 
    for (var i = 0; i < editables.length; i++) {
      localStorage.setItem(editables[i].getAttribute('id'), editables[i].innerHTML);
    }
  }
});
</script>
    <style type="text/css">

        input[type=file] {
            display: none;
        }

        .my_button {
            display: inline-block;
            width: 200px;
            text-align: center;
            padding: 10px;
            background-color: #006BCC;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }



        .imgs_wrap {

            border: 2px solid #A8A8A8;
            margin-top: 30px;
            margin-bottom: 30px;
            padding-top: 10px;
            padding-bottom: 10px;

        }
        .imgs_wrap img {
            max-width: 150px;
            margin-left: 10px;
            margin-right: 10px;
        }

    </style>

    <script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
    <script type="text/javascript">

        // 이미지 정보들을 담을 배열
        var sel_files = [];


        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgFileSelect);
        }); 

        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
        }

        function handleImgFileSelect(e) {

            // 이미지 정보들을 초기화
            sel_files = [];
            $(".imgs_wrap").empty();

            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            var index = 0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }

                sel_files.push(f);

                var reader = new FileReader();
                reader.onload = function(e) {
                    var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                    $(".imgs_wrap").append(html);
                    index++;

                }
                reader.readAsDataURL(f);
                
            });
        }



        function deleteImageAction(index) {
            console.log("index : "+index);
            console.log("sel length : "+sel_files.length);

            sel_files.splice(index, 1);

            var img_id = "#img_id_"+index;
            $(img_id).remove(); 
        }

        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
        }

        function submitAction() {
            console.log("업로드 파일 갯수 : "+sel_files.length);
            var data = new FormData();

            for(var i=0, len=sel_files.length; i<len; i++) {
                var name = "image_"+i;
                data.append(name, sel_files[i]);
            }
            data.append("image_count", sel_files.length);
            
            if(sel_files.length < 1) {
                alert("한개이상의 파일을 선택해주세요.");
                return;
            }           

            var xhr = new XMLHttpRequest();
            xhr.open("POST","./study01_af.php");
            xhr.onload = function(e) {
                if(this.status == 200) {
                    console.log("Result : "+e.currentTarget.responseText);
                }
            }

            xhr.send(data);

        }

    </script>
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

<div>
        <h2><b>이미지 미리보기</b></h2>
        <div class="input_wrap">
            <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
            <input type="file" id="input_imgs" multiple/>
        </div>
    </div>

    <div>
        <div class="imgs_wrap">
            <img id="img" />
        </div>
    </div>

    <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a>
    
    
    
    
<div class="buttons">
    <input type="button" class="BOLD" value="B" onclick="document.execCommand('bold')" />
    <input type="button" class="ITALIC" value="Italic" onclick="document.execCommand('Italic')" />
    <input type="button" class="UNDERBAR" value="abc" onclick="document.execCommand('Underline')" />
    <input type="button" class="BAR" value="abc" onclick="document.execCommand('StrikeThrough')" />
    <input type="button" class="aignLeft" value="왼쪽 정렬" onclick="document.execCommand('justifyleft')" />
    <input type="button" class="aignCenter" value="가운데 정렬" onclick="document.execCommand('justifycenter')" />
    <input type="button" class="aignRight" value="오른쪽 정렬" onclick="document.execCommand('justifyright')" />
</div>
<div>
    <div class="editorDIV" contenteditable="true">
     </div>
    <div class="editorHTMLDIV">
    </div>
</div>
<div class="buttons">
    <input type="button" value="에디터로 보기" onclick="convertToEditor()" />
    <input type="button" value="HTML로 보기" onclick="convertToHTML()" />
</div>


</body>
</html>