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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<title>장소 상세보기</title>
<style>
    a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; }
    .calendarBtn { cursor:pointer; } 
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
	.table {
		max-width: 100%;
	}
	.table-active {
		background: #ff7f00;
	}
	.table-active td {
		color: white;
		font-size: 15px;
		text-align: center;
		width: 1px;
		padding: 0;
	}
	#reservationPeople {
		width: 150px;
	}
	#reservationSelector button {
		font-size: 30px;
		background: white;
		color: black;
		border: 2px solid gray;
	}
	.btn-success {
		background: blue;
	}
	.arrow-prev,
	.arrow-next {
	    position: relative;
	    float:left;
	    border:1px solid #000;
	    width:30px;
	    height:30px;
	}
	
	.arrow-prev::after {
	    position: absolute;
	    left: 10px; 
	    top: 7px;
	    content: '';
	    width: 15px; /* 사이즈 */
	    height: 15px; /* 사이즈 */
	    border-top: 5px solid #000; /* 선 두께 */
	    border-right: 5px solid #000; /* 선 두께 */
	    transform: rotate(225deg); /* 각도 */
	}
	
	.arrow-next::after {
	    position: absolute;
	    left: 4px; 
	    top: 7px; 
	    content: '';
	    width: 15px; /* 사이즈 */
	    height: 15px; /* 사이즈 */
	    border-top: 5px solid #000; /* 선 두께 */
	    border-right: 5px solid #000; /* 선 두께 */
	    transform: rotate(45deg); /* 각도 */
	}
	#spaceImage{
		border: 1px solid black;
		display: inline-block;
		max-width: 70%;
	}
	/* 별 아이콘 */
	.star-rating label {
	  display: inline-block; /* 라벨을 인라인 블록 요소로 설정하여 가로로 정렬 */
	  font-size: 24px; /* 별 아이콘의 크기 */
	  cursor: default; /* 마우스 커서를 기본 값으로 변경하여 클릭 불가능한 상태로 표시 */
	}
	.star-rating label:before {
	  content: '\2605'; /* 별 아이콘(별 모양) 표시 */
	}
	.reviewStar{
		width: 252px;
		height: 60px;
		left: 5px;
		background: url('/resources/images/siteImg/star_rating.png') 0 0;
		background-position: 0 -73;
	}
	#arrow {
		margin-left: 10px;
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
<br/>
<main class="container-fluid">
    <div class="row gx-5 pb-4">
    	<div class="col-1"></div>
        <div class="col-7">
        	<div class="row">
            	<h2>${spacePage.spaceDTO.space_name}</h2>
            </div>
            <hr/>
            <!-- 사진 -->
            <div class="row">
			  <div class="row d-flex justify-content-sm-center">
				<span class="arrow-prev align-self-center"></span>
				<img src="/resources/images/siteImg/unionSpaceLogo.png" id="spaceImage" class="img-fluid rounded-start" alt="...">
				<span class="arrow-next align-self-center"></span>
			  </div>
            </div>
            <br/>
            
            <!-- 바로가기 -->
            <div class="row">
            	<div class="hstack gap-3 d-flex justify-content-sm-center">
				  <div class="p-2">소개</div>
				  <div class="vr"></div>
				  <div class="p-2">시설 안내</div>
				  <div class="vr"></div>
				  <div class="p-2">유의사항</div>
				  <div class="vr"></div>
				  <div class="p-2">연락처 및 위치</div>
				  <div class="vr"></div>
				  <div class="p-2">모임</div>
				  <div class="vr"></div>
				  <div class="p-2">후기 및 Q&A</div>
				</div>
            </div>
            <br/>
            <br/>
            
            <div class="row gx-10 gy-10">
            	<div class="col-2">
            		<h2>소개</h2>
            	</div>
            	<div class="col-9 w-100">
            		<hr style="border: 1px solid black;">
            	</div>
            	<p>${spacePage.spaceDTO.space_intro_content}</p>
            </div>
			<div class="row gx-10 gy-10">
				<div class="col-3">
            		<h2>시설 안내</h2>
            	</div>
            	<div class="col-8 w-100">
            		<hr style="border: 1px solid black;">
            	</div>
            	<p>${spacePage.spaceDTO.space_guide_content}</p>
            </div>
			<div class="row gx-10 gy-10">
				<div class="col-3">
            		<h2>유의사항</h2>
            	</div>
            	<div class="col-8 w-100">
            		<hr style="border: 1px solid black;">
            	</div>
            	<p>${spacePage.spaceDTO.space_notice_content}</p>
            </div>
			<div class="row gx-10 gy-10">
				<div class="col-4">
            		<h2>연락처 및 위치</h2>
            	</div>
            	<div class="col-7 w-100">
            		<hr style="border: 1px solid black;">
            	</div>
            	<p>연락처 : ${spacePage.spaceDTO.space_contact}</p>
            	<p>주소 : ${spacePage.spaceDTO.space_address}</p>
           		<div id="map" style="width:700px;height:400px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c63937991c5bbcc2e33985708b5a64be"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(${spacePage.spaceDTO.space_latitude}, ${spacePage.spaceDTO.space_longitude}),
						level: 3
					};
			
					var map = new kakao.maps.Map(container, options);
				</script>
            </div>
			<div class="row gx-10 gy-10">
				<div class="row">				
					<div class="col-2">
	            		<h2>후기</h2>
	            	</div>
	            	<div class="col-7 w-100">
	            		<hr style="border: 1px solid black;">
	            	</div>
				</div>
				<div class="row">			
					<div class="col-10">
						<div id="reviewList">
						</div>
					</div>	
					<div class="col-2">				
						<select id="reviewSort" class="form-select">
							<option selected>최신순</option>
							<option>과거순</option>
							<option>별점높은순</option>
							<option>별점낮은순</option>
						</select>
					</div>
				</div>
				<div class="row">
	                <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
	                	<ul class="pagination" id="reviewPagination"></ul>
	                </nav>     
				</div>
            </div>
            <div class="row gx-10 gy-10">
				<div class="row">
					<div class="col-2">
						<h2>Q&A</h2>
					</div>
					<div class="col-10" style="justify-content: flex-end;">
						<form action="/space/writeQnaForm.go" method="POST">
							<input type="hidden" name="space_no" value="${space_no}"/>
						    <button id="qnaWriteBtn" class="btn w-30 h-100 fs-100 btn-primary" style="float:right;">질문 작성</button>
						</form>
					</div>
	            	<div class="col-7 w-100">
	            		<hr style="border: 1px solid black;">
	            	</div>
				</div>
				<div class="row">			
					<div class="col-10">
						<div id="qnaList">
						</div>
					</div>	
					<div class="col-2">				
						<select id="qnaSort" class="form-select">
							<option selected>최신순</option>
							<option>과거순</option>
						</select>
					</div>
				</div>
				<div class="row">
	                <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
	                	<ul class="pagination" id="questionpagination"></ul>
	                </nav>     
				</div>
            </div>
        </div>
        
        <!-- 예약 사이드 메뉴(R) -->
        <div class="col-2">
        	<div class="row gx-10 gy-10">
        		<h5>운영 시간</h5>
        		<hr/>
				<c:forEach items="${spacePage.spaceOperatingDTO}" var="s">
				    <p><span class="o_day">${s.space_day}</span> : <span class="o_start_time">${s.space_start_time}</span>시 ~ <span class="o_end_time">${s.space_end_time}</span>시</p>
				</c:forEach>
        	</div>
	        	<div class="row gx-10 gy-10">
	        		<div class="col">
		        		<h5>날짜 선택</h5>
		        		<hr/>
					    <table class="scriptCalendar">
					        <thead>
					            <tr>
					                <td class="calendarBtn" id="btnPrevCalendar">&#60;&#60;</td>
					                <td colspan="5">
					                    <span id="calYear">YYYY</span>년
					                    <span id="calMonth">MM</span>월
					                </td>
					                <td class="calendarBtn" id="nextNextCalendar">&#62;&#62;</td>
					            </tr>
					            <tr>
					                <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
					            </tr>
					        </thead>
					        <tbody></tbody>
					    </table>
				    </div>
	        	</div>
        	<div class="row gx-10 gy-10">
        		<h5>시간 선택</h5>
        		<hr/>
        		<table class="table table-bordered">
        			<tbody>
        				<tr class="table-active">
        					<td id="time_0">0</td>
        					<td id="time_1">1</td>
        					<td id="time_2">2</td>
        					<td id="time_3">3</td>
        					<td id="time_4">4</td>
        					<td id="time_5">5</td>
        					<td id="time_6">6</td>
        					<td id="time_7">7</td>
        				</tr>
        				<tr class="table-active">
        					<td id="time_8">8</td>
        					<td id="time_9">9</td>
        					<td id="time_10">10</td>
        					<td id="time_11">11</td>
        					<td id="time_12">12</td>
        					<td id="time_13">13</td>
        					<td id="time_14">14</td>
        					<td id="time_15">15</td>
        				</tr>
        				<tr class="table-active">
        					<td id="time_16">16</td>
        					<td id="time_17">17</td>
        					<td id="time_18">18</td>
        					<td id="time_19">19</td>
        					<td id="time_20">20</td>
        					<td id="time_21">21</td>
        					<td id="time_22">22</td>
        					<td id="time_23">23</td>
        				</tr>
        			</tbody>	
        		</table>
        		<div id="seletecd_date">
	        		<p>예약 날짜와 시간을 선택해주세요</p>
        		</div>
        		<hr/>
        	</div>
        	<!-- 예약 인원 선택 -->
        	<div class="row gx-10 gy-10">
        		<h5>예약 인원</h5>
        		<div id="reservationSelector" class="btn-group d-flex justify-content-center">
			    	<button class="btn btn-primary" id="minus"type="button">-</button>
			    	<!-- 아래 버튼의 값이 장소 최소 대여 인원으로 들어가야한다 -->
			    	<button id="choice_group_people" class="btn btn-primary">${spacePage.spaceDTO.space_min}</button>
			    	<button class="btn btn-primary" id="plus" type="button">+</button>
			    </div>
			    <p id="choice_group_people_msg"></p>
			    <hr/>
        	</div>
        	<div class="row gx-10 gy-10">
        		
        		<h5>대여 포인트 금액</h5>
        		<p class="text-end">${spacePage.spaceDTO.space_point}</p>
        	</div>
        	<div class="row gx-10 gy-10">
        		<!-- submit 으로 수정해야한다 -->
				<form action="/space/reservation.go" method="POST">
        			<input type="hidden" name="space_no" value="${space_no}"/>
        			<input type="hidden" name="start_date" value=""/>
        			<input type="hidden" name="end_date" value=""/>
        			<input type="hidden" name="group_people" value=""/>
					<button type="button" class="btn btn-success" name="space_reservation_btn">바로 예약하기</button>
				</form>
					<!-- <input type= button class="btn btn-success" name="space_reservation_btn" onclick="location.href='./boardList.do'"/> -->
					<br/>
				<form action="/group/register.go" method="POST">
        			<input type="hidden" name="space_no" value="${space_no}"/>
        			<input type="hidden" name="start_date" value=""/>
        			<input type="hidden" name="end_date" value=""/>
        			<input type="hidden" name="group_people" value=""/>
					<button type="button" name="group_reservation_btn" class="btn btn-success">모임 생성하기</button>
				</form>
				<button type="button" onclick="loginSession()">강제 로그인/로그아웃</button>        	
        	</div>
        </div>
        <!-- 예약 사이드 메뉴(R) 끝 -->
        
    </div>
</main>
<script>
	/*
	* 모임 예약 등록 페이지 이동
	*/
	var $choice_year = $('#calYear');
	var $choice_month = $('#calMonth');
	var $choice_day = $('.choiceDay');
	var $choice_group_people = $('#choice_group_people');
	var $choice_starttime = $('#seletecd_start_time');
	var $choice_endtime = $('#seletecd_end_time');
	
	$(document).ready(function() {
		$('button[name="space_reservation_btn"]').click(function(){
			//console.log("장소 대여 예약 버튼 클릭(개인)");
			let choice = {
			    year			: $('#calYear').text(),
			    month			: $('#calMonth').text(),
			    day				: $('.choiceDay').text(),
			    group_people	: $('#choice_group_people').text(),
			    starttime		: $('#seletecd_start_time').text(),
			    endtime			: $('#seletecd_end_time').text()
			};
			//console.log(choice);
			if (choice.day == '') {
				alert("날짜를 선택해주세요.");
			} else if (choice.starttime == '' || choice.endtime == '') {
				alert("시간을 선택해주세요.");
			} else if (choice.group_people == '') {
				alert("인원을 선택해주세요.");
			} else {
				var start_date = new Date(choice.year, parseInt(choice.month) - 1, choice.day, choice.starttime);
				var end_date = new Date(choice.year, parseInt(choice.month) - 1, choice.day, choice.endtime);
				var group_people = parseInt($('#choice_group_people').text());
				$('input[name="start_date"]').val(start_date.toISOString().split('T')[0] + ' ' + choice.starttime + ':00:00');
				$('input[name="end_date"]').val(end_date.toISOString().split('T')[0] + ' ' + choice.endtime + ':00:00');
				$('input[name="group_people"]').val(group_people);
				console.log(start_date.toISOString().split('T')[0] + ' ' + choice.starttime + ':00:00');
				console.log(end_date.toISOString().split('T')[0] + ' '  + choice.endtime + ':00:00');
				$('form').submit();
			}
		});
		
		$('button[name="group_reservation_btn"]').click(function(){
			console.log("모임 등록 버튼 클릭");
			let choice = {
			    year			: $('#calYear').text(),
			    month			: $('#calMonth').text(),
			    day				: $('.choiceDay').text(),
			    group_people	: $('#choice_group_people').text(),
			    starttime		: $('#seletecd_start_time').text(),
			    endtime			: $('#seletecd_end_time').text()
			};
			//console.log(choice);
			var start_date = new Date(choice.year, parseInt(choice.month) - 1, choice.day, choice.starttime);
			var end_date = new Date(choice.year, parseInt(choice.month) - 1, choice.day, choice.endtime);
			if (choice.day == '') {
				alert("날짜를 선택해주세요.");
			} else if (choice.starttime == '' || choice.endtime == '') {
				alert("시간을 선택해주세요.");
			} else if (choice.group_people == '') {
				alert("인원을 선택해주세요.");
			} else if (start_date.getTime() - new Date().getTime() < 5 * 24 * 60 * 60 * 1000) {
				alert('모임 예약은 최소 5일 후부터 가능합니다.');
			} else {
				var group_people = parseInt($('#choice_group_people').text());
				console.log(start_date.toISOString().split('T')[0] + ' ' + choice.starttime + ':00:00');
				console.log(end_date.toISOString().split('T')[0] + ' '  + choice.endtime + ':00:00');
				$('input[name="start_date"]').val(start_date.toISOString().split('T')[0] + ' ' + choice.starttime + ':00:00');
				$('input[name="end_date"]').val(end_date.toISOString().split('T')[0] + ' ' + choice.endtime+ ':00:00');
				$('input[name="group_people"]').val(group_people);
				$('form').submit();
			}
			// 로그인 상태 확인
			
			// - 비회원, 로그인 페이지로 이동
			// - 회원인, 모임 등록 페이지에 장소 정보 묶어서 이동
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    buildCalendar();
	    
	    document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
	        prevCalendar();
	    });
	    
	    document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
	        nextCalendar();
	    });
	});
	
	/* 
	* 달력 스크립트 시작 
	*/
	
	var toDay = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 toDay에 Date 객체를 넣어줌
	var nowDate = new Date();  // @param 전역 변수, 실제 오늘날짜 고정값
    var daysOfWeek = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	/**
	 * @brief   이전달 버튼 클릭시
	 */
	function prevCalendar() {
	    this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
	    buildCalendar();    // @param 전월 캘린더 출력 요청
	}
	
	/**
	 * @brief   다음달 버튼 클릭시
	 */
	function nextCalendar() {
	    this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
	    buildCalendar();    // @param 명월 캘린더 출력 요청
	}
	
	/**
	 * @brief   캘린더 오픈
	 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
	 */
	function buildCalendar() {
	
	    let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1);
	    let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0);
	
	    let tbCalendar = document.querySelector(".scriptCalendar > tbody");
	
	    document.getElementById("calYear").innerText = toDay.getFullYear();                       // @param YYYY월
	    document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);   // @param MM월
	    
	
	    // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
	    while(tbCalendar.rows.length > 0) {
	        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	    }
	
	    // @param 첫번째 개행
	    let row = tbCalendar.insertRow();
	
	    // @param 날짜가 표기될 열의 증가값
	    let dom = 1;
	
	    // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
	    //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
	    let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();
	
	    // @param 달력 출력
	    // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
	    for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
	
	        let column = row.insertCell();
	
	        // @param 평일( 전월일과 익월일의 데이터 제외 )
	        if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
	
	            // @param 평일 날짜 데이터 삽입
	            column.innerText = autoLeftPad(day, 2);
	
	            // @param 일요일인 경우
	            if(dom % 7 == 1) {
	                column.style.color = "#FF4D4D";
	            }
	
	            // @param 토요일인 경우
	            if(dom % 7 == 0) {
	                column.style.color = "#4D4DFF";
	                row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
	            }
	
	        }
	
	        // @param 평일 전월일과 익월일의 데이터 날짜변경
	        else {
	            let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
	            column.innerText = autoLeftPad(exceptDay.getDate(), 2);
	            column.style.color = "#A9A9A9";
	        }
	
	        // @brief   전월, 명월 음영처리
	        // @details 현재년과 선택 년도가 같은경우
	        if(toDay.getFullYear() == nowDate.getFullYear()) {
	
	            // @details 현재월과 선택월이 같은경우
	            if(toDay.getMonth() == nowDate.getMonth()) {
	
	                // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
	                if(nowDate.getDate() > day && Math.sign(day) == 1) {
	                    column.style.backgroundColor = "#E5E5E5";
	                }
	
	                // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
	                else if(nowDate.getDate() < day && lastDate.getDate() >= day) {
	                    column.style.backgroundColor = "#FFFFFF";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	
	                // @details 현재일인 경우
	                else if(nowDate.getDate() == day) {
	                    column.style.backgroundColor = "#FFD56D";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	
	            // @details 현재월보다 이전인경우
	            } else if(toDay.getMonth() < nowDate.getMonth()) {
	                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                    column.style.backgroundColor = "#E5E5E5";
	                }
	            }
	
	            // @details 현재월보다 이후인경우
	            else {
	                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                    column.style.backgroundColor = "#FFFFFF";
	                    column.style.cursor = "pointer";
	                    column.onclick = function(){ calendarChoiceDay(this); }
	                }
	            }
	        }
	
	        // @details 선택한년도가 현재년도보다 작은경우
	        else if(toDay.getFullYear() < nowDate.getFullYear()) {
	            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                column.style.backgroundColor = "#E5E5E5";
	            }
	        }
	
	        // @details 선택한년도가 현재년도보다 큰경우
	        else {
	            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
	                column.style.backgroundColor = "#FFFFFF";
	                column.style.cursor = "pointer";
	                column.onclick = function(){ calendarChoiceDay(this); }
	            }
	        }
	        dom++;
	    }
	}
	
	/**
	 * @brief   날짜 선택
	 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
	 */
	var select_time = [-1, -1];
	function calendarChoiceDay(column) {
	
	    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
	    if(document.getElementsByClassName("choiceDay")[0]) {
	        
	        // @see 금일인 경우
	        if(document.getElementById("calMonth").innerText == autoLeftPad((nowDate.getMonth() + 1), 2) && document.getElementsByClassName("choiceDay")[0].innerText == autoLeftPad(toDay.getDate(), 2)) {
	            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFD56D";  
	        }
	        
	        // @see 금일이 아닌 경우
	        else {
	            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
	        }
	        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
	    }
	
	    // @param 선택일 체크 표시
	    column.style.backgroundColor = "#6085FF";
	
	    // @param 선택일 클래스명 변경
	    column.classList.add("choiceDay");
	    
	    /*
	    * 선택한 날짜에 아래의 시간 선택 UI에 운영시간을 표시한다(회색:영업전,주황색:영업중)
	    */

	    var choice_day = $('.choiceDay');
	    var parent = choice_day.parent();
	    var d_index = parent.children().index(choice_day);
	    var startTime = 0;
	    var endTime = 0;
	    //console.log("특정한 <td> 요소의 인덱스:", daysOfWeek[d_index]);
	    
	    $(".o_day").each(function() {
	        if ($(this).text() === daysOfWeek[d_index]) {
	            // 선택한 요일의 운영시간을 각각 변수에 저장한다
	            //console.log($(this));
	    	 	// 시작 시간과 종료 시간을 정수로 변환
	    	    startTime = parseInt($(this).next().text());
	    	    endTime = parseInt($(this).next().next().text());
	    	    //console.log(startTime, endTime);
	        }
	    });

	    // 초기화
	    resetChoice();
	    // 시작 시간부터 종료 시간까지 반복하여 배경색 변경
	    if (endTime != 0) {
		    for (var i = startTime; i <= endTime; i++) {
		        $('#time_' + i).css('background-color', '#FFD56D');
		        $('#time_' + i).css('cursor', 'pointer');
		        $('#time_' + i).click(choiceTime);
		    }
	    }
	}
	
	/**
	 * @brief   숫자 두자릿수( 00 ) 변경
	 * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
	 * @param   num     앞에 0을 붙일 숫자 값
	 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
	 */
	function autoLeftPad(num, digit) {
	    if(String(num).length < digit) {
	        num = new Array(digit - String(num).length + 1).join("0") + num;
	    }
	    return num;
	}
	/* 
	* 달력 스크립트 끝 
	*/
</script>
<script>
	/*
	* 시간 선택 스크립트 시작
	*/
	
	var index = 0;

	function choiceTime(e) {
	    var $target = $(e.target);
	    //console.log($target.text());
	    
	    // index를 사용하여 번갈아가며 select_time에 값을 저장
	    select_time[index] = parseInt($target.text());
	    index = (index + 1) % 2;

	    //console.log(select_time);
	    if (select_time[0] != -1 && select_time[1] != -1) {	    	
	    	// 새로운 배열에 선택된 시간을 복사
	    	var sorted_time = select_time.slice();

	    	// 선택된 시간을 오름차순으로 정렬
	    	sorted_time.sort(function(a, b) {
	    	    return a - b;
	    	});
	    	
		    var parent = $('.choiceDay').parent();
		    var d_index = parent.children().index($('.choiceDay'));
		    var startTime = 0;
		    var endTime = 0;
	    	
		    $(".o_day").each(function() {
		        if ($(this).text() == daysOfWeek[d_index]) {
		            // 선택한 요일의 운영시간을 각각 변수에 저장한다
		            //console.log($(this));
		    	 	// 시작 시간과 종료 시간을 정수로 변환
		    	    startTime = parseInt($(this).next().text());
		    	    endTime = parseInt($(this).next().next().text());
		    	    //console.log(startTime, endTime);
		        }
		    });
		    
		    for (var i = startTime; i <= endTime; i++) {
		        $('#time_' + i).css('background-color', '#FFD56D');
		    }
	    	// 선택한 시간은 초록색으로 표시
	    	for (var i = sorted_time[0]; i <= sorted_time[1]; i++) {
		        $('#time_' + i).css('background-color', '#8FFF00');
		    }

	    	$("#seletecd_date").html(`
	    		    <h5>예약 일시 : 
	    		        <span id="seletecd_year">${year}</span>년 
	    		        <span id="seletecd_month">${month}</span>월 
	    		        <span id="seletecd_day">${day}</span>일 
	    		        <span id="seletecd_start_time">${start_time}</span>시부터 
	    		        <span id="seletecd_end_time">${end_time}</span>까지 입니다
	    		    </h5>`);
	    	// 시작 시간과 종료 시간을 각각의 위치에 표시
	    	$('#seletecd_start_time').text(sorted_time[0]);
	    	$('#seletecd_end_time').text(sorted_time[1]);
		    $('#seletecd_year').text($('#calYear').text());
		    $('#seletecd_month').text($('#calMonth').text());
		    $('#seletecd_day').text($('.choiceDay').text());
		    
	    }
	}
	/*
	* 시간 선택 스크립트 끝
	*/
	function resetChoice() {
		//console.log($('#seletecd_date').html());
		select_time[0] = -1;
		select_time[1] = -1;
		$('.table-bordered td').css('background-color', '#E7E9EE');
	    $('.table-bordered td').css('cursor', 'default');
	    $('.table-bordered td').off('click');
		$('#seletecd_date').html(`<p>예약 날짜와 시간을 선택해주세요</p>`);
	}
</script>
<script>
	/*
	* 예약 인원 수 선택 시작
	*/
	
	
	$('#minus').click(function(){
		//console.log($choice_group_people);
		if(${spacePage.spaceDTO.space_min} < parseInt($choice_group_people.text())) {
			$choice_group_people.text(parseInt($choice_group_people.text()) - 1);
		} else {
			$('#choice_group_people_msg').text('예약하려는 인원 수는 대여 장소의 최소 인원보다 많아야 합니다.');
		}
	});
	$('#plus').click(function(){
		if(parseInt($choice_group_people.text()) < ${spacePage.spaceDTO.space_max}) {
			$choice_group_people.text(parseInt($choice_group_people.text()) + 1);
		} else {
			$('#choice_group_people_msg').text('예약하려는 인원 수는 대여 장소의 최대 인원보다 적어야 합니다.');
		}
	});
	/*
	* 예약 인원 수 선택 끝
	*/
</script>
<script>
</script>
<script>
	/*
	* 강제 로그인 스크립트 시작
	*/
	function loginSession() {
		$.ajax({
			type:'post', 
			url:'/forceLogin.ajax', 
			success:function(response){ 
				console.log(response);
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
	/*
	* 강제 로그인 스크립트 끝
	*/
</script>
<script>
	/*
	* 후기 목록 스크립트 시작
	*/
	var reviewShowPageIndex = 1;
	var qnaShowPageIndex = 1;
	
	reviewPagination(1);
	questionPagination(1);
	
    $("#reviewSort").change(function() {
    	reviewPagination(reviewShowPageIndex);
    });
	
    $("#qnaSort").change(function() {
    	questionPagination(qnaShowPageIndex);
    });

	function reviewPagination(startpage) {
		$.ajax({
			type:'post', 
			url:'/space/reviewPagination.ajax',  
			data:{
				'page':startpage,
				'space_no':${spacePage.spaceDTO.space_no},
				'sort':$('#reviewSort').val()
			},
			dataType:'json',
			success:function(data){ 
				//console.log(data);
				drawReviewList(data.reviewList);
	            $('#reviewPagination').twbsPagination({
					startPage:startpage,       //시작페이지
					totalPages:data.totalPages,    //총 페이지 갯수
					visiblePages:5, // 보여줄 페이지 수 [1][2][3][4][5] <<이렇게 나옴
					onPageClick:function(evt, clickPageIdx){
						// 페이지 이동 번호 클릭시 이벤트 발동
						reviewPagination(clickPageIdx);
					}
	            }); 
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
	
	function drawReviewList(reviewList){
		var content = '';
		for (item of reviewList) {
		    content += '<div class="card w-100">';
		    content += '<div class="card-body">';
		    content += '<div class="d-flex">';
		    content += '<div class="flex-fill">';
		    content += '<h5 class="card-title">' + item.user_id + '</h5>';
		    content += '<p class="card-text">' + item.review_content + '</p>';
		    content += '</div>';
		    content += '<div class="float-end">';
		    content += '<div class="reviewStar">' + item.review_score + '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '<br/>';
		}
		$('#reviewList').html(content);
		$('.reviewStar').each(function() {
		    var textValue = parseInt($(this).text()); // 요소의 text 값을 정수로 변환하여 가져옴
		    var yPosition = 73 * textValue - 729; // y축 위치 계산
		    //console.log(yPosition);
		    // 요소의 바로 위에 있는 div의 background-position 변경
		    $(this).css('background-position', '0 ' + yPosition + 'px');
		    $(this).text('');
		});
	}
	/*
	* 리뷰 목록 스크립트 끝
	*/
	/*
	* QnA 목록 스크립트 시작
	*/
	function questionPagination(startpage) {
		$.ajax({
			type:'post', 
			url:'/space/qnaPagination.ajax',  
			data:{
				'page':startpage,
				'space_no':${spacePage.spaceDTO.space_no},
				'sort':$('#qnaSort').val()
			},
			dataType:'json',
			success:function(data){ 
				console.log(data);
				drawQuestionList(data.questionList);
	            $('#questionpagination').twbsPagination({
					startPage:startpage,       //시작페이지
					totalPages:data.totalPages,    //총 페이지 갯수
					visiblePages:5, // 보여줄 페이지 수 [1][2][3][4][5] <<이렇게 나옴
					onPageClick:function(evt, clickPageIdx){
						// 페이지 이동 번호 클릭시 이벤트 발동
						questionPagination(clickPageIdx);
					}
	            }); 
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
	
	function drawQuestionList(questionList){
		var content = '';
		console.log(questionList);
		for (question of questionList) {
			content += '<div class="row">';
		    content += '<div class="card w-100">';
		    content += '<div class="card-body">';
		    content += '<div class="d-flex">';
		    content += '<div class="flex-fill">';
		    content += '<h5 class="card-title">' + question.user_id + '</h5>';
		    content += '<p class="card-text">' + question.question_content + '</p>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '<div class="col-1">';
		    content += '<img id="arrow" src="/resources/images/siteImg/arrow.png"/>';
		    content += '</div>';
		    content += '<div class="col-11">';
		    content += '<div class="card w-100">';
		    content += '<div class="card-body">';
		    content += '<div class="d-flex">';
		    content += '<div class="flex-fill">';
		    if (question.spaceAnswerDTO == null) {
		    	content += '<h5 class="card-title"> 관리자가 답변을 작성하지 않았습니다.</h5>';
		    } else {
		    	content += '<h5 class="card-title">' + question.spaceAnswerDTO.space_content + '</h5>';	
		    }
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '</div>';
		    content += '<br/>';
		}
		$('#qnaList').html(content);
	}
	/*
	* QnA 목록 스크립트 끝
	*/
</script>
<script>
</script>
</body>
</html>

