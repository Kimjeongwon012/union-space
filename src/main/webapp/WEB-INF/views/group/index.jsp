<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<title>MyPage-Point</title>
<style>
	h1 {
		margin-right: 10px;
		margin-top: 5px;
		font-size: 20px;
	}
	.form-input {
		background: white;
	}
	
	.form-input 
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

<div class="container-fluid">
	<div class="row">
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">모임 등록</h1>
			</div>
			<form>
			    <!-- 모임 이름 -->
			    <div class="input-group mb-3">
			        <span class="input-group-text" id="basic-addon1">모임 이름</span>
			        <input type="text" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1">
			    </div>
			    <!-- textarea -->
			    <div class="input-group">
			        <span class="input-group-text">모임 소개</span>
			        <textarea class="form-control" placeholder="모임의 소개 글을 작성해주세요." aria-label="With textarea"></textarea>
			    </div>
				<br/>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">모임 최소 인원</span>
					<select class="form-select" aria-label="Default select example">
					  <option selected disabled>최소 인원 선택</option>
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					</select>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">모임 최대 인원</span>
					<select class="form-select" aria-label="Default select example">
					  <option selected disabled>최대 인원 선택</option>
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					</select>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">모임 소개</span>
					<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
					</div>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">모임 주의사항</span>
					<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
					</div>
				</div>
				<br/>
				<br/>
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">장소 정보</span>
					<h1>장소 등록 완료되면 다시 와서 수정해야한다</h1>
				</div>
			</form>
			<br/>
			<br/>
		</main>
	</div>
</div>
</body>
</html>