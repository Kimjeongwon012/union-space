<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>문의글 작성</title>
</head>
<body>
	<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">AdminPage</a>
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

    <!-- 사이드바 메뉴 -->
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              예약 전체 내역 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              회원 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              포인트 충전 및 사용 내역
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/space/list">
              <span data-feather="users"></span>
              등록한 장소 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/space/register.go">
              <span data-feather="bar-chart-2"></span>
              <b>장소 등록</b>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers"></span>
              장소별 Q&A
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- 사이드바 메뉴_End -->
    
	
	<!-- 페이지 내용 -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
     <h2>문의글 작성</h2>
     
     <!-- 등록 form -->
    <form action="/space/register" method="post" enctype="multipart/form-data">
    <div class="container">
		<div class="row gx-5 pb-3">
		    <div class="col-3">작성자</div>
		    <div class="col-6">
				<div class="input-group">
				  <input type="text" name="space_name" class="form-control" placeholder="장소명을 입력해주세요" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
	 	</div>
		<div class="row gx-5 pb-3">
		    <div class="col-3">비밀번호</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="number" name="space_point" class="form-control" placeholder="삭제 확인할 비밀번호를 입력해주세요." >	
				</div>
		    </div>
		 </div>
		<div class="row gx-5 pb-3">
		    <div class="col-3">비밀번호 확인</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="number" name="space_point" class="form-control" placeholder="동일한 비밀번호를 입력해주세요." >	
				</div>
		    </div>
		 </div>
		 <div class="row gx-5 mb-3">
		    <div class="col-3">장소 지역</div>
		    <div class="col-2">
				<select id="region_select" name="space_region" class="form-select" size="1">
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">문의 내용</div>
		    <div class="col-6">
				<div  class="form-floating">
					<textarea name="space_intro_content" class="form-control" placeholder="Leave a comment here" ></textarea>
					<label for="floatingTextarea">장소 소개</label>
				</div>
		    </div>
		 </div> 
		<div class="row gx-5">
		    <div class="col-10"></div>
		    <div class="col-2">
		    	<button class="btn btn-primary">저장</button>
		    	<button class="btn btn-primary">닫기</button>
		    </div>
		</div>
	</div> 
	</form>
    <!-- 등록 form_End -->
    </main>
  </div>
</div>

	

</body>
<script>
	// 변수
	var addr_flag = false;
	
	
		
	$(document).ready(function() {
		
		// <select> 생성		
		let content;
		
		// 장소 지역
		const region = ['강남구', '강북구', '강서구', '관악구', '구로구', '금천구', '종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', '성북구', '도봉구', '노원구', '은평구', '서대문구', 
			'마포구', '양천구', '영등포구', '동작구', '서초구', '송파구', '강동구']
		for(let r of region){
			content += "<option value="+r+">"+r+"</option>";
		}
		$('#region_select').append(content);
		
		// 운영시간
		const dayWeek = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
		content = '';
		
		var idx = 0;
		for(const dw of dayWeek){
			content = '<div class="col mb-3"><div class="input-group mb-3"><input type="text" name="space_day" class="form-input" value="'
			content += dw+'" disabled><select name="';
			content += idx+'start" class="startTime_select form-select-inline" size="1">';
			for(var i=1; i<24; i++){
				content += "<option value="+i+">"+i+"</option>";
			}
			content += '</select><span class="mt-1 mr-1 ml-1"> ~ </span>';
			content += '<select name="';
			content += idx+'end" class="endTime_select form-select-inline" size="1">';
			for(var i=2; i<25; i++){
				content += "<option value="+i+">"+i+"</option>";
			}
			content += '</select></div>';
			//console.log(content);
			$('#time_div').append(content);
			idx++;
			
		}
		// 최대/최소 인원_option 생성
		content = '';
		for(var i=1; i<=20; i++){
			content += "<option value="+i+">"+i+"</option>";
		}
		$('#max_select').append(content);
		$('#min_select').append(content);

		// <select> 기본 옵션 설정
		// 지역
		$('#region_select').val('금천구').prop("selected", true);
		// 운영시간
		$('.startTime_select').val('9').prop("selected", true);
		$('.endTime_select').val('22').prop("selected", true);		
		// 최대/최소 인원
		$('#max_select').val('1').prop("selected", true);
		$('#min_select').val('3').prop("selected", true);
		
	});
	
	//event

	//function
	
	
</script>
</html> 