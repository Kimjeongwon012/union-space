<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Union Space</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   type="text/css" />
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
/* body {
   font-family: Arial, sans-serif;
   background-color: #fff;
}
 */
.header {
   background-color: #fff;
   color: #000;
   padding: 10px 0;
   display: flex; /* 헤더를 플렉스 컨테이너로 설정 */
   justify-content: center; /* 아이템을 가운데에 배치 */
   align-items: center; /* 수직 가운데 정렬 */
   height: 150px;
   box-shadow: none;
}
.sidebar {
    width: 300px;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.9); /* 살짝 투명한 흰색 */
    top: 150px;
    position: absolute; left : -300px; /* 처음에는 숨겨진 상태 */
    transition: left 0.3s ease; /* 왼쪽으로 이동하는 애니메이션 효과 */
    box-shadow: none;
    left: -300px;
 }

</style>
</head>
<body>
   <div class="header">
      <img src="/resources/images/siteImg/menu.png" id="sidebar-toggle"
         class="menu-btn"> <a href="/home"> <img
         src="/resources/images/siteImg/logo.png" class="logo-img2">
      </a>
      <div class="search-box">
         <input type="text" placeholder="장소 및 모임을 입력하세요">
         <button class="search-btn">검색</button>
      </div>
      <button class="login-btn">로그인</button>
      <div class="mypage-link">
         <a href="/mypagemain"> <img
            src="/resources/images/siteImg/mypage.png" class="logo-img">
         </a>
      </div>
	</div>
	<!-- headerEnd -->

	<!-- 바로가기 -->
	<div class="container">
      <div class="row">
         <div class="row" id="category" style="">         
            <a href="/searchResult.go?type=스터디룸" class="category-img"> 
               <img src="/resources/images/siteImg/studyroom.png">
            </a> 
            <a href="/searchResult.go?type=회의실" class="category-img"> 
               <img src="/resources/images/siteImg/hwei.png">
            </a> 
            <a href="/searchResult.go?type=파티룸" class="category-img"> 
               <img src="/resources/images/siteImg/partyroom.png">
            </a> 
            <a href="/searchResult.go?type=카페" class="category-img"> 
               <img src="/resources/images/siteImg/cafe.png">
            </a>
         </div>
         <a href="/QnAList" style="margin-top: 100px;"> <img
            src="/resources/images/siteImg/moon2.png" class="category-img3">
         </a>
      </div>
   </div>
	<!-- 바로가기End -->
	<!-- sideBar -->
   <div class="container-fluid">
      <div class="row">
		<!-- logout sidebar -->
		<nav id="logout" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-logout collapse" style="background: white">
		   <div class="position-sticky pt-3">
		      <h1>Menu</h1>
		      <div class="bg-black" style="height: 2px"></div>
		      <br />
		      <div class="">
				<h3>Union Space</h3>
		      </div>
		      <hr />
		      <ul class="nav flex-column">
				<li class="nav-item"><a href="/home">Union Space</a></li>
				<li class="nav-item"><a href="/QnAList">문의</a></li>
		      </ul>
		      <br />
		      <h3>Search</h3>
		      <hr />
		      <ul class="nav flex-column">
				<li class="nav-item"><a href="/searchResult.go">장소 및 모임 찾기</a></li>
		      </ul>
		   </div>
		</nav>
		<!-- login_sidebar -->
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
					<a href="/qna/list.go">문의 게시판</a>
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
		
		<!-- admin_sidebar -->
		<nav id="admin" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-admin collapse" >
			<div class="position-sticky pt-3" >
				<h1>Admin</h1>
				<div class="bg-black" style="height: 2px"></div>
				<br/>
				<div class="flex-column">
					<h3>Main</h3>
				</div>
				<hr/>
				<ul class="nav flex-column">
					<li class="nav-item">
						<a href="/admin/qna/list.go">문의 게시판</a>
					</li>
				</ul>
				<br/>
				<div class="flex-column">
					<h3>Reservation</h3>
				</div>
				<hr/>
				<ul class="nav flex-column">
					<li class="nav-item">
						<a href="/adminMain">예약 전체 내역 조회</a>
					</li>
				</ul>
				<br/>
				<h3>Member</h3>
				<hr/>
				<ul class="nav flex-column">
					<li class="nav-item">
						<a href="/admin/get.do">회원 목록 조회</a>
					</li>
					<li class="nav-item">
						<a href="/point/adminpoint/get.do">사용자 포인트 내역 조회</a>
					</li>
				</ul>
				<br/>
				<h3>Space</h3>
				<hr/>
				<ul class="nav flex-column">
					<li class="nav-item">
						<a href="/space/list.go">등록한 장소 목록 조회</a>
					</li>
					<li class="nav-item">
						<a href="/space/register.go">장소 등록</a>
					</li>
					<li class="nav-item">
						<a href="/space/qna/list">장소별 Q&A</a>
					</li>
					<li class="nav-item">
						<a href="/adminSpaceReview">장소별 리뷰</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- 사이드바 메뉴_End -->
      </div>
   </div>
   <!-- 사용자 로그인 사이드바 끝 -->
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

      document
		   .addEventListener(
				'DOMContentLoaded',
				function() {
				   var sidebar = document
						.getElementsByClassName('sidebar')[0];
				   var sidebarToggle = document
						.getElementById('sidebar-toggle');
				   var isSidebarOpen = false; // 사이드바의 현재 상태를 추적하는 변수

				   var sidebarLogout = document
						.getElementsByClassName('sidebar-logout')[0];
				   var sidebarLogin = document
						.getElementsByClassName('sidebar-login')[0];
				   var sidebarAdmin = document
						.getElementsByClassName('sidebar-admin')[0];

				   sidebarToggle
						.addEventListener(
						      'click',
						      function(event) {
								event.stopPropagation(); // 이벤트 전파 중지
								if (isSidebarOpen) { // 사이드바가 열려있는 상태라면

								   if (!isLoggedIn) {
								      sidebarLogout.style.left = "-300px"; // 사이드바를 왼쪽으로 숨김
								      sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
								      isSidebarOpen = false; // 상태 변수 업데이트
								      console.log('로그아웃 상태');

								   } else {
								      var userPermission = '${memberDTO.user_permission}';
								      if (userPermission !== 'user') {
										sidebarAdmin.style.left = "-300px";
										sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
										isSidebarOpen = false; // 상태 변수 업데이트
										console.log('관리자');
								      } else {
										sidebarLogin.style.left = "-300px"; // 사이드바를 왼쪽으로 숨김
										sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
										isSidebarOpen = false; // 상태 변수 업데이트
										console
										      .log('로그인 상태');
								      }
								   }

								} else { // 사이드바가 닫혀있는 상태라면
								   if (!isLoggedIn) {
								      sidebarLogout.style.left = "0"; // 사이드바를 왼쪽으로 보여줌
								      sidebarToggle.style.zIndex = "0"; // 사이드바 위로 메뉴 버튼 이동
								      isSidebarOpen = true; // 상태 변수 업데이트

								   } else {
								      var userPermission = '${memberDTO.user_permission}';
								      if (userPermission !== 'user') {
										sidebarAdmin.style.left = "0";
										sidebarToggle.style.zIndex = "0";
										isSidebarOpen = true;
								      } else {
										sidebarLogin.style.left = "0"; // 사이드바를 왼쪽으로 보여줌
										sidebarToggle.style.zIndex = "0"; // 사이드바 위로 메뉴 버튼 이동
										isSidebarOpen = true; // 상태 변수 업데이트
								      }
								   }

								}
						      });

                     console.log('${memberDTO.user_permission}');
                     // if (isLoggedIn && !memberDTO.user_permission='user'){
                     //    
                     // }

                     // 사이드바 외부를 클릭할 때 사이드바를 닫음
                     document.addEventListener('click', function(event) {
                        if (isSidebarOpen
                              && !sidebar.contains(event.target)) {
                           sidebar.style.left = "-300px"; // 사이드바를 왼쪽으로 숨김
                           sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
                           isSidebarOpen = false; // 상태 변수 업데이트
                        }
                     });
                  });
      $(document)
            .ready(
                  function() {
                     $(".search-btn")
                           .click(
                                 function() {
                                    var keyword = $(
                                          "input[placeholder='장소 및 모임을 입력하세요']")
                                          .val();
                                    //  검색 시 스터디룸, 회의실, 파티룸, 카페 중 하나면 카테고리와 같은 위치로 이동
                                    if (keyword === '스터디룸'
                                          || keyword === '회의실'
                                          || keyword === '파티룸'
                                          || keyword === '카페') {
                                       window.location.href = "/searchResult.go?type="
                                             + encodeURIComponent(keyword);
                                    } else {
                                       window.location.href = "/searchResult.go?name="
                                             + encodeURIComponent(keyword);
                                    }
                                 });
                  });
   </script>
</body>
</html>
