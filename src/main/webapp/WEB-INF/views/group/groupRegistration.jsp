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
	#btn{
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
	<div class="row">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="d-flex align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h2>모임 등록</h2>
			</div>
				<div class="row gx-5">
				    <!-- 모임 이름 -->
				    <div class="input-group mb-3">
				    	<div class="col-2">
				        	<p>모임 이름</p>
				        </div>
				        <div class="col-7">
				        	<input type="text" id="group_name" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1">
				        </div>
				        <div class="col-1"></div>
				    </div>
				</div>
				<br/>
				<div class="row gx-5">
					<div class="input-group mb-3">
						<div class="col-2">
							<p>모임 최소 인원</p>
						</div>
						<div class="col-7">
							<select id="group_lowpeople" class="form-select" aria-label="Default select example">
								<option selected disabled>최소 인원 선택</option>
							</select>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 최대 인원</p>
					</div>
					<div class="col-7">
						<select id="group_highpeople" class="form-select" aria-label="Default select example">
						  <option selected disabled>최대 인원 선택</option>
						</select>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 소개</p>
					</div>
					<div class="col-7">
						<div class="form-floating">
						  <textarea class="form-control" id="group_introduce" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 주의사항</p>
					</div>
					<div class="col-7">
						<div class="form-floating">
						  <textarea class="form-control" id="group_caution" style="height: 300px"></textarea>
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
						<div class="card w-100">
						  <img src="${photoSrc}" class="img-fluid rounded-start w-100" style="height: 500px;" alt="...">
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
				<div class="row" style="text-align: center;">
					<form style="width: 200px;text-align: center;margin-right: 20px;margin-left: 30%;" action="/group/paymentRegistration.go" method="POST">
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
						<button id="btn" style="width: 200px;" type="button" name="reservation_btn" class="btn btn-success">등록하기</button>
					</form>
					<button id="btn" style="width: 200px;text-align: center;" type="button" name="exit" class="btn btn-success justify-content-sm-center">나가기</button>
				</div>
			<br/>
			<br/>
		</main>
	</div>
</div>
</body>
<script>
	$(document).ready(function() {
		init();
	});
	function init() {
	    for (var i = parseInt(${spaceDTO.space_min}); i <= parseInt(${spaceDTO.space_max}); i++) {
	        var option = $("<option>", {
	            value: i,
	            text: i
	        });
	        
	        $('#group_lowpeople').append(option);
	    }
	    for (var i = parseInt(${spaceDTO.space_min}); i <= parseInt(${spaceDTO.space_max}); i++) {
	        var option = $("<option>", {
	            value: i,
	            text: i
	        });
	        
	        $('#group_highpeople').append(option);
	    }
		$('button[name="reservation_btn"]').click(function(){
			let form = {
				space_no			: '${spaceDTO.space_no}',
				user_id				: '${user_id}',
			    group_name			: $('#group_name').val(),
			    group_people		: ${group_people},
			    group_introduce		: $('#group_introduce').val(),
			    group_caution		: $('#group_caution').val(),			     
			    group_starttime		: '${start_date}',
			    group_endtime   	: '${end_date}',
			    group_lowpeople 	: parseInt($('#group_lowpeople').val()),
			    group_highpeople	: parseInt($('#group_highpeople').val())
			};
			console.log(form);
			if (form.group_highpeople < form.group_lowpeople) {
				alert('모집 최소 인원은 최대 인원보다 크지 않아야 합니다.');
			} else if (form.group_introduce == '') {
				alert('모임 소개 내용을 작성해주세요.');
			} else if (form.group_caution == '') {
				alert('모임 주의사항을 작성해주세요.');
			} else if (form.group_name == '') {
				alert('모임의 이름을 작성해주세요.');
			} else {
				$('input[name="space_no"]').val(form.space_no);
				$('input[name="user_id"]').val(form.user_id);
				$('input[name="group_name"]').val(form.group_name);
				$('input[name="group_people"]').val(form.group_people);
				$('input[name="group_introduce"]').val(form.group_introduce);
				$('input[name="group_caution"]').val(form.group_caution);
				$('input[name="group_starttime"]').val(form.group_starttime);
				$('input[name="group_endtime"]').val(form.group_endtime);
				$('input[name="group_lowpeople"]').val(form.group_lowpeople);
				$('input[name="group_highpeople"]').val(form.group_highpeople);
				$('form').submit();
			}
		});
		$('button[name="exit"]').click(function(){
			
			console.log(1);
		});
	}
</script>
</html>