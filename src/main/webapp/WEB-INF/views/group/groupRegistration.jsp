<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
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
			<form>
				<div class="row gx-5">
				    <!-- 모임 이름 -->
				    <div class="input-group mb-3">
				    	<div class="col-2">
				        	<p>모임 이름</p>
				        </div>
				        <div class="col-7">
				        	<input type="text" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1">
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
							<select class="form-select" aria-label="Default select example">
							  <option selected disabled>최소 인원 선택</option>
							  <option value="1">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
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
						<select class="form-select" aria-label="Default select example">
						  <option selected disabled>최대 인원 선택</option>
						  <option value="1">1</option>
						  <option value="2">2</option>
						  <option value="3">3</option>
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
						  <textarea class="form-control" id="floatingTextarea2" style="height: 300px"></textarea>
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
						  <textarea class="form-control" id="floatingTextarea2" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 주의사항</p>
					</div>
					<div class="col-7">
						<h1>장소 등록 완료되면 다시 와서 수정해야한다</h1>
					</div>
					<div class="col-1">
					</div>
				</div>
			</form>
			<br/>
			<br/>
		</main>
	</div>
</div>
</body>
</html>