<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="css/board.css">
	<title>BookMate</title>
</head>
<style>

/* 추가부분 */
.content {
    width:100%;
    height:700px;
  
}
.content_A {
    width:95%;
    height:100%;
    text-align: center;
    margin-left: auto;
    margin-right:auto;
}
.content2 {
    width:95%;
    height:400px;
    text-align: left;
   
    /* border: 1px solid red; */
}
.table-striped {
    margin: auto;

}
.hr {
    
    background-color: gray;
   
}
.table-striped {
        width: 60%;
        border-collapse: collapse;
    }
    
    /* 테이블 셀 스타일 */
    .table-striped td {
        padding: 10px;
        /* border: 1px solid #ccc; */
    }
    
    /* 입력 필드 스타일 */
    .form-control {
        width: 98%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    
    /* 텍스트 에어리어 스타일 */
    textarea.form-control {
        resize: vertical;
    }
     /* 뉴 버튼 스타일 */
     .button {
        text-align: right;
    }
    
    .button input[type="submit"],
    .button input[type="button"] {
        padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
    }
    
    .button input[type="submit"] {
        background-color: #7ca8c2;
    }
    
    .button input[type="button"] {
        background-color: #7ca8c2;
    }
  
</style>
<body>
    <div class="main">
       <div class="logo">
    	<img src="/img/logo.png" class="logoImg">
    </div>
    <div class="menu">
        <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
    </div>
    
    <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
    <div class="category">
    	<ul class="category_ul"  id="nav">
			<li class="category_li"><a href="/category1">코미디</a></li>
			<li class="category_li"><a href="/category2">로맨스</a></li>
			<li class="category_li"><a href="/category3">판타지</a></li>
			<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li>
			<li class="category_li"><a href="/category5">드라마/가족</a></li>
            <li class="category_li"><a href="/donation">기부앤테이크<i class='dropDown'></i></a>
            	<ul>
              		<li class="category_li_sub"><a href="/donation">기부앤테이크 안내</a></li>
              		<li class="category_li_sub"><a href="/donation-submit" id=donation-submit>기부앤테이크 신청</a></li>
              		<li class="category_li_sub"><a href="/donation-state">기부앤테이크 현황</a></li>
              	</ul>
            </li>
             
            <li class="category_li">
            	<div class="search">
                	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img">
                </div>
            </li>
		</ul>
	</div>



        
       <div class="content">
            
            <div class="content_A">
                <br>
                
                <h1>문의하기</h1>
                
            <hr><br><br>
            <div class="content2">
                <table class="table-striped">
                 <form action="boardNewa" method="get" >
                    <tr>
                        
                        <td><input type="text"  class="form-control" name="ID" id="ID" placeholder="작성자"></td>
                    </tr>
                    <tr>
                       
                        <td><input type="text"  class="form-control" name="B_title" id="B_title" placeholder="제목을 입력해 주세요."></td>
                    </tr>
                    
                         <tr> 
                    
                        <td><textarea id="summernote" name="summernote"></textarea></td>
                    </tr>
                    <tr>

                    <tr>
                        
                        <td colspan="2"  class="button" >
                            <input type="submit" value="문의접수" class="btnInsert" id="btnInsert">
                            <input type="button" value="취소" class="btnCancle" id="btnCancle">
                            
                        </td>
                    </tr>
                    </form>
                </table>
            </div>
            </div>
            
        </div>

    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="summernote/summernote-lite.css">
<script>
$(document)
.ready(function() {
   $('#summernote').summernote({
        height: 350,                 
        width: 650,         
        focus: true,                  
        lang: "ko-KR",               
        placeholder: '<br>내용을 입력하시오. <br> 최대 2000자까지 입력할 수 있습니다', 
        toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['image',['picture']]
           ],
           fontNames: 
              ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        
    })          
 })

.on('click','#btnCancle',function(){
	document.location='/board';
})
</script>
</html>