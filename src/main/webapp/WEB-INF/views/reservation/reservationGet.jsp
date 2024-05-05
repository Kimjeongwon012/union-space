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
		  top: 70%; /* 상단에서부터 화면의 50% 위치에 배치 */
  		  left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		  transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		  width: 1000px;
		  height: 1000px;
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
	  <form action="/reservation/get.do">
	  	<div class="row">
	    <div class="col-3">
	       <div class="btn-toolbar mb-2 mb-md-0">
	         <div class="btn-group me-2">
	         	<select id="order" class="form-select" aria-label="Default select example">
		   	         <option selected value="최신 순">최신 순</option>
		   	         <option value="과거 순">과거 순</option>
	            </select>
         		
	       	</div>
	       </div>
	    </div>      
	   	</div>
	  </form>
	  
	<button class="evaluateBtn">모임원 평가</button>
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
            <th scope="col">장소명</th>
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
    
    
    <!-- 리뷰 작성 모달 시작 -->
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
    <!-- 리뷰 작성 모달 끝 -->

    <!-- 모임원 평가 모달 시작 -->
	<div class="modal" id="evaluateMember">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">모임원 평가<span>(평가 멘트 다중 선택 가능)</span></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<div class="modal-body" style="color:black; font-weight: 700">
					<div class="row">
						<div class="col-5" style="text-align: center;">					
							<table>
								<tr>
									<td>#</td>
									<td style="width: 200px;">참가자</td>
									<td>평가하기</td>
								</tr>
								<tr>
									<td>1</td>
									<td>mark</td>
									<td>
										<button>평가하기</button>
									</td>
								<tr style="color:gray;">
									<td>2</td>
									<td>chris</td>
									<td></td>
								</tr>															
							</table>
						</div>
						<div class="col-6">
							<table id="ment">
								<tr>
									<td>
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" style="border: 1px solid black;">
										<label class="form-check-label" for="flexRadioDefault1">친절하고 매너가 좋아요</label>
									</td>
								</tr>														
							</table>
						</div>
						<div class="col-1">
						</div>
					</div>
				</div>	
			</div>			
		</div>
	</div>
    <!-- 모임원 평가 모달 끝 -->

    </main>      
</body>
<script>
var showpage = 1;

/* 모임 예약 내역 불러오기 시작 */
  
	groupList(1);

	function groupList(startpage){
		
		console.log(startpage);
		
		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
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
	        content += '<td><a href="/group/detail.go?group_no='+ data.group_no +'">'+ data.group_name+'</td>';
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
 
	function ResList(startpage){
		
		console.log(startpage);
		
		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
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
			content += '<td><a href="/space/detail.go?space_no='+ data.space_no +'">'+ data.space_name+'</td>';
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
	    		// 리뷰를 작성하지 않았을때만 작성 버튼을 추가
	    		console.log(data);
	    		if (data.isReviewed == 0) {
	    			content += '<td><button class="write-review" data-bs-toggle="modal" data-bs-target="#review">리뷰 작성</button></td>';	
	    		} else {
	    			content += '<td><button style="background: darkgrey;opacity: 50%;cursor: default;">리뷰 작성</button></td>';	
	    		}
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

	/* 모임원 평가 스크립트 시작 */
	$('.evaluateBtn').click(function() {
		$('#evaluateMember').modal('show'); // 모달 창 표시
	});
	var content = '';
	var ment = ['친절하고 매너가 좋아요', '시간 약속을 잘 지켜요', '적극적으로 소통해요', '팀원의 의견을 존중해요', '주도적으로 모임을 이끌어요', '시간 약속을 안 지켜요', '불친절하고 매너가 없어요', '모임 목적과 안 맞아요', '다른 팀원의 발언을 자주 끊어요'];
	for (item of ment) {		
		content += '<tr>';
		content += '<tr>';
		content += '<td>';
		content += '<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" style="border: 1px solid black;">';
		content += '<label class="form-check-label" for="flexRadioDefault1">' + item + '</label>';
		content += '</td>';
		content += '</tr>';
	}
	
	$('#ment').html(content);
	
	const radioButtons = document.querySelectorAll('input[type="radio"]');
	let selectedCount = 0;

	radioButtons.forEach(radio => {
	  radio.addEventListener('change', () => {
	    if (radio.checked) {
	      selectedCount++;
	      if (selectedCount > 5) {
	        radio.checked = false;
	        selectedCount--;
	        alert('최대 5개까지 선택할 수 있습니다.');
	      }
	    } else {
	      selectedCount--;
	    }
	  });
	});

	/* 모임원 평가 스크립트 끝 */
 
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



</script>
</html>