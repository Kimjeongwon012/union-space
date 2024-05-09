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
</style>
<title>page</title>
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

<div class="container-fluid" style="display: flex;">
	<div class="col-2" style="width: 300px;"></div>
	<div class="col-10" style="flex-grow: 1;margin-top: 50px;">	
	<div class="row">
	    <br/>
	    <div class="row" style="margin-left: 50px;">
			<div class="col-11">
				<div class="row">
					<h2 style="font-weight: bold;">질문 작성해주세요</h2>
					<hr/>
				</div>
				<div class="row">
					<div class="col-2">
						<p>작성자</p>
					</div>
					<div class="col-10">
						<p>${writer}</p>
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
			<form name="home" action="/home" method="GET">
				<button type="submit" class="btn btn-primary" style="margin-left: 15px;">나가기</button>
			</form>
			</div>
			<div class="col-1"></div>
		</div>
  </div>
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
  
</script>
</html> 