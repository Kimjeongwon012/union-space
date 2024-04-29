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
<title>모임 수정</title>
</head>
<style>
	<style>
	h1 {
		margin-right: 10px;
		margin-top: 5px;
		font-size: 20px;
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
</style>
</style>
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

<div class="container-fluid">
	<div class="row">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="d-flex align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h2>모임 수정</h2>

				<!-- 모임명 -->
				<div class="input-group mb-3">
				    <div class="col-2">
				        <p>모임 이름</p>
				    </div>
				    <div class="col-7">
				        <input type="text" id="group_name" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1" value="${groupDTO.group_name}">
				    </div>
				    <div class="col-1"></div>
				</div>
				
				<!-- 모임 소개 -->
				<div class="input-group">
				    <div class="col-2">
				        <p>모임 소개</p>
				    </div>
				    <div class="col-7">
				        <div class="form-floating">
				            <textarea class="form-control" id="group_introduce" style="height: 300px">${groupDTO.group_introduce}</textarea>
				        </div>
				    </div>
				    <div class="col-1"></div>
				</div>
				
				<!-- 모임 주의사항 -->
				<div class="input-group">
				    <div class="col-2">
				        <p>모임 주의사항</p>
				    </div>
				    <div class="col-7">
				        <div class="form-floating">
				            <textarea class="form-control" id="group_caution" style="height: 300px">${groupDTO.group_caution}</textarea>
				        </div>
				    </div>
				    <div class="col-1"></div>
				</div>

				<br/>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>장소 정보</p>
					</div>
					<div class="col-7">
						<div class="card" style="width: 18rem;">
						  <img src="#" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">${spaceDTO.space_name}</h5>
						    <h6 class="card-title">${spaceDTO.space_region}</h6>
						    <h6 class="card-title">수용 인원 최소 ${spaceDTO.space_min}명 ~ 최대 ${spaceDTO.space_max}명</h6>
						  </div>
						</div>
					</div>
					<div class="col-1">
					</div>
				</div>
				<form action="/group/paymentRegistration.go" method="POST">
        			<input type="hidden" name="space_no" value="${space_no}"/>
        			<input type="hidden" name="user_id" value=""/>
        			<input type="hidden" name="group_name" value=""/>
        			<input type="hidden" name="group_people" value=""/>
        			<input type="hidden" name="group_introduce" value=""/>
        			<input type="hidden" name="group_caution" value=""/>
        			<input type="hidden" name="group_starttime" value=""/>
        			<input type="hidden" name="group_endtime" value=""/>
        			<input type="hidden" name="group_lowpeople" value=""/>
        			<input type="hidden" name="group_highpeople" value=""/>
					<button type="button" name="reservation_btn" class="btn btn-success">등록하기</button>
				</form>
				<button type="button" name="exit" class="btn btn-success">나가기</button>

			<br/>
			<br/>
		</main>
	</div>
</div>
</body>
</html>