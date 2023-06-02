<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin.css">
    <title>BookMate</title>
</head>

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
                <h1>회원목록</h1>
                <br>
                <div class="content2">
                    <table class="board" id="board">
                    <caption>
						<form action="" id="setRows">
							<p><input type="hidden" name="rowPerPage" value="15"></p>
						</form>
						</caption>
						
						
            
                    	<thead>
	                        <tr class="small-text">
	                            <th>이름</th>
	                            <th>ID</th>	                          
	                            <th>이메일</th>
	                            <th>주소</th>
	                            <th>전화번호</th>
	                            <th>생일</th>
	                            <th>가입일</th>
	                            <th>삭제</th>
	                        </tr>
	                    </thead>
	                    <tbody>
							<c:forEach items="${ml}" var="mlist">
								<tr class="small-text">
									<td>${mlist.name}</td>
									<td>${mlist.id}</td>
									<td>${mlist.email}</td>
									<td>${mlist.address}</td>
									<td>${mlist.mobile}</td>
									<td>${fn:substring(mlist.birth,2,10)}</td>
									<td>${fn:substring(mlist.regdate,2,10)}</td>
									<td><input type="button" id="btnDel" name="${mlist.id}" value="삭제"></td>
								</tr>
								
								</tr>
							</c:forEach>

						</tbody>
                    </table>
                </div>
               
            </div>
            
        </div>
		
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document)
.on('click','#btnDel',function(){
   
   
   let a = $(this).attr('name');
   
   
   $.ajax({
       url: "/memberDel",
       type: "post",
       dataType: "text",
       data: { id: a },
       success: function(data) {
         if (data == "ok") {
           
           location.reload()
         } else {
           alert("delete 실패")
         }
       } 
     });
})

/*  페이지네이션  */
var $setRows = $('#setRows');

$setRows.submit(function (e) {
	e.preventDefault();
	var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

//		console.log(typeof rowPerPage);

	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	if (!rowPerPage) {
		alert(zeroWarning);
		return;
	}
	$('#nav1').remove();
	var $board = $('#board');

	$('#board').after(' <div id="nav1">');


	var $tr = $('tbody tr');
	var rowTotals = $tr.length;
//	console.log(rowTotals);

	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>')
				.attr('rel', i)
				.html(i + 1)
				.appendTo('#nav1');
	}

	$tr.addClass('off-screen')
			.slice(0, rowPerPage)
			.removeClass('off-screen');

	var $pagingLink = $('#nav1 a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');

		// 0 => 0(0*4), 4(0*4+4)
		// 1 => 4(1*4), 8(1*4+4)
		// 2 => 8(2*4), 12(2*4+4)
		// 시작 행 = 페이지 번호 * 페이지당 행수
		// 끝 행 = 시작 행 + 페이지당 행수

		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});

	$pagingLink.filter(':first').addClass('active');

});


$setRows.submit();



</script>

</html>