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
<style>
	.header {
          background-color: #ffffff;
          color: #ffffff;
          padding: 10px 0;
          display: flex; 
          justify-content: center; 
          align-items: center; 
          margin-left : 0px; 
          height :150px;
             background-color: #ffffff; 
   }   
.login-btn {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 10px; /* 간격을 위한 왼쪽 마진 추가 */
    }
    .login-btn:hover {
        background-color: #0056b3;
    }
    .search-box {
        text-align: center;
        display: flex; /* 검색 상자를 플렉스 컨테이너로 설정 */
        align-items: center; /* 수직 가운데 정렬 */
        margin-left: auto; /* 검색박스를 오른쪽으로 밀어내기 */
    }
    .search-box input[type="text"] {
        width: 300px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 10px; /* 간격을 위한 오른쪽 마진 추가 */
    }
    .search-btn {
        background-color: #28a745;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .search-btn:hover {
        background-color: #218838;
    }
    .mypage-link {
        text-align: center;
    }
    .mypage-link a {
        text-decoration: none;
        color: #333;
        border: 1px solid #333;
        padding: 5px 10px; /* 작은 크기를 위한 패딩 조정 */
        border-radius: 4px;
        background-color: #fff;
        display: inline-block; /* 작은 크기를 위해 inline-block으로 변경 */
        margin-left: 10px;
        margin-right: 10px;
    }
    .mypage-link a:hover {
        background-color: #c4afaf;
        color: #fff;
    }
	    /* 사이드바 스타일 */
    .sidebar-admin {
        background-color: white;
        margin-top: 90px; /* 헤더와의 간격 조정 */
        height: calc(100vh - 90px); /* 사이드바 높이를 화면 높이의 나머지에 맞춤 */
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
    }
    
    /* 메인 콘텐츠와의 간격 조정 */
    .main-content {
        margin-top: 90px; /* 헤더와의 간격 조정 */
        padding-top: 30px; /* 사이드바가 가리는 내용을 피하기 위해 콘텐츠 상단에 패딩 추가 */
    }
</style>
<title>문의글 작성</title>
</head>
<body>
<div class="header">
    <!-- 로고를 중앙에 배치 -->
    <div style="flex: 1; display: flex; justify-content: center; margin-left:580px;">
        <a href="/home">
            <img src="/resources/images/siteImg/logo.png" class="logo-img2">
        </a>
    </div>
    <div class="search-box">
            <input type="text" placeholder="장소 및 모임을 입력하세요">
            <button class="search-btn">검색</button>
        </div>
    <!-- 로그인 버튼과 마이페이지 버튼을 오른쪽으로 배치 -->
    <div style="display: flex; align-items: center;">
        <div>
            <button class="login-btn">로그인</button>
        </div>
        <div class="mypage-link">
            <a href="/mypagemain">
                <img src="/resources/images/siteImg/mypage.png" class="logo-img">
            </a>
        </div>
        <!-- 검색 버튼과 검색 상자를 하나의 그룹으로 묶기 -->
        
    </div>
</div>
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
				<a href="/member/qna/list.go">문의 게시판</a>
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
					<input type="text" id="title_input" name="qna_title" class="form-control">
				</div>
			</div>
 		</div>
		<div class="row gx-5 pb-3">
			<div class="col-md-1">비밀번호</div>
			<div class="col-md-2">
				<input type="password" class="form-control" id="pw_input" name="qna_pw">
			</div>
			<div class="col-md-1" style="width:150px">비밀번호 확인</div>
			<div class="col-md-2">
				<input type="password" class="form-control" id="checkPw_input">
				<span class="float-left" id="checkPw_msg_span" style="color:red; margin-left:10px;"></span>
			</div>
 		</div>
 		
		<div class="row gx-5 pb-3">
			<div class="col-1"><label class="mr-2">문의 내용</label></div>
			<div class="col-6">
				<div class="form-floating">
					<textarea id="content_input" name="qna_content" class="form-control" 
						style="width: 750; height: 300px;">
					</textarea>
				</div>
			</div>
		</div>
		<div class="text-center">
			<button type="submit" class="btn btn-primary" id="save_btn">저장</button>
			<button type="reset" class="btn btn-secondary">취소</button>
		</div>
	</div>
	</form>
	<!-- 등록 form_End -->
	
	</main>
	</div>
</div>

	

</body>
<script>
var isLoggedIn = '';
$(document).ready(function() {
   isLoggedIn = '${sessionScope.loginInfo}' !== '';
   console.log(isLoggedIn);
   
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
        console.log('로그인상태');
      }
    
    // 로그인 버튼 클릭 이벤트
   
});
$(document).ready(function() {
        $(".search-btn").click(function() {
            var keyword = $("input[placeholder='장소 및 모임을 입력하세요']").val();
            //  검색 시 스터디룸, 회의실, 파티룸, 카페 중 하나면 카테고리와 같은 위치로 이동
            if (keyword === '스터디룸' || keyword === '회의실' || keyword === '파티룸' || keyword === '카페') {
                window.location.href = "/searchResult.go?type=" + encodeURIComponent(keyword);
            } else {
                window.location.href = "/searchResult.go?name=" + encodeURIComponent(keyword);
            }
        });
    });





	// 변수
	var isLoggedIn = '';
	var id, type;
	var pw, pw2;
	var pw_flag = false;
		
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
	$('#pw_input').on('change', function(){
		pw = $(this).val();
	})
	$('#checkPw_input').on('change', function(){
		pw2 = $(this).val();
		
		if(pw != pw2 || pw2 == null){
			$('#checkPw_msg_span').text('비밀번호가 다릅니다.');
		}else{
			$('#checkPw_msg_span').text('');
			pw_flag = true;
		}
	});
	$('#QnawriteForm').on('submit', function(event){
		if(!pw_flag){
			console.log('pw: ', pw, '/ pw2:', pw2);
			event.preventDefault();

			$('#title_input').val('');
			$('#pw_input').val('');
			$('#checkPw_input').val('');
			$('#content_input').val('');
			$('#checkPw_msg_span').text('');
		}
	})
	

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