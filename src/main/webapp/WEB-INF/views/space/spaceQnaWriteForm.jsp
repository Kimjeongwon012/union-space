<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
	.minus {
	    border: 2px solid black;
	    width: 30px;
	    position: absolute;
	    left: 85%;
	    display: flex;
	    margin-top: 5%;
	}
	#loginBtn {
	    width: 15%;
	    background: #F5F6FA;
	    height: 60%;
	    border: 1px solid #D5D5D5;
	    border-radius: 5px;
	    margin-right: 15px;
	}
	#searchBtn {
	    width: 60%;
	    background: #F5F6FA;
	    height: 60%;
	    border: 1px solid #D5D5D5;
	    border-radius: 5px;
	    margin-right: 15px;
	}
	li {
		color: #7E7F7C;
		font-weight: 200;
		font-size: 20px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	p {
		font-size: 25px;
	}
	textarea {
		resize: none;
	}
	.btn-primary {
		width: 150px;
	    height: 50px;
	    font-size: 20px;
	}
</style>
<title>page</title>
</head>
<body>

<header class="navbar navbar-white sticky-top bg-white flex-md-nowrap p-0">
	<div class="container-fluid">
		<div class="row w-100">
			<div class="col-1 justify-content-center d-flex align-items-center text-center">
			    <img src="/resources/images/siteImg/menu.png" id="sideMenuBtn" class="img-fluid rounded-start" alt="..." style="margin-right: 50%; cursor: pointer;">
			</div>
			<div class="col-7">		
			    <img src="/resources/images/siteImg/unionSpaceLogo.png" id="logo" alt="..." style="left: 57%;position: relative;">
			</div>
			<div class="col-4 justify-content-center d-flex align-items-center text-center">
			    <input id="searchBtn" type="text" placeholder=" 장소 및 모임 검색">
			    <button id="loginBtn" style="font-size: 20px;font-weight: 700;">로그인</button>
			    <img src="/resources/images/siteImg/mypage.png" id="logo" class="img-fluid rounded-start" alt="...">
			</div>
		</div>
	</div>
</header>

<div class="container-fluid">
  <div class="row">
    <main style="background:#F5F6FA;height: 1250px;">
        <div id="sidebarMenu" style="background:white;position: absolute;left: -15px;" class="col-md-3 col-lg-2">
	    	<div class="position-sticky pt-3" style="padding-left: 30px;">
	    		<h1 class="lato-bold">Menu</h1>
	    		<div class="bg-black" style="width: 20%;height: 7px;"></div>
	    		<br/>
				<div class="nav flex-column" style="display: flex; flex-direction: column;">
				    <h3 class="lato-bold">Union Space</h3>    			
					<div class="minus"></div>
				</div>
	    		<hr/>
	    		<ul class="nav flex-column">
					<li class="lato-light">
		    			문의
		    		</li>
	    		</ul>
		    	<br/>
	 			<div class="nav flex-column" style="display: flex; flex-direction: column;">
		    		<h3 class="lato-bold">Search</h3>
		    		<div class="minus"></div>
	    		</div>
	    		<hr/>
	    		<ul class="nav flex-column">
	    			<li class="lato-light">
	    				장소 찾기
	    			</li>
					<li class="lato-light">
		    			모임 찾기
		    		</li>
	    		</ul>
	    	</div>
	    </div>
	    <br/>
	    <div class="row gx-5 pb-4">
	    	<div class="col-2"></div>
			<div class="col-9">
				<div class="row">
					<h2 style="font-weight: bold;">질문 작성해주세요</h2>
					<hr/>
				</div>
				<div class="row">
					<div class="col-2">
						<p>작성자</p>
					</div>
					<div class="col-10">
						<p>${writer.user_id}</p>
					</div>	
				</div>
				<div class="row">
					<div class="col-2">
						<p>작성 일시</p>
					</div>
					<div class="col-10">
						<p>${write_date}</p>
					</div>	
				</div>
				<div class="row">
					<div class="col-2">
						<p>문의 내용</p>
					</div>
					<div class="col-10">
						<textarea placeholder="문의하실 내용을 작성해주세요" class="form-control" id="question_content" style="height: 300px"></textarea>
					</div>
				</div>
			</div>
			<div class="col-1"></div>			
		</div>
		<br/>
		<div class="row gx-5 pb-4">
			<div class="col-2"></div>
			<div class="col-9" style="display: flex; justify-content: center;">
			<form name="write" action="/space/writeQnaForm.do" method="POST">
				<input type="hidden" name="space_no" value="${space_no}"/>
				<input type="hidden" name="question_content" value=""/>
				<button id="qnaWriteBtn" type="button" class="btn btn-primary">작성하기</button>
			</form>
			<form name="home" action="/main/main" method="GET">
				<button type="submit" class="btn btn-primary" style="margin-left: 15px;">나가기</button>
			</form>
			</div>
			<div class="col-1"></div>
		</div>
    </main>
  </div>
</div>
</body>
<script>
    $('#sideMenuBtn').click(function() {
        $('#sidebarMenu').toggle(); // 사이드 메뉴 숨기기
    });
    $('#qnaWriteBtn').click(function() {
    	if ($('#question_content').val() == '') {
    		alert('질문 내용을 작성해주세요');
    	} else {    		
	    	$('input[name="question_content"]').val($('#question_content').val());
			$('form[name="write"]').submit();
    	}
	});
</script>
</html> 