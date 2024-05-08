<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            height : 50%; 
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #e74c3c;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
<title>회원 탈퇴</title>    
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
	<nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white; margin-top:90px;">
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
	    			<a href="/QnAList">문의</a>
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
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" id = "body">
	    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	        <h1 class="h2">회원 탈퇴</h1>
	      </div>
	     <br>
	     <br>
	     <br>
	     <br>
	    <div class="container">
	        <h2>회원 탈퇴</h2>
	        <br>
	        <br>
	        <input type="text" style = "border: none; outline: none; text-align: center; font-size: 18px; font-weight: bold; color: darkblue;" value = "Union Space 회원 탈퇴를 하시겠습니까?" readonly>
	        <br>
	        <br>
	        <form id="withdrawForm">
	            <label for="password">비밀번호:</label>
	            <input type="password" id="password" name="password" required>
				<input type="submit" value="회원 탈퇴" style="padding: 8px 15px; font-size: 14px;" onclick="confirmDelete()">
	        </form>
	    </div>

</main>
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
    
	function confirmDelete() {
	    var confirmResult = confirm("정말로 탈퇴하시겠습니까?");
	    if (confirmResult) {
	        $('#withdrawForm').submit(); // 폼 제출
	    }
	}
	
    $(document).ready(function() {
        $('#withdrawForm').submit(function(e) {
            e.preventDefault(); // 폼 기본 제출 방지

            var password = $('#password').val();

            // 비밀번호 필드가 비어 있는지 확인
            if (password === "") {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            // 회원 탈퇴 요청
            $.ajax({
                type: 'POST',
                url: 'withdraw',
                data: {
                    password: password
                },
                success: function(response) {
                    if (response === "success") {
                        alert("회원 탈퇴가 완료되었습니다.");
                        window.location.href = "/login.go"; // 로그아웃 페이지로 이동
                    } else if (response === "incorrect") {
                        alert("비밀번호가 일치하지 않습니다.");
                    } else {
                        alert("서버 오류: " + response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("요청 실패:", error);
                }
            });
        });
    });
</script>

</body>
</html>
