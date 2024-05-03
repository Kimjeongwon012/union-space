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
<title>장소 및 모임 상세보기 페이지</title>
<style>
/* 	div {
		border: 2px solid red;
	} */
	a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:white; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; }
    .calendarBtn { cursor:pointer; } 
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
	.filter {
		display: flex; 
		align-items: center; 
		text-align: center;
		flex-direction: column;
		margin-top: 30px;
	}
	.btn {
		display: block;
		background: white;
		border: 1px solid gray;
		color: black;
	}
	p {
		font-size: 30px;
		font-weight: 300;
	}
	.card-title {
		font-size: 15px;
	}
	.card-text {
		font-size: 15px;
	}
	.spaceCard{
		cursor: pointer;
	}
	.groupCard {
		cursor: pointer;
	}
	.card {
		margin-top: 10px;
	}
</style>
</head>
<body>
	<main class="container-fluid">
		<div class="row" style="height: 200px;z-index: 2;position: relative;">
			<div class="col-3 filter">
				<select id="region_select" class="form-select" aria-label="Default select example">
					<option value="">장소</option>
	             </select>
			</div>
			<div class="col-3 filter">
				<button id="people_btn" class="form-select" style="text-align: left;">인원</button><br/>
				<div id="people_modal" class="row" style="display:none; width: 90%; border: 1px solid gray;background: white;">
					<div style="height: 75px;display: flex;align-content: center;align-items: center;">
						<p style="width: 50%; margin-bottom: 0px; margin-right: 10px;">인원 수</p>
						<button class="btn" id="minus" type="button">-</button>
				    	<button class="btn" id="choice_group_people" style="width: 30%;" value=1>1</button>
				    	<button class="btn" id="plus" type="button">+</button>
					</div>
					<div style="height: 50px; display: flex; justify-content: center;">				
						<button id="people_reset" class="btn btn-primary" style="margin-right: 15px;">초기화</button>
					    <button id="people_select" class="btn btn-primary">인원 수 적용하기</button>
					</div>
				</div>
			</div>
			<div class="col-3 filter">
				<button id="date_btn" class="form-select" style="text-align: left;">날짜</button><br/>
				<div id="date_modal" class="row" style="display:none; background: white;width: 90%;">
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
					<div style="background:white;height: 50px;width: 90%;display: flex;justify-content: center;">				
						<button id="date_reset" class="btn btn-primary" style="margin-right: 15px;">초기화</button>
					    <button id="date_select" class="btn btn-primary">날짜 적용하기</button>
					</div>
				</div>
			</div>
			<div class="col-3 filter">
				<select id="sort" class="form-select" style="width: 150px;">
					<option value="new">최신순</option>
					<option value="old">과거순</option>
					<option value="priceHigh">가격높은순</option>
					<option value="priceLow">가격낮은순</option>
	             </select>
			</div>
		</div>
		<div class="row" style="top:0px;height: 500px;z-index: 1;position: relative;">
			<h1>장소</h1>
			<div id="spaceListData" class="row row-cols-5 row-cols-md-5 g-4">
				<div class="col-1">
					<div class="card">
						<div class="card-body">
							<img src="#" style="width: 100%;height: 150px;margin-top: 20px;">
							<h5 class="card-title">{장소 이름}</h5>
							<p class="card-text">인원 최소{최소인원}명 ~ 최대{최대인원}명</p>
							<p class="card-text" style="color: red; text-align: right;">{지역구}</p>
						</div>
					</div>
				</div>								
			</div>
		</div>
		<div class="row" style="top:350px;height: 500px;z-index: 1;position: relative;">
			<h1>모임</h1>
			<div id="groupListData" class="row row-cols-4 row-cols-md-4 g-4">
			  <div class="col">
			    <div class="card">
			      <div class="card-body">
			        <h5 class="card-title groupTitle">{모임 이름}</h5>
			        <p class="card-text groupDate">모집 마감 날짜 : <span style="color: red;">{모집 마감 날짜}, {디데이}일 남았습니다</span></p>
			        <p class="card-text groupDate">모임 날짜 : {모이는 날짜 및 시간}</p>
			        <p class="card-text groupStatus">{모집 상태}</p>
			      </div>
			    </div>
			  </div>
			</div>
			<nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
				<ul class="pagination" id="resultPagination"></ul>
			</nav>   
		</div>
	</main>
</body>
<script>
	if ('${alertMsg}' != '') {
		alert('${alertMsg}');
	}
	
	/*
	* 정렬, 필터링, 날짜 검색 스크립트 시작
	*/
	
	// 장소 셀렉트 박스 채워 넣기
	var content = '';
	const region = ['강남구', '강북구', '강서구', '관악구', '구로구', '금천구', '종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', '성북구', '도봉구', '노원구', '은평구', '서대문구', 
		'마포구', '양천구', '영등포구', '동작구', '서초구', '송파구', '강동구']
	for(let r of region){
		content += "<option value="+r+">"+r+"</option>";
	}
	
	var searchResultPageIndex = 1;
	searchResultPagination(1);
	$('#region_select').append(content);
    $('#region_select').change(function() {
    	$('#resultPagination').twbsPagination('destroy');
    	searchResultPagination(searchResultPageIndex);
    });
    $('#sort').change(function() {
    	$('#resultPagination').twbsPagination('destroy');
    	searchResultPagination(searchResultPageIndex);
    });
    $('#date_btn').click(function() {
    	$('#date_modal').toggle();
    });
    $('#people_btn').click(function() {
    	$('#people_modal').toggle();	
    });
    $('#minus').click(function() {
    	var numberOfPeople = parseInt($('#choice_group_people').val());
        if(numberOfPeople - 1 > 0) {
        	$('#choice_group_people').val(numberOfPeople - 1);
        	$('#choice_group_people').text($('#choice_group_people').val());
        }
    });
    $('#plus').click(function() {
    	var numberOfPeople = parseInt($('#choice_group_people').val());
        if(numberOfPeople < 20) {
        	$('#choice_group_people').val(numberOfPeople + 1);
        	$('#choice_group_people').text($('#choice_group_people').val());
        } 
    });
    $('#people_select').click(function() {
    	$('#resultPagination').twbsPagination('destroy');
    	searchResultPagination(searchResultPageIndex);
    });
    $('#people_reset').click(function() {
    	$('#choice_group_people').text(1);
    	$('#choice_group_people').val(1);
    });
    $('#date_select').click(function() {
    	$('#resultPagination').twbsPagination('destroy');
    	searchResultPagination(searchResultPageIndex);
    });
    $('#date_reset').click(function() {
    	buildCalendar();
    });
	function spaceCardClick(space_no) {
		//console.log(space_no);	
		window.location.href='/space/detail.go?space_no=' + space_no;
	}
	function groupCardClick(group_no) {
		//console.log(group_no);
		window.location.href='/group/detail.go?group_no=' + group_no;
	} 
    // 현재 날짜를 가져오는 함수
    function getCurrentDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 포맷팅
        var day = String(today.getDate()).padStart(2, '0'); // 일은 한 자리일 경우 두 자리로 포맷팅

        var currentDate = year + '-' + month + '-' + day;
        return currentDate;
    }
    
	function searchResultPagination(startpage) {
		let choice = {
			    year			: $('#calYear').text(),
			    month			: $('#calMonth').text(),
			    day				: $('.choiceDay').text(),
			    today			: $('#date_today').text(),
			    people			: $('#choice_group_people').text(),
			    region			: $('#region_select').val(),
			    sort			: $('#sort').val(),
			    date			: '',
			    type			: '${type}',
			    name			: '${name}'
		};
		choice.date = choice.year + '-' + choice.month + '-' + choice.day;
		//console.log(choice);
		// 날짜 선택시 표현식 맞춰줌
		if (choice.day == '') {
			choice.date = '';
		} 
		//console.log(choice);
		$.ajax({
			type:'post', 
			url:'/searchResult.ajax',  
			data:{
				'page':startpage,
				'region':choice.region,
				'date':choice.date,
				'sort':choice.sort,
				'type':choice.type,
				'people':choice.people,
				'name':choice.name
			},
			dataType:'json',
			success:function(response){ 
				//console.log(response.totalPages);
				if (response.totalPages == 0) {
					var content = '';
					content += '<div style="width: 100%;">';
					content += '<h1 style="text-align: center;">찾으시는 검색 결과가 없습니다.</h1>';
					content += '</div>';
					$('#spaceListData').html(content);
					$('#groupListData').html(content);	
				} else {
					drawSearchResultList(response);	
		            $('#resultPagination').twbsPagination({
						startPage:startpage,       //시작페이지
						totalPages:response.totalPages,    //총 페이지 갯수
						visiblePages:5, // 보여줄 페이지 수 [1][2][3][4][5] <<이렇게 나옴
						onPageClick:function(evt, clickPageIdx){
							// 페이지 이동 번호 클릭시 이벤트 발동
							searchResultPageIndex = clickPageIdx;
							searchResultPagination(clickPageIdx);
						}
		            });
				}
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
	
	function drawSearchResultList(data){
		var content = '';
		var groupList = data.groupList;
		var spaceList = data.spaceList;
		//console.log(spaceList);
		for (item of spaceList) {
			//console.log(item);
			content += '<div class="col spaceCard" onclick="spaceCardClick(' + item.space_no + ')">';
			content += '<div class="card" id="'+ item.space_no +'">';
			content += '<div class="card-body">';
			if (item.space_update_name == null) {
				content += '<img src="#" style="width: 100%;height: 150px;margin-top: 20px;">';
			} else {
				content += '<img src="' + item.space_update_name + '" style="width: 100%;height: 150px;margin-top: 20px;">';
			}
			content += '<h5 class="card-title"> '+ item.space_name +'</h5>';
			content += '<p class="card-text">인원 최소 ' + item.space_min + '명 ~ 최대' + item.space_max + '명</p>';
			content += '<p class="card-text" style="color: red; text-align: right;">' + item.space_region + '</p>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
		}
		$('#spaceListData').html(content);
		content = '';
		for (item of groupList) {
			content += '<div class="col groupCard" onclick="groupCardClick('+ item.group_no +')">';
			content += '<div class="card" id="'+ item.group_no +'">';
			content += '<div class="card-body">';
			content += '<h5 class="card-title groupTitle">' + item.name + '</h5>';
			content += '<p class="card-text groupDate">모집 마감 날짜 : <span style="color: red;"> ' + item.confirmDate+', ' + item.dDay + '일 남았습니다</span></p>';
			content += '<p class="card-text groupDate">모임 날짜 : '+ item.startDate +'</p>';
			if (item.currentNumberOfMember == item.maxNumberOfMember) {
				content += '<p class="card-text" style="color:red;">모집인원달성</p>';	
			} else {
				content += '<p class="card-text" style="color:green;">모집중</p>';
			}
			content += '</div>';
			content += '</div>';
			content += '</div>';
		}
		$('#groupListData').html(content);
	}
	/*
	* 정렬, 필터링, 날짜 검색 스크립트 끝
	*/
	
</script>
<script>
	/* 
	* 달력 스크립트 시작 
	*/
	document.addEventListener("DOMContentLoaded", function() {
	    buildCalendar();
	    
	    document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
	        prevCalendar();
	    });
	    
	    document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
	        nextCalendar();
	    });
	});

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
	                    $(column).attr("id", "date_today");
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
	    console.log($('.choiceDay').text());
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
</html>