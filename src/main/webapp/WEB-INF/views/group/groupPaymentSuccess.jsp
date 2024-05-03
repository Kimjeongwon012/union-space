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
<title>모임 등록 결제 성공</title>
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
	.col-sm-4 {
		font-size: 30px;
		font-weight: 100;
	}
	.col-sm-8 {
		font-size: 30px;
		font-weight: 100;
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
	<div class="row" style="height: 200px"></div>
	<div class="row text-center align-items-center">
		<div class="col-2"></div>
		<div class="col-8" style="text-align: center;">
			<h1 style="font-size: 65px;">결제 완료 되었습니다.</h1>
			<hr/>
			<div class="row">			
				<div class="col-2"></div>
				<div class="col-8">			
					<dl class="row text-center align-items-center">
				  		<dt class="col-sm-4">에약한 장소의 이름</dt>
				  		<dd class="col-sm-8">${space_name}</dd>
				  		<dt class="col-sm-4">결제된 포인트 금액</dt>
				  		<dd class="col-sm-8">${space_point}P</dd>
				  	</dl>
				</div>
				<div class="col-2"></div>
			</div>
			<br/>
			<br/>
			<button class="btn btn-success paymentBtn" onclick="goMainPage()">확인</button>
		</div>
		<div class="col-2"></div>	
	</div>
</div>
</body>
<script>
	function goMainPage() {
		location.href='/home';
	}
</script>
</html>