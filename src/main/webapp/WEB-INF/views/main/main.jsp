<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Union Space</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
        margin-top : 100px;
        width : 100%;
        height : 100%;
    }
    .container {
        width: 80%;
        height:100%;
        margin: 0 auto;
        padding: 20px;
        margin-top : 200px;
        margin-left : 400px;
        margin-right : 0px;
        
    }
    .header {
        background-color: #fff;
        color: #000;
        padding: 10px 0;
        display: flex; /* 헤더를 플렉스 컨테이너로 설정 */
        justify-content: center; /* 아이템을 가운데에 배치 */
        align-items: center; /* 수직 가운데 정렬 */
        margin-left : 450px;
        height :150px;
        
    }
    .header h1 {
        margin: 0;
        flex-grow: 1; /* h1이 공간을 확보할 수 있도록 설정 */
        text-align: center; /* 텍스트 가운데 정렬 */
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
        margin-right: 20px;
    }
    .mypage-link a:hover {
        background-color: #c4afaf;
        color: #fff;
    }
    .logo-img {
        max-height: 50px;
        margin-right: 0px; /* 이미지와 텍스트 사이 간격 추가 */
    }
    .logo-img2 {
        max-height: 100px;
        margin-right: 0px; /* 이미지와 텍스트 사이 간격 추가 */
        width:350px;
        
        
    }
    .category-img{
    	width : 200px;
    	height : 200px;
    	margin-left : 0px;
    }
    .category-img2{
    	width : 200px;
    	height : 200px;
    	margin-left : 200px;
    }
    
    .category-img3{
    	width : 600x;
    	height : 300px;
    	margin-left : 200px;
    	margin-top : -250px;

    }
   .sidebar {
    width: 180px;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.9); /* 살짝 투명한 흰색 */
    position: fixed;
    top: 230;
    left: -250px; /* 처음에는 숨겨진 상태 */
	   transition: left 0.3s ease; /* 왼쪽으로 이동하는 애니메이션 효과 */
	}
	
	/* .sidebar-logout{
	position: fixed;
	left: -250px;
	}
	.sidebar-login{
	position: fixed;
	left: -250px;
	} */
	
	.sidebar.open {
	    left: 10;/* 열린 상태 */
	}
	.menu-btn {
	    background-color: #007bff;
	    color: #fff;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 4px;
	    position: fixed; /* 절대 위치 지정 */
	    cursor: pointer;
	    margin-left: 10px;
	    top: 120;
	    
	}
	.menu-btn:hover {
	    background-color: #0056b3;
	}
	#sidebar-toggle {
    background-color: #ffffff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 50px;
    position: absolute; /* 절대 위치 지정 */
    top: 120; /* 상단에 위치 */
    left: 0; /* 왼쪽에 위치 */
    width : 50px;
    height : 80px;
}
	.nav-item{
		margin-bottom : 5px;
	}

</style>
</head>
<body>
<div class="header">
    <div class="header">
        <a href="/home">
            <img src="/resources/images/siteImg/logo.png" class="logo-img2">
        </a>
    </div>
    <div class="search-box">
        <input type="text" placeholder="장소 및 모임을 입력하세요">
        <button class="search-btn">검색</button>
    </div>
    <button class="login-btn">로그인</button>
    <div class="mypage-link">
        <a href="/mypagemain">
            <img src="/resources/images/siteImg/mypage.png" class="logo-img">
        </a>
    </div>
    <img src="/resources/images/siteImg/menu.png" id="sidebar-toggle" class="menu-btn">
    
</div>
<div class="container">
    <a href="/home">
         <img src="/resources/images/siteImg/studyroom.png" class="category-img">
    </a>
    <a href="/mypage">
         <img src="/resources/images/siteImg/hwei.png" class="category-img2">
    </a>
    <a href="/mypage">
         <img src="/resources/images/siteImg/partyroom.png" class="category-img2">
    </a>
    <a href="/mypage">
         <img src="/resources/images/siteImg/cafe.png" class="category-img2">
    </a>
    
</div>
<div class = "category-img3">
	<a href="/QnAList">
         <img src="/resources/images/siteImg/moon2.png" class="category-img3">
    </a>
</div>
<div class="container-fluid">
  <div class="row">
    <nav id="logout" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-logout collapse"
    	style="background:white">
    	<div class="position-sticky pt-3" >
    		<h1>Menu</h1>
    		<div class="bg-black" style="height: 2px"></div>
    		<br/>
    		<div class="">
    			<h3>Union Space</h3>
    		</div>
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
    				<a href="">장소 및 모임 찾기</a>
    			</li>
				
    		</ul>
    	</div>
    </nav>
    <nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white">
         <div class="position-sticky pt-3" >
    		<h1>Menu</h1>
    		<div class="bg-black" style="height: 2px"></div>
    		<br/>
    		<div class="">
    			<h3>Union Space</h3>
    		</div>
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
    				장소 찾기
    			</li>
				<li class="nav-item">
	    			모임 찾기
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
	    			매너 상세보기
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
     
     <nav id="admin" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-admin collapse"
            style="background:white">
         <div class="position-sticky pt-3" >
    		<h1>Admin</h1>
    		<div class="bg-black" style="height: 2px"></div>
    		<br/>
    		<div class="">
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
	    			<a href="/point/list.do">포인트 충전 및 사용내역</a>
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
	    			<a href="/adminQna">장소별 Q&A</a>
	    		</li>
	    		<li class="nav-item">
	    			<a href="/adminSpaceReview">장소별 리뷰</a>
	    		</li>
	    		
    		</ul>
    	</div>
     </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="background:black">
    </main>
  </div>
</div>

    
    
<h1></h1>
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

        document.addEventListener('DOMContentLoaded', function() {
            var sidebar = document.getElementsByClassName('sidebar')[0];
            var sidebarToggle = document.getElementById('sidebar-toggle');
            var isSidebarOpen = false; // 사이드바의 현재 상태를 추적하는 변수
            
            var sidebarLogout = document.getElementsByClassName('sidebar-logout')[0]; 
            var sidebarLogin = document.getElementsByClassName('sidebar-login')[0];
            var sidebarAdmin = document.getElementsByClassName('sidebar-admin')[0];

            sidebarToggle.addEventListener('click', function(event) {
                event.stopPropagation(); // 이벤트 전파 중지
                if (isSidebarOpen) { // 사이드바가 열려있는 상태라면
                	
                	if (!isLoggedIn) {
                		sidebarLogout.style.left = "-250px"; // 사이드바를 왼쪽으로 숨김
                        sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
                        isSidebarOpen = false; // 상태 변수 업데이트
                    	 console.log('로그아웃 상태');
                        
                    } else{
                    	var userPermission = '${memberDTO.user_permission}';
                    	if(userPermission !== 'user'){
                    		sidebarAdmin.style.left = "-250px";
                    		sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
                            isSidebarOpen = false; // 상태 변수 업데이트
                        	console.log('관리자');
                    	}else{
                    	sidebarLogin.style.left = "-250px"; // 사이드바를 왼쪽으로 숨김
                        sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
                        isSidebarOpen = false; // 상태 변수 업데이트
                    	 console.log('로그인 상태');
                    	}
                    } 
                	
                	
                } else { // 사이드바가 닫혀있는 상태라면
                	if (!isLoggedIn) {
                		sidebarLogout.style.left = "0"; // 사이드바를 왼쪽으로 보여줌
                        sidebarToggle.style.zIndex = "0"; // 사이드바 위로 메뉴 버튼 이동
                        isSidebarOpen = true; // 상태 변수 업데이트
                        
                    } else{
                    	var userPermission = '${memberDTO.user_permission}';
                    	if(userPermission !=='user'){
                    		sidebarAdmin.style.left = "0";
                    		sidebarToggle.style.zIndex = "0";
                    		isSidebarOpen = true;
                    	}else{
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
                if (isSidebarOpen && !sidebar.contains(event.target)) {
                    sidebar.style.left = "-250px"; // 사이드바를 왼쪽으로 숨김
                    sidebarToggle.style.zIndex = "1"; // 메뉴 버튼 위로 이동
                    isSidebarOpen = false; // 상태 변수 업데이트
                }
            });
        });
    </script>
</body>


</html>