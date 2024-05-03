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
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	.evaluate-member {
	    background-color: #A8FFA8;
	    border-radius: 4px;
	}
	.write-review {
	    background-color: #A8FFA8;
	    border-radius: 4px;
	}
	#write-btn{
		background-color: #87CEFA;
	    border-radius: 4px;
	}
	.modal{
		 position: fixed;
		  top: 50%; /* 상단에서부터 화면의 50% 위치에 배치 */
  		  left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		  transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		  width: 500px;
		  height: 700px;
	}
	th, td{
		padding: 10px 20px;
	}
	.star-rating {
	  font-size: 30px;
	}
	
	.star {
	  cursor: pointer;
	  color: lightgray;
	}
	
	.star.selected {
	  color: gold;
	}
	.date-input {
	    width: 200px; /* 너비 조정 */
	    height: 30px; /* 높이 조정 */
	}   
	#sidebarMenu{
		width: 230px;	
	}

</style>
<title>Reservation-Get</title>
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
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-2">
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Union Space</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
        
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              Union Space
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              문의
            </a>
          </li>
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Search</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              장소 찾기
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              모임 찾기
            </a>
          </li>
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>My Info</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              현재 예약 현황
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              예약 내역 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers"></span>
              포인트 내역 조회
            </a>
          </li>
        </ul>

        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              매너 점수 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="font-weight:bold; color:black;">
              <span data-feather="file-text"></span>
              회원정보 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              회원 탈퇴
            </a>
          </li>
        </ul>
      </div>
    </nav>
    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h3 class="h3">예약 내역</h3>
      </div>
	  <form action="/point/list">
	  	<div class="row">
	    <div class="col-3">
	       <div class="btn-toolbar mb-2 mb-md-0">
	         <div class="btn-group me-2">
	         	
         		<!-- 시작날짜 -->
			    <input type="month" id="startMonth" class="date-input" aria-label="Start month">
			    
			    <!-- 종료 날짜 -->
			    <input type="month" id="endMonth" class="date-input" aria-label="End month">
	            <button id="resetbtn" type="button" class="btn btn-outline-secondary" style="display: flex; justify-content: center; align-items: center; width: 200px; height: 30px; color: red; font-weight: bold;">Reset Filter</button>
	       	</div>
	       </div>
	    </div>      
	   	</div>
	  </form>

	<br/>    
    <div class="table-responsive">
    	<div>
	    	<h5>모임 예약 내역</h5>   	
    	</div>
       <table class="table">
        <thead>
          <tr>
            <th scope="col">예약번호</th>
            <th scope="col">예약명</th>
            <th scope="col">예약 일시</th>
            <th scope="col">참여중/최대인원</th>
            <th scope="col">상태</th>
            <th scope="col">모임원 평가</th>
            <th scope="col">장소 리뷰 작성</th>
          </tr>
        </thead>
        <tbody id="groupRes">
        	
        </tbody>
      </table>
    </div>
    
    
    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
    	<ul class="pagination" id="ResGetPagination1"></ul>
    </nav>
    
    <div class="table-responsive">
    	<div>
	    	<h5>장소 예약 내역</h5>   	
    	</div>
       <table class="table">
        <thead>
          <tr>
            <th scope="col">예약번호</th>
            <th scope="col">예약명</th>
            <th scope="col">예약 일시</th>
            <th scope="col">예약 인원</th>
            <th scope="col">상태</th>
            <th scope="col">장소 리뷰 작성</th>
          </tr>
        </thead>
        <tbody id="spaceRes">
        	
        </tbody>
      </table>
    </div>
    
    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
    	<ul class="pagination" id="ResGetPagination2"></ul>
    </nav>
    
    
    <!-- 리뷰 작성 모달 -->
	<div class="modal" id="review">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">장소 리뷰 작성</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<div class="modal-body">
					<form action="./write-review.do" id="r-form" method="post" style="display: flex; flex-direction: column; ">						
						<table>		
							<input type="hidden" name="group_no" id="group_no"/>										
							<tr>
					      		<th>작성자</th>
					      		<td><input type = "text" name = "user_id" ></td>
					      	</tr>
					      	<tr>
					      		<th>작성날짜</th>
					      		<td><input type = "text" id="review_date" name = "review_date" readonly style="border: none; outline: none;"></td>
					      	</tr>
					      	<tr>
					      		<th>별점</th>
					      		<td>
					      			<div class="star-rating">
									  <span class="star" data-value="1">&#9733;</span>
									  <span class="star" data-value="2">&#9733;</span>
									  <span class="star" data-value="3">&#9733;</span>
									  <span class="star" data-value="4">&#9733;</span>
									  <span class="star" data-value="5">&#9733;</span>
									</div>
									<!-- 별점 값을 저장할 숨겨진 input 추가 -->
    								<input type="hidden" name="review_score" id="review_score" value="0">			      			
					      		</td>
					      	</tr>
					      	<tr>
					      		<th>내용</th>
					      		<td><textarea name="review_content" rows="6" cols="40" placeholder="리뷰를 작성해주세요."></textarea></td>
					      	</tr>
					      	<tr>
					      		<th colspan="2"  style="text-align: right;">
					      			<button type = "submit" id="write-btn" data-group-no="{{ groupNo }}">작성하기</button>
					      		</th>
					      	</tr>			      		      	
						</table>	
					</form>
					
				</div>	
			</div>			
		</div>
	</div>
    

    </main>      
</body>
<script>
var showpage = 1;

//선택한 시작 날짜와 종료 날짜 가져오기
function dateFilter(){
	var startMonth = $('#startMonth').val();
	var endMonth = $('#endMonth').val();
	
	// 시작 날짜와 종료 날짜를 서버로 전송하여 필터링
    groupList(1, startMonth, endMonth);
    ResList(1, startMonth, endMonth);
}



/* 모임 예약 내역 불러오기 시작 */
  
	groupList(1);

	function groupList(startpage, startMonth, endMonth){
		
		console.log(startpage);
		console.log(startMonth);
	    console.log(endMonth);
		
		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
				'startdate': startMonth,
	            'enddate': endMonth
			},
			dataType:'json',
			success:function(data){
				drawGroupList(data.resgroupList);
				
				// "리뷰 작성" 버튼에 대한 클릭 이벤트 핸들러 정의
	             $('.write-review').click(function() {
	                var groupNo = $(this).closest('tr').find('td:first').text();
	                 $('#group_no').val(groupNo);
	                 $('#review').modal('show'); // 모달 창 표시
	             });



				// 페이징 처리
				var $pagination = $('#ResGetPagination1');
	            if ($pagination.data("twbs-pagination")) {
	                $pagination.twbsPagination('destroy');
	            }
				$pagination.twbsPagination({
					startPage:startpage, //시작 페이지
					totalPages:data.totalPages, // 총 페이지 개수
					visible:5,
					initiateStartPageClick: false, // 중요: 초기 페이지 클릭을 방지하여 무한 루프 방지
					onPageClick:function(evt, clickPg){
						groupList(clickPg);
					}
				});
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	
	function drawGroupList(resgroupList){
		var content = '';
		console.log(resgroupList);
		
		for(data of resgroupList){
			content += '<tr>';
			content += '<td>' + data.group_no + '</td>'; 
	        content += '<td><a href="/group/groupDetail.go?group_no='+ data.group_no +'">'+ data.group_name+'</td>';
	        content += '<td>'+ data.group_time+'</td>';
	        content += '<td>'+ data.par_people+'</td>';
	        content += '<td>'+ data.attenDance_status+'</td>';
	        if(data.attenDance_status == "참석") {
	        	content += '<td><button class="evaluate-member">모임원 평가</button></td>';
		        content += '<td><button class="write-review" data-bs-toggle="modal" data-bs-target="#review">리뷰 작성</button></td>';
	        } else {
	        	content += '<td></td>'; 
	        	content += '<td></td>';
	        }
		}
		$('#groupRes').html(content);
	}
	
/* 모임 예약 내역 불러오기 끝 */
 
/* 장소 예약 내역 불러오기 시작 */
  
 	ResList(1);
 
	function ResList(startpage, startMonth, endMonth){
		
		console.log(startpage);
		
		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
				'startdate': startMonth,
	            'enddate': endMonth
			},
			dataType:'json',
			success:function(data){
				drawResList(data.resList);
				
				// "리뷰 작성" 버튼에 대한 클릭 이벤트 핸들러 정의
	             $('.write-review').click(function() {
	                var groupNo = $(this).closest('tr').find('td:first').text();
	                 $('#group_no').val(groupNo);
	                 $('#review').modal('show'); // 모달 창 표시
	             });


				
				// 페이징 처리
				var $pagination = $('#ResGetPagination2');
	            if ($pagination.data("twbs-pagination")) {
	                $pagination.twbsPagination('destroy');
	            }
				$pagination.twbsPagination({
					startPage:startpage, //시작 페이지
					totalPages:data.TPages, // 총 페이지 개수
					visible:5,
					initiateStartPageClick: false, // 중요: 초기 페이지 클릭을 방지하여 무한 루프 방지
					onPageClick:function(evt, clickPg){
						ResList(clickPg);
					}
				});
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	
	function drawResList(resList){
		var content = '';
		console.log(resList);
		
		for(data of resList){
			content += '<tr>';
			content += '<td>' + data.group_no + '</td>'; 
			content += '<td><a href="/space/detail.go?space_no='+ data.group_no +'">'+ data.group_name+'</td>';
	        content += '<td>'+ data.group_time+'</td>';
	        content += '<td>'+ data.group_people+'</td>';
	        if(data.group_state == 5) {
	            content += '<td>예약 완료</td>';
	        } else if(data.group_state == 6) {
	            content += '<td>예약 중</td>';
	        } else if(data.group_state == 7) {
	            content += '<td>예약 취소</td>';
	        }
	        // group_state가 7이 아닐 때만 리뷰 작성 버튼을 추가
	    	if(data.group_state != 7) {
	    		content += '<td><button class="write-review" data-bs-toggle="modal" data-bs-target="#review">리뷰 작성</button></td>';
	    	} else {
	    		content += '<td></td>'; 
	    	}
	        content += '</tr>';	
		}
		$('#spaceRes').html(content);
	}

/* 장소 예약 내역 불러오기 끝 */

/* 현재날짜 생성 스크립트 시작 */
 	document.addEventListener('DOMContentLoaded', function() {
	    var today = new Date();
	    var dd = String(today.getDate()).padStart(2, '0');
	    var mm = String(today.getMonth() + 1).padStart(2, '0'); //1월은 0
	    var yyyy = today.getFullYear();
	
	    today = yyyy + '-' + mm + '-' + dd;
	    document.getElementById('review_date').value = today;
	  });
 
/* 현재날짜 생성 스크립트 끝 */

 
 /* 별점 기능 스크립트 시작 */
 
 	// 별 눌렀을 때 이벤트 리스너 추가
	document.querySelectorAll('.star-rating .star').forEach(function(star) {
	  star.addEventListener('click', function() {
	    // 모든 별의 'selected' 클래스 제거
	    document.querySelectorAll('.star-rating .star').forEach(function(sibling) {
	      sibling.classList.remove('selected');
	    });
	    
	    
	    // 클릭된 별과 그 이전의 모든 별에 'selected' 클래스 추가
	    this.classList.add('selected');
	    let selectedValue = this.dataset.value;
	    document.getElementById('review_score').value = selectedValue;
	    //console.log(selectedValue);
	    
	    let previousSibling = this.previousElementSibling;
	    while(previousSibling) {
	      previousSibling.classList.add('selected');
	      previousSibling = previousSibling.previousElementSibling;
	    }
	  });
	});
	
	// 모달 창 닫기 버튼에 이벤트 리스너 추가
	document.querySelectorAll('.btn-close').forEach(function(button) {
	  button.addEventListener('click', function() {
	    // 모든 별의 'selected' 클래스 제거하여 별점 초기화
	    document.querySelectorAll('.star-rating .star').forEach(function(star) {
	      star.classList.remove('selected');
	    });
	  });
	});

 /* 별점 기능 스크립트 끝 */

 
 
$(document).on('click', "#write-btn", function(){
	e.preventDefault(); // 폼의 기본 제출 이벤트를 방지
    review();
});



 
 // 모달 창 유효성 검사
 function review(){

	 var $user_id = $('input[name="user_id"]');
	 var $review_score = $('input[name="review_score"]');
	 var $review_content = $('textarea[name="review_content"]');
	 
	 if($user_id.val()==''){
		alert('아이디를 입력해주세요.');
		$user_id.focus();
		return false;
	 }else if($review_score.val()==0){
		alert('별점을 입력해주세요.');
		return false;
	 }else if($review_content.val()==''){
		alert('리뷰를 작성해주세요.');
		$review_content.focus();
		return false;
	 }
	 else{
		alert('리뷰작성이 완료되었습니다.');
		$('#r-form').submit();
	 }
	 
 }

 
/* 날짜필터링 기능 스크립트 시작 */

// 현재 날짜 및 6개월 후 날짜 설정
function setDefaultDates() {
    var currentDate = new Date();
    var sixMonthsLater = new Date(new Date().setMonth(new Date().getMonth() + 6));

    // 날짜를 YYYY-MM 형식으로 변환
    var currentMonth = currentDate.toISOString().slice(0, 7);
    var sixMonthsLaterMonth = sixMonthsLater.toISOString().slice(0, 7);

    // 입력 필드에 기본값 설정
    document.getElementById('startMonth').value = currentMonth;
    document.getElementById('endMonth').value = sixMonthsLaterMonth;
}

// 페이지 로드 시 기본 날짜 설정
document.addEventListener('DOMContentLoaded', function() {
    setDefaultDates();
});

// 리셋 버튼 이벤트 리스너
document.getElementById('resetbtn').addEventListener('click', function() {
    setDefaultDates();
});



/*
// monthpicker UI
$(function(){
	$('#monthpicker').monthpicker({
		monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)', '7월(JUL)',
			'8월(AUG)', '9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showOn:"button",
		changeYear:true,
		dateFormat:'yyyy-mm'
	});
	
	$('#startMonth').monthpicker();
	$('#endMonth').monthpicker();
	
	$('#startMonth').monthpicker('setDate','today');
	$('#endMonth').monthpicker('setDate','+6M');
	
});
*/

/* 날짜필터링 기능 스크립트 끝 */
</script>
</html>