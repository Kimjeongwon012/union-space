<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 조회</title>
<style>
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

.header {
	background-color: #ffffff;
	color: #ffffff;
	padding: 10px 0;
	display: flex; /* 헤더를 플렉스 컨테이너로 설정 */
	justify-content: center; /* 아이템을 가운데에 배치 */
	align-items: center; /* 수직 가운데 정렬 */
	margin-left: 0px; /* 이 부분을 수정하여 헤더를 오른쪽으로 이동 */
	height: 150px;
	background-color: #ffffff; /* 헤더의 배경색을 흰색으로 설정 */
}

body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.header-container {
	background-color: #fff;
	color: #000;
	padding: 10px 0;
}

.container {
	width: 80%;
	height: 200%;
	margin: 100px auto 0; /* 헤더 높이 + 여백 만큼 컨테이너를 아래로 내림 */
	margin-left: 450px;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

th {
	width: 20%;
}

td {
	width: 80%;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	margin: 0 10px;
	border: none;
	border-radius: 4px;
	background-color: #3498db;
	color: #fff;
	cursor: pointer;
}

.btn:hover {
	background-color: #2980b9;
}
/* 모달 스타일 */
.modal {
	display: none; /* 모달 숨기기 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 다른 요소 위에 표시 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto; /* 스크롤바 표시 */
	background-color: rgba(0, 0, 0, 0.4); /* 배경 색상과 투명도 설정 */
}

.modal-content {
	background-color: #fefefe; /* 모달 내용 배경색 */
	margin: 15% auto; /* 중앙 정렬 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}
/* 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="header">
		<!-- 로고를 중앙에 배치 -->
		<div
			style="flex: 1; display: flex; justify-content: center; margin-left: 580px;">
			<a href="/home"> <img src="/resources/images/siteImg/logo.png"
				class="logo-img2">
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
				<a href="/mypagemain"> <img
					src="/resources/images/siteImg/mypage.png" class="logo-img">
				</a>
			</div>
			<!-- 검색 버튼과 검색 상자를 하나의 그룹으로 묶기 -->

		</div>
	</div>

	<div class="container">
		<h3>사용자 정보 조회</h3>
		<hr />
		<table>
			<tr>
				<th>ID</th>
				<td>${user_id != null ? user_id : ''}</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>${user_pw != null ? user_pw : ''}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${user_name != null ? user_name : ''}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${user_phone != null ? user_phone : ''}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${user_gender != null ? user_gender : ''}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${user_email != null ? user_email : ''}</td>
			</tr>
		</table>
		<div class="btn-container">
			<!-- 회원정보 수정 버튼을 눌렀을 때 모달 열기 -->
			<button class="btn" onclick="openModal('/userEdit')">회원정보 수정</button>
			<!-- 비밀번호 변경 버튼을 눌렀을 때 모달 열기 -->
			<button class="btn" onclick="openModal('/pwChange')">비밀번호 변경</button>
		</div>
	</div>

	<!-- 모달 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<iframe id="modalFrame"
				style="width: 100%; height: 400px; border: none;"></iframe>
		</div>
	</div>
	<nav id="login"
		class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
		style="background: white; margin-top: 90px;">
		<div class="position-sticky pt-3">
			<h1>Menu</h1>
			<div class="bg-black" style="height: 2px"></div>
			<br />
			<div class="">
				<h3 style="text-align: left;">Union Space</h3>
			</div>
			<hr />
			<ul class="nav flex-column">
				<li class="nav-item"><a href="/home">Union Space</a></li>
				<li class="nav-item"><a href="/QnAList">문의</a></li>
			</ul>
			<br />
			<h3 style="text-align: left;">Search</h3>
			<hr />
			<ul class="nav flex-column">
				<li class="nav-item"><a href="/searchResult.go">장소 및 모임 찾기</a>
				</li>

			</ul>
			<br />
			<h3 style="text-align: left;">MyPage</h3>
			<hr />
			<ul class="nav flex-column">
				<li class="nav-item"><a href="/mypagemain">현재 예약 현황</a></li>
				<li class="nav-item"><a href="/reservation/get.do">예약 내역 조회</a>
				</li>
				<li class="nav-item"><a href="/point/list.do">포인트 내역 조회</a></li>
				<li class="nav-item"><a href="/userinfo">회원 정보 조회</a></li>
				<li class="nav-item"><a href="/userInfoOut">회원 탈퇴</a></li>
			</ul>
		</div>
	</nav>

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
		// 모달 열기 함수
		function openModal(page) {
			document.getElementById("myModal").style.display = "block";
			document.getElementById("modalFrame").src = page;
		}

		// 모달 닫기 함수
		function closeModal() {
			document.getElementById("myModal").style.display = "none";
		}

		// 모달 바깥을 클릭했을 때 모달 닫기
		window.onclick = function(event) {
			var modal = document.getElementById("myModal");
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
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