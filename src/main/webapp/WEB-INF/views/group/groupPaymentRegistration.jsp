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
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Union Space</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Sign out</a>
    </div>
  </div>
</header>

<!-- 페이지 내용 -->
<div class="container-fluid">
	<br/>
	<br/>
	<div class="row">
		<div class="col-1"></div>
		<div class="col-6" style="background:#F5F6FA; border-radius: 10px;">
			<div class="row">
				<h2>${groupDTO.group_name }</h2>
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
</body>
<script>
	$('#pay').text(${spaceDTO.space_point}/${groupDTO.group_lowpeople} + 'P');
	$('#hour').text(parseInt(${endtime}) - parseInt(${starttime}));
</script>
</html>