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
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>모임 등록시 결제 확인</title>
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
	.form-input {
		background: white;
	}
	p {
		margin-right: 10px;
		margin-top: 5px;
		top: 5px;
	}
	.form-control {
		resize: none;
	} 
	dt {
		font-size: 35px;
		margin-bottom: 20px;
	}
	dd {
		font-size: 25px;
		margin-bottom: 20px;
	}
	.paymentBtn{
	    width: 250px;
	    height: 60px;
	    font-size: 30px;
	    background: #3a4064;
	    border: 0px;
	    color: white;
	    font-weight: 500;
	    opacity: 100%;
	    margin-bottom: 10px;
	}
</style>
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

<!-- 페이지 내용 -->
<div class="container-fluid" style="display: flex;">
	<br/>
	<br/>

	<div class="col-2" style="width: 300px;"></div>
	<div class="col-10" style="flex-grow: 1;">
	<div class="row" style="margin-top: 50px;">
		<div class="col-7" style="background:#F5F6FA; border-radius: 10px;margin-left: 15px;">
			<div class="row">
				<h2>${groupDTO.group_name }</h2>
				<hr/>
				<h1>위치</h1>
				<p>${spaceDTO.space_address }</p>
				<img src="${photoSrc}" class="img-fluid rounded-start w-100" style="height: 400px;" alt="..."/>
			</div>
			<br/>
			<br/>
		</div>
		<div class="col-4" style="text-align: center; background:#F5F6FA; border-radius: 10px; margin-left: 15px; padding: 10px;">
			<dl class="row text-center align-items-center">
		  		<dt class="col-sm-4">모임 날짜</dt>
		  		<dd class="col-sm-8">${year}년 ${month}월 ${day}일</dd>
		  		<dt class="col-sm-4">모임 시간</dt>
		  		<dd class="col-sm-8">${starttime}시 ~ ${endtime}시, <span id="hour"></span>시간</dd>
		  		<dt class="col-sm-4">모임 인원</dt>
		  		<dd class="col-sm-8">최소 ${groupDTO.group_lowpeople}명 ~ 최대 ${groupDTO.group_highpeople}명</dd>
		  		<dt class="col-sm-11">모임 등록시 보증금 포인트 금액</dt>
		  		<dd class="col-sm-1"></dd>
		  		<dt class="col-sm-4"></dt>
				<dd class="col-sm-8" id="pay" style="font-size: 50px;"></dd>
			</dl>
			<form action="/group/paymentRegistration.do" method="POST">
				<button class="btn btn-success paymentBtn">결제하기</button>
			</form>
		</div>
		<div class="col-1"></div>
	</div>
	</div>
</div>
</body>
<script>
	$('#pay').text(parseInt(${spaceDTO.space_point}/${groupDTO.group_lowpeople}) + 'P');
	$('#hour').text(parseInt(${endtime}) - parseInt(${starttime}));
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