<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    
	
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

	<!-- 페이지 내용 -->
     <h2>장소 등록</h2>

     <!-- 등록 form -->
    <div class="container">
		<div class="row gx-5">
		    <div class="col-3">장소명</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="name_input"  class="form-control" placeholder="장소명을 입력해주세요" aria-describedby="inputGroup-sizing-default">	
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
				  <input type="text" id="price_input" class="form-control" placeholder="정확한 금액을 입력해주세요" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 주소</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="addr_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">사용 가능 최대 인원</div>
		    <div class="col-2">
				<select id="max_select" class="form-select" size="1">
				   	<option selected>1</option>
					<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				  
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">사용 가능 최소 인원</div>
		    <div class="col-2">
				<select id="min_select" class="form-select" size="1">
				   	<option selected>1</option>
					<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>		  
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
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	<div class="col">
				<label>화요일</label>
				<select id="min_select" class="form-select-inline" size="1">
			   		<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	<div class="col">
				<label>수요일</label>
				<select id="min_select" class="form-select-inline" size="1">
			   		<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	<div class="col">
				<label>목요일</label>
				<select id="min_select" class="form-select-inline" size="1">
			   		<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	<div class="col">
				<label>토요일</label>
				<select id="min_select" class="form-select-inline" size="1">
			   		<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	<div class="col">
				<label>일요일</label>
				<select id="min_select" class="form-select-inline" size="1">
			   		<option value="1">	1 </option>
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
				 </select>
				 <span class="mt-1 mr-1 ml-1"> ~ </span>
				<select id="min_select" class="form-select-inline" size="1">
					 <option value="2">	2 </option>
					 <option value="3">	3 </option>
					 <option value="4">	4 </option>
					 <option value="5">	5 </option>
					 <option value="6">	6 </option>
					 <option value="7">	7 </option>
					 <option value="8">	8 </option>
					 <option value="9">	9 </option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>
					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>
					 <option value="20">20</option>				
					 <option value="21">21</option>				
					 <option value="22">22</option>				
					 <option value="23">23</option>				
					 <option value="24">24</option>				
				 </select>
		    	</div>
		    	
		    	
			</div>
		 </div> 
		 <div class="row gx-5">
		    <div class="col-3">장소 소개</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="intro_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div> 
 		 <div class="row gx-5">
		    <div class="col-3">장소 전화번호</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="phone_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">시설 안내</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="guide_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 유의사항</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="notice_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
  		<div class="row gx-5">
	    	<div class="col-3">대표 이미지</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="mainImg_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" class="btn btn-primary">등록</button>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
		<div class="row gx-5">
	    	<div class="col-3">이미지</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="img_input" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" class="btn btn-primary">등록</button>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
		<div class="row gx-5">
		    <div class="col-10"></div>
		    <div class="col-2">
		    	<button type="button" id="register_btn" class="btn btn-primary">등록</button>
		    </div>
					
		</div>
		
	</div>  
    <!-- 등록 form_End -->
      </div>
    </main>
  </div>
</div>

	

</body>
<script>
$(document).ready(function() {
	$('#register_btn').click(function(){
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
	});
});
</script>
</html> 