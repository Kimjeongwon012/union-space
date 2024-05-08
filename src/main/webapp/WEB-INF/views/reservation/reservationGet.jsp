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
.header {
          background-color: #ffffff;
          color: #ffffff;
          padding: 10px 0;
          display: flex; 
          justify-content: center; 
          align-items: center; 
          margin-left : 0px; 
          height :150px;
             background-color: #ffffff; 
   }   
.login-btn {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 10px; /* 간격을 위한 왼쪽 마진 추가 */
    }
    .login-btn:hover {
        background-color: #0056b3;
    }
    .search-box {
        text-align: center;
        display: flex; /* 검색 상자를 플렉스 컨테이너로 설정 */
        align-items: center; /* 수직 가운데 정렬 */
        margin-left: auto; /* 검색박스를 오른쪽으로 밀어내기 */
    }
    .search-box input[type="text"] {
        width: 300px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 10px; /* 간격을 위한 오른쪽 마진 추가 */
    }
    .search-btn {
        background-color: #28a745;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .search-btn:hover {
        background-color: #218838;
    }
    .mypage-link {
        text-align: center;
    }
    .mypage-link a {
        text-decoration: none;
        color: #333;
        border: 1px solid #333;
        padding: 5px 10px; /* 작은 크기를 위한 패딩 조정 */
        border-radius: 4px;
        background-color: #fff;
        display: inline-block; /* 작은 크기를 위해 inline-block으로 변경 */
        margin-left: 10px;
        margin-right: 10px;
    }
    .mypage-link a:hover {
        background-color: #c4afaf;
        color: #fff;
    }
	.userId {
		width: 200px;
		text-align: left;
	}
	.evaluateBtn {
	    background-color: #A8FFA8;
	    border-radius: 4px;
	}
	.evaluateMemberBtn {
		background-color: #7749F8;
		border: 1px solid black;
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
		  top: 60%; /* 상단에서부터 화면의 60% 위치에 배치 */
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
	.btn {
		color: black;
		border: 1px solid black;
	}
</style>
<title>Reservation-Get</title>
</head>
<body>

<div class="header">
<!-- 로고를 중앙에 배치 -->
<div style="flex: 1; display: flex; justify-content: center; margin-left:580px;">
  <a href="/home">
      <img src="/resources/images/siteImg/logo.png" class="logo-img2">
  </a>
</div>
<div class="search-box">
      <input type="text" placeholder="장소 및 모임을 입력하세요">
      <button class="search-btn">검색</button>
  </div>
<!-- 로그인 버튼과 마이페이지 버튼을 오른쪽으로 배치 -->
<div style="display: flex; align-items: center;">
  <div>
      <button class="login-btn">로그인</button>
  </div>
  <div class="mypage-link">
      <a href="/mypagemain">
          <img src="/resources/images/siteImg/mypage.png" class="logo-img">
      </a>
  </div>
  <!-- 검색 버튼과 검색 상자를 하나의 그룹으로 묶기 -->
  
</div>
</div>

<div class="container-fluid">
  <div class="row">
<nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white; margin-top:90px;">
         <div class="position-sticky pt-3" >
          <h1>Menu</h1>
          <div class="bg-black" style="height: 2px"></div>
          <br/>
          <div class="">
             <h3>Union Space</h3>
          </div>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/home">Union Space</a>
             </li>
            <li class="nav-item">
                <a href="/QnAList">문의</a>
             </li>
          </ul>
          <br/>
          <h3>Search</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/searchResult.go">장소 및 모임 찾기</a>
             </li>
            
          </ul>
          <br/>
          <h3>MyPage</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/mypagemain">현재 예약 현황</a>
             </li>
            <li class="nav-item">
                <a href="/reservation/get.do">예약 내역 조회</a>
             </li>
             <li class="nav-item">
                <a href="/point/list.do">포인트 내역 조회</a>
             </li>
             <li class="nav-item">
                <a href="/userinfo">회원 정보 조회</a>
             </li>
             <li class="nav-item">
                <a href="/userInfoOut">회원 탈퇴</a>
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
       			<div class="col-3 filter">
					<select id="sort" class="form-select" style="width: 150px;">
						<option value="new">최신순</option>
						<option value="old">과거순</option>
					</select>
				</div>
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
            <th scope="col">출석 상태</th>
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
   </div>
</div>
    
    
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
					      		<td><input type = "text" name = "user_id" readonly style="border: none; outline: none;"></td>
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
							<table id="evaluateList">

								<!-- 
								<tr>
									<td>1</td>
									<td>mark</td>
									<td>
										<button>평가하기</button>
									</td>
								</tr>
								<tr style="color:gray;">
									<td>2</td>
									<td>chris</td>
									<td></td>
								</tr>
								 -->															
							</table>
						</div>
						<div class="col-6">
							<table id="ment">
								<tr>
								</tr>														
							</table>
						</div>
						<div class="col-1">
						</div>
					</div>
					<div class="row" style="margin-top: 20px;">
						<form action="/reservation/evaluateMember.do" method="post" style="display: flex;justify-content: flex-end;">
							<input type="hidden" name="group_no" value=""/>
		        			<input type="hidden" name="user_id" value=""/>
		        			<input type="hidden" name="user_evid" value=""/>
		        			<input type="hidden" name="evaluationList" value=""/> 
							<button type="button" class="btn btn-success" id="evaluateMemberSaveBtn">저장하기</button>
						</form>
					</div>
				</div>	
			</div>			
		</div>
	</div>
    <!-- 모임원 평가 모달 끝 -->

    </main>      
</body>
<script> 
/* 상단바 스크립트 시작*/
var isLoggedIn = '';
    $(document).ready(function() {
       isLoggedIn = '${sessionScope.loginInfo}' !== '';
       console.log(isLoggedIn);
       
       if (!isLoggedIn) {
          $(".login-btn").click(function() {
             $(".login-btn").text('로그인');
                window.location.href = "/login.go";
            });
              console.log('로그아웃 상태');
           
          } else {
             $(".login-btn").text('로그아웃');
             $(".login-btn").click(function() {
                window.location.href = "/logout.do";
                
             });
            console.log('로그인상태');
          }
        
        // 로그인 버튼 클릭 이벤트
       
    });
$(document).ready(function() {
            $(".search-btn").click(function() {
                var keyword = $("input[placeholder='장소 및 모임을 입력하세요']").val();
                //  검색 시 스터디룸, 회의실, 파티룸, 카페 중 하나면 카테고리와 같은 위치로 이동
                if (keyword === '스터디룸' || keyword === '회의실' || keyword === '파티룸' || keyword === '카페') {
                    window.location.href = "/searchResult.go?type=" + encodeURIComponent(keyword);
                } else {
                    window.location.href = "/searchResult.go?name=" + encodeURIComponent(keyword);
                }
            });
        });

/* 상단바 스크립트 끝*/

var showpage = 1;

var GclickPageIndex = 1;
var RclickPageIndex = 1;


/* 최신순 과거순 정렬 버튼 */

	$('#sort').change(function() {
		groupList(GclickPageIndex);
		ResList(RclickPageIndex);
	});

/* 최신순 과거순 정렬 스크립트 끝 */


/* 모임 예약 내역 불러오기 시작 */
  
	groupList(1);

	function groupList(startpage){
		
		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
				'sort':$('#sort').val()
			},
			dataType:'json',
			success:function(data){
				
				if(data.totalPages == 0){
					var content = '';
					content += '<tr>';
					content += content += '<td colspan="8" style="text-align: center;">조회할 내역이 없습니다.</td>';
					content += '</tr>';
					$("#groupRes").html(content);
				}else{
					drawGroupList(data.resgroupList);
					
					// "리뷰 작성" 버튼에 대한 클릭 이벤트 핸들러 정의
		             $('.write-review').click(function() {
		                var groupNo = $(this).closest('tr').find('td:first').text();
		                 $('#group_no').val(groupNo);
		                 $('input[name="user_id"]').val('${sessionScope.loginInfo}');
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
							GclickPageIndex = clickPg;
							groupList(clickPg);
						}
					});
				}
				
				
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	
	function drawGroupList(resgroupList){
		var content = '';
		
		for(data of resgroupList){
			content += '<tr>';
			content += '<td>' + data.group_no + '</td>'; 
	        content += '<td><a href="/group/detail.go?group_no='+ data.group_no +'">'+ data.group_name+'</td>';
	        content += '<td>'+ data.group_time+'</td>';
	        content += '<td>'+ data.par_people+'</td>';
	        if(data.group_state == 0) {
	            content += '<td style="color: #FFD700; font-weight: bold;">모집 중</td>';
	        } else if(data.group_state == 1) {
	            content += '<td style="color: #008000; font-weight: bold;">모집 완료</td>';
	        } else if(data.group_state == 2) {
	            content += '<td style="color: #FF69B4; font-weight: bold;">모집 실패</td>';
	        }else if(data.group_state == 3) {
	            content += '<td style="color: #FF69B4; font-weight: bold;">모임 삭제</td>';
	        }else if(data.group_state == 4) {
	            content += '<td style="color: #008000; font-weight: bold;">사용 완료</td>';
	        }	        
	        content += '<td>'+ data.attenDance_status+'</td>';
	        if(data.attenDance_status == "참석") {
	        	content += '<td><button class="btn btn-success evaluateBtn" onclick="evaluateBtnClick('+ data.group_no +')">모임원 평가</button></td>';
	    		if (data.isReviewed == 0) {
	    			content += '<td><button class="btn btn-success write-review" data-bs-toggle="modal" data-bs-target="#review">리뷰 작성</button></td>';	
	    		} else {
	    			content += '<td><button class="btn btn-success" style="background: darkgrey;opacity: 50%;cursor: default;">리뷰 작성</button></td>';	
	    		}
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

		$.ajax({
			type:'post',
			url:'/reservation/list.ajax',
			data:{
				'page':startpage,
				'sort':$('#sort').val()
			},
			dataType:'json',
			success:function(data){
				console.log(data.TPages);
				if(data.TPages == 0){
					var content = '';
					content += '<tr>';
					content += content += '<td colspan="7" style="text-align: center;">조회할 내역이 없습니다.</td>';
					content += '</tr>';
					$("#spaceRes").html(content);
				}else{
					drawResList(data.resList);
					
					
					// "리뷰 작성" 버튼에 대한 클릭 이벤트 핸들러 정의
		             $('.write-review').click(function() {
		                var groupNo = $(this).closest('tr').find('td:first').text();
		                 $('#group_no').val(groupNo);
		                 $('input[name="user_id"]').val('${sessionScope.loginInfo}');
		                 $('#review').modal('show'); // 모달 창 표시
		             });

		     		console.log(startpage);
		    		console.log(data.TPages);
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
							RclickPageIndex = clickPg;
							ResList(clickPg);
						}
					});
				}
				
				
			},
			error:function(error){
				console.log(error)
			}
		});
	}
	
	function drawResList(resList){
		var content = '';
		
		for(data of resList){
			content += '<tr>';
			content += '<td>' + data.group_no + '</td>'; 
			content += '<td><a href="/space/detail.go?space_no='+ data.space_no +'">'+ data.space_name+'</td>';
	        content += '<td>'+ data.group_time+'</td>';
	        content += '<td>'+ data.group_people+'</td>';
	        if(data.group_state == 5) {
	            content += '<td style="color: #FFD700; font-weight: bold;">예약 중</td>';
	        } else if(data.group_state == 6) {
	            content += '<td style="color: #008000; font-weight: bold;">예약 완료</td>';
	        }
	        // group_state가 7이 아닐 때만 리뷰 작성 버튼을 추가
	    	if(data.group_state == 4) {
	    		// 리뷰를 작성하지 않았을때만 작성 버튼을 추가
	    		content += '<td style="color: #008000; font-weight: bold;">사용 완료</td>';
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
    function evaluateBtnClick(group_no) {
    	$('input[name="group_no"]').val(group_no);
    	$('input[name="user_id"]').val('${sessionScope.loginInfo}');
		$.ajax({
			type:'post',
			url:'/reservation/evaluateList.ajax',
			dataType:'json',
			data:{
				group_no:$('input[name="group_no"]').val()
			},
			success:function(response) {
				drawEvaluateList(response.evaluateList);
				$('#evaluateMember').modal('show');		
			},
			error:function(error){
				console.log(error);
			}
		});
    }
   
    $('#evaluateMemberSaveBtn').click(function () {
    	var evaluationList = [];
    	$('input[class="form-check-input"]:checked').each(function() {
    	    evaluationList.push($(this).attr('id'));
    	});
    	$('input[name="evaluationList"]').val(evaluationList);
		let form = {
			group_no			: $('input[name="group_no"]').val(),
			user_id				: $('input[name="user_id"]').val(),
			user_evid			: $('input[name="user_evid"]').val(),
			evaluationList		: $('input[name="evaluationList"]').val()
		};
    	//$('input[name="evaluationList"]').val(JSON.stringify(evaluationList)); // 선택한 목록 넣기
    	//console.log(evaluationList);
    	//console.log(JSON.stringify(evaluationList));
    	console.log(form); //뭔가 이상한데 form 쪽에는 잘 입력되어있음 뭐지?
		if (form.user_evid == '') {
			alert('평가할 사용자를 선택하신 후 저장해주세요');
		} else if (form.evaluationList.length == 0) {
			alert('평가 항목은 최소 하나 이상 선택해야합니다');
		} else {
			$('form').submit();
		}
		
    });
    
	function drawEvaluateList(evaluateList){
		var content = '';
		var index = 1;
	    content += '<tr style="font-size:20px;font-weight: 500;">';
	    content += '<td>#</td>';
	    content += '<td style="width: 200px;">평가자</td>'; 
	    content += '<td>평가하기</td>';
	    content += '</tr>';
		// console.log(evaluateList);
		for(item of evaluateList){
		    content += '<tr style="height: 60px;border-bottom: 1px solid rgba(0, 0, 0, 0.1);">';
		    content += '<td>' + index + '</td>';
		    if (item.isAttendance == '참석') {
		    	content += '<td class="userId">' + item.user_id + '</td>'; 
		    	content += '<td><button class="btn btn-success evaluateMemberBtn" id="'+ item.user_id + '">평가하기</button></td>';
		    } else if (item.isAttendance == '평가완료') {
		    	content += '<td class="userId">' + item.user_id + '</td>'; 
		    	content += '<td><button class="btn" style="background: gray;">평가하기</button></td>';
		    } else {
		    	content += '<td class="userId" style="color:gray;cursor: default;">' + item.user_id + '</td>';
		    	content += '<td></td>'; 
		    }
		    content += '</tr>';
		    index += 1;
		}
		$('#evaluateList').html(content);
		$('.evaluateMemberBtn').click(function() {
			var user_id = $(this).closest('td').prev().text();
			drawEvaluateItems(user_id);
		});
	}
    
	var ment = [];
	//var items = ['친절하고 매너가 좋아요', '시간 약속을 잘 지켜요', '적극적으로 소통해요', '팀원의 의견을 존중해요', '주도적으로 모임을 이끌어요', '시간 약속을 안 지켜요', '불친절하고 매너가 없어요', '모임 목적과 안 맞아요', '다른 팀원의 발언을 자주 끊어요', '타인의 의견을 무시해요'];
	var items = [];
	var checkRadioBtn = [];
	$.ajax({
		type:'post',
		url:'/reservation/evaluateItemList.ajax',
		dataType:'json',
		success:function(response){
			items = response.items;
		},
		error:function(error){
			console.log(error)
		}
	});
	
	/* 평가 목록 불러오기 시작 */
	function drawEvaluateItems(user_id) {
		var content = '';	
		var count = 0;
		checkRadioBtn = []; // 이전 평가때 선택한 항목 초기화
		$('#ment').html(content);
		//console.log(items);
		const keys = Object.keys(items); 
		content += '<h3>' + user_id + '님을 평가해주세요</h3>';
		$('input[name="user_evid"]').val(user_id);
		content += '<hr/>';
		for (let i = 0; i < keys.length; i++) {
			const key = keys[i];
			const value = items[key];
			content += '<tr>';
			content += '<tr>';
			content += '<td>';
			//content += '<input class="form-check-input" type="radio" style="border: 1px solid black;">';
		    content += '<input class="form-check-input" type="radio" style="border: 1px solid black;" id="' + key + '" onclick="check(' + count + ');">';
			content += '<label class="form-check-label" style="margin-left:5px;">' + value + '</label>';
			content += '</td>';
			content += '</tr>';
			count += 1;
		}
		
		$('#ment').html(content);		
	}
	/* 평가 목록 불러오기 끝 */	

	function check(count){
		var obj = $('.form-check-input');
		
		if (checkRadioBtn.includes(count)){
			obj.eq(count).prop('checked',false);
	        var index = checkRadioBtn.indexOf(count);
	        if (index !== -1) {
	            checkRadioBtn.splice(index, 1); // 리스트에서 해당 항목을 제거
	        }
		} else {
			if (checkRadioBtn.length == 5) {
				alert('최대 5개까지 선택할 수 있습니다.');
				obj.eq(count).prop('checked',false);
			} else {
				obj.eq(count).prop('checked', true);
				checkRadioBtn.push(count);	
			}
		}
	}

	
	
	
	
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