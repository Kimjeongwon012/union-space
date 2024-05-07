<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.twbsPagination.js"></script>
<title>문의글 작성</title>
</head>
<body>
<header class="header">
	<div class="logo">
		<a href="/home">
			<img src="/resources/images/siteImg/logo.png" class="logo-img2">
		</a>
</div>

<div class="search-box">
			<input type="text" placeholder="장소 및 모임을 입력하세요">
			<button class="search-btn">검색</button>
		</div>
<div style="display: flex; align-items: center;">
		<div>
			<button class="login-btn">로그인</button>
		</div>
		<div class="mypage-link">
			<a href="/mypagemain">
				<img src="/resources/images/siteImg/mypage.png" class="logo-img">
			</a>
		</div>
</div>
</header>

<div class="container-fluid">
	<div class="row">
		<!-- 사이드바 메뉴 -->
	<nav class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse">
	<div class="position-sticky pt-3" >
		<h1>Menu</h1>
		<div class="bg-black" style="height: 2px"></div>
		<br/>
		<h3>Union Space</h3>
		<hr/>
		<ul class="nav flex-column">
			<li class="nav-item">
				<a href="/home">Union Space</a>
			</li>
			<li class="nav-item">
				<a href="/member/qna/list">문의 게시판</a>
			</li>
		</ul>
		<br/>
		<h3>Search</h3>
		<hr/>
		<ul class="nav flex-column">
			<li class="nav-item">
				<a href="/searchResult.go">장소 및 모임 찾기</a>
			</li>
		</ul>
		<br/>
		<h3>MyPage</h3>
		<hr/>
		<ul class="nav flex-column">
			<li class="nav-item">
				<a href="/mypagemain">현재 예약 현황</a>
			</li>
			<li class="nav-item">
				<a href="/reservation/get.do">예약 내역 조회</a>
			</li>
			<li class="nav-item">
				<a href="/point/list.do">포인트 내역 조회</a>
			</li>
			<li class="nav-item">
				<a href="/userinfo">회원 정보 조회</a>
			</li>
			<li class="nav-item">
				<a href="/userInfoOut">회원 탈퇴</a>
			</li>
		</ul>
	</div>
	</nav>
	<!-- 사이드바 메뉴_End -->

	
	<!-- 페이지 내용 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="pagetitle">
		<h1>문의글 작성</h1>
	</div>
	
	<!-- 등록 form -->
	<form id="QnawriteForm" action="/member/qna/register" method="post" class="row g-3">
	<div class="container-md">
		<div class="row gx-5 pb-3">
			<div class="col-1">글제목</div>
			<div class="col-6">
				<div class="input-group">
					<input type="text" id="title_input" name="qna_title" class="form-control" readonly>
				</div>
			</div>
 		</div>
		<div class="row gx-5 pb-3">
			<div class="col-md-1">작성자</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="writer_input" >
			</div>
			<div class="col-md-1" style="width:150px">작성 날짜</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="registDate_input" readonly>
			</div>
 		</div>
 		
		<div class="row gx-5 pb-3">
			<div class="col-1"><label class="mr-2">문의 내용</label></div>
			<div class="col-6">
				<div class="form-floating">
					<textarea id="qnaContent_input" name="qna_content" class="form-control" 
						style="width: 750; height: 300px;" readonly>
					</textarea>
				</div>
			</div>
		</div>
		
		<hr>
		
		<div class="row gx-5 pb-3">
			<div class="col-md-1">작성 날짜</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="replyDate_input" readonly>
			</div>
 		</div>
		<div class="row gx-5 pb-3">
		<div class="row gx-5 pb-3">
			<div class="col-1"><label class="mr-2">답변 내용</label></div>
			<div class="col-6">
				<div class="form-floating">
					<textarea id="replyContent_input" name="qna_content" class="form-control" 
						style="width: 750; height: 300px;" readonly>
					</textarea>
				</div>
			</div>
		</div>
		<div class="text-center">
			<button id="cancel_btn" type="button" class="btn btn-secondary">취소</button>
		</div>
	</div>
	</form>
	<!-- 등록 form_End -->
	
	</main>
	</div>
</div>

	

</body>
<script>
	// 변수
	var isLoggedIn = '';
	
	$(document).ready(function() {
		// 로그인 상태
		isLoggedIn = '${sessionScope.loginInfo}' !== '';
		id = '${sessionScope.loginInfo}';
		type = '${sessionScope.loginType}';
		
		if (!isLoggedIn) {
			$(".login-btn").click(function() {
			$(".login-btn").text('로그인');
				window.location.href = "/login.go";
			});
			console.log('로그아웃 상태'); 
		} else {
			$(".login-btn").text('로그아웃');
			$(".login-btn").click(function() {
				window.location.href = "/logout.do";
				
			});
			console.log('로그인 상태');
		}
	});
	
	//event
	$('#cancel_btn').on('click', function(){
		location.href="/qna/list.go";
	})
	
	// data 값 넣기
	$('#title_input').val('${result.qna_title}');
	$('#writer_input').val('${result.qna_id}');
	$('#registDate_input').val('${result.qna_write_date}');
	$('#qnaContent_input').val('${result.qna_content}');
	$('#replyDate_input').val('${result.reply_write_date}');
	$('#replyContent_input').val('${result.reply_content}');

	//method
	function search(){
		var keyword = $("input[placeholder='장소 및 모임을 입력하세요']").val();
		//  검색 시 스터디룸, 회의실, 파티룸, 카페 중 하나면 카테고리와 같은 위치로 이동
		if (keyword === '스터디룸' || keyword === '회의실' || keyword === '파티룸' || keyword === '카페') {
			window.location.href = "/searchResult.go?type=" + encodeURIComponent(keyword);
		} else {
			window.location.href = "/searchResult.go?name=" + encodeURIComponent(keyword);
		}
		console.log('keyword: ',keyword);
	}
	
	
</script>
</html> 