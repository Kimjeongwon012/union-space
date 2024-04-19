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

<title>장소 등록</title>
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
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              등록한 장소 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              장소 등록
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
     <h2>장소 등록</h2>
     
     <!-- 등록 form -->
    <form action="write" method="post" enctype="multipart/form-data">
    <div class="container">
		<div class="row gx-5">
		    <div class="col-3">장소명</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="name_input" name="space_name" class="form-control" placeholder="장소명을 입력해주세요" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
	 	</div>
		<div class="row gx-5 pb-4">
		    <div class="col-3">장소 유형</div>
		    <div class="col-6">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
				  <label class="form-check-label" for="inlineRadio1">회의실</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">스터디룹</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">파티룸</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">카페</label>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
	  	</div>
		<div class="row gx-5">
		    <div class="col-3">장소 대여 금액</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="price_input" name="space_name" class="form-control" placeholder="정확한 금액을 입력해주세요" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 주소</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="addr_input" name="space_address" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">사용 가능 최대 인원</div>
		    <div class="col-2">
				<select id="max_select" name="space_max" class="form-select" size="1">
				   	<option selected>1</option>
					<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">사용 가능 최소 인원</div>
		    <div class="col-2">
				<select id="min_select" name="space_min" class="form-select" size="1">
				   	<option selected>1</option>
					<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>		  
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">운영 시간</div>
		    <div class="col-8 pb-3">
		    	<div class="col">
				<label>월요일</label>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="1">	1 </option>
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
		    	</div>
			</div>
		 </div> 
		 <div class="row gx-5">
		    <div class="col-3">장소 소개</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="intro_input" name="space_intro_content" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div> 
 		 <div class="row gx-5">
		    <div class="col-3">장소 전화번호</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="phone_input" name="space_contact" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">시설 안내</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="guide_input" name="space_guide_content" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 유의사항</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="notice_input" name="space_notice_content" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
  		<div class="row gx-5">
	    	<div class="col-3">대표 사진</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="file" id="mainImg_input" class="form-control" multiple="multiple" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" id="mainImg_btn" class="btn btn-primary" >등록</button>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
		<div class="row gx-5">
	    	<div class="col-3">장소 사진</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="file" id="img_input" class="form-control" multiple="multiple" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" id="img_btn" class="btn btn-primary" >등록</button>
				</div>
		    </div>
		    <div class="col-1"></div>
		</div>
		<div class="row gx-5">
		    <div class="col-10"></div>
		    <div class="col-2">
		    	<button type="button" id="register_btn" class="btn btn-primary" onclick="addSpace()">저장</button>
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

	$(document).ready(function() {
	});
	
	//event
/* 	 $('#mainImg_btn').on('click', uploadImg($('#mainImg_input')));
	 $('#img_btn').on('click', uploadImg($('#img_input')));
 */
	//function
	// 장소 추가 버튼 클릭
	/* function addSpace(){
		console.log("장소 등록 버튼 클릭");
		let param = {
				space_name				: $('#name_input').val(),
				space_type				: $('input[name=toggle]:checked').val(),
				space_point				: $('#price_input').val(),
				space_address			: $('#addr_input').val(),
				space_region			: "",
				space_latitude			: 0.0,
				space_longitude			: 0.0,
				space_min				: $('#min_select').val(),
				space_max				: $('#max_select').val(),
				space_intro_content		: $('#intro_input').val(),
				space_guide_content		: $('#guide_input').val(),
				space_notice_content	: $('#notice_input').val(),
				space_contact			: $('#phone_input').val(),
				space_status			: 1
				
		};
		console.log(param);

	} *///addSpace()_End
	
	// 사진 업로드
	/* function uploadImg(e){
		var btnId = e.target.id;
		var inputId;
		var files;
		
		console.log("사진 업로드 버튼 클릭");
		if(btnId == 'mainImg_btn'){	// 대표 사진인 경우
			inputId = $('#mainImg_input')[0];
			if(inputId.files.length != 1){
				alert('대표 사진은 1장 업로드 해야합니다.');
				return;
			}		
		}else {	// 일반 사진인 경우
			inputId = $('#img_input')[0];
			if(3 < inputId.files.length && inputId.files.length < 8){
				alert('업체 사진은 최소 3장 / 이상 최대 7장 이하 등록해야 합니다.');
				return;
			}
		}
		
		files = inputId.files;
		console.log('files: ', files);
		
 		const formData = new FormData();
 		for(int i=0; i<files.length; i++){
 			formData.append("uploadFile", files[i]); 			
 		}
		
	} *///uploadImg()_End
</script>
</html> 