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
<title>모임 등록</title>
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

<!-- 페이지 내용 -->
<div class="container-fluid" style="display: flex;">
	<div class="col-2" style="width: 300px;"></div>
	<div class="col-10" style="flex-grow: 1;margin-top: 50px;">	
	<div class="row">
		<div class="col-7" style="background:#F5F6FA; border-radius: 10px;margin-left: 50px;">
			<div class="row">
				<h2>${spaceDTO.space_name}</h2>
				<hr/>
				<h1>위치</h1>
				<p>${spaceDTO.space_address }</p>
				<div id="map" class="w-70" style="height:400px; width:85%; margin-left: 7%;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c63937991c5bbcc2e33985708b5a64be"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(${spaceDTO.space_latitude}, ${spaceDTO.space_longitude}),
						level: 3
					};
			
					var map = new kakao.maps.Map(container, options);
				</script>
			</div>
			<br/>
			<br/>
		</div>
		<div class="col-4" style="text-align: center; background:#F5F6FA; border-radius: 10px; margin-left: 15px; padding: 10px;">
			<dl class="row text-center align-items-center">
		  		<dt class="col-sm-4">예약 날짜</dt>
		  		<dd class="col-sm-8">${year}년 ${month}월 ${day}일</dd>
		  		<dt class="col-sm-4">예약 시간</dt>
		  		<dd class="col-sm-8">${starttime}시 ~ ${endtime}시, <span id="hour"></span>시간</dd>
		  		<dt class="col-sm-4">예약 인원</dt>
		  		<dd class="col-sm-8">${groupDTO.group_people}명</dd>
		  		<dt class="col-sm-11">모임 등록시 보증금 포인트 금액</dt>
		  		<dd class="col-sm-1"></dd>
		  		<dt class="col-sm-4"></dt>
				<dd class="col-sm-8" id="pay" style="font-size: 50px;"></dd>
			</dl>
			<form action="/space/payment.do" method="POST">
				<button class="btn btn-success paymentBtn">결제하기</button>
			</form>
		</div>
		<div class="col-1"></div>
	</div>
	</div>
</div>
</body>
<script>
	$('#pay').text(${spaceDTO.space_point} + 'P');
	$('#hour').text(parseInt(${endtime}) - parseInt(${starttime}));
</script>
</html>