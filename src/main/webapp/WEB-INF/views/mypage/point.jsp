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
	.modal{
		 position: fixed;
		  top: 50%; /* 상단에서부터 화면의 50% 위치에 배치 */
  		  left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		  transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		  width: 400px;
		  height: 500px;
	}
</style>
<title>MyPage-Point</title>
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
      <div class="position-sticky pt-3">
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Union Space</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
        
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/home">
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
            <a class="nav-link" href="/reservation/get.do">
              <span data-feather="bar-chart-2"></span>
              예약 내역 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/point/list.do" style="font-weight:bold; color:black;">
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
            <a class="nav-link" href="#" >
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
        <h1 class="h2">포인트 내역 조회</h1>
      </div>

	  <form action="/point/list.do">
	  	<div class="row">
	    <div class="col-6"></div>
	    <div class="col-1">
	       <div class="btn-toolbar mb-2 mb-md-0">
	         <div class="btn-group me-2">
	         	
         		<select id="order" class="form-select" aria-label="Default select example">
		   	         <option selected value="최신 순">최신 순</option>
		   	         <option value="과거 순">과거 순</option>
	            </select>
	            <select id="filter" class="form-select" aria-label="Default select example">
	    	        <option selected value="구분 전체">구분 전체</option>
	    	        <option value="충전">충전</option>
	        	    <option value="확정금차감">확정금차감</option>
	            	<option value="보증금차감">보증금차감</option>
	            	<option value="보증금반환">보증금반환</option>
	            	<option value="취소금액 반환">취소금액 반환</option>
	            </select>
	            <button type="button" class="btn btn-outline-secondary"  style="width: 500px; height: 40px;" data-bs-toggle="modal" data-bs-target="#charge">포인트 충전하기</button>
	           </div>
	          </div>
	      </div>      
	   	</div>
	  </form>
	  
	   	
	<!-- 포인트 충전 모달 -->
	<div class="modal" id="charge">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="display: flex; flex-direction: column; align-items: center;">
					<h3 class="modal-title">현재 포인트 금액</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<div class="modal-body" style="display: flex; flex-direction: column; align-items: center; font-weight:bold;" >
					  <table>
					    <tbody>
					      <c:forEach items="${lastpoint}" var="charge">
					        <p>현재 포인트: <span id="current-point">${charge.user_point}</span>원</p>
					    </c:forEach>
					    </tbody>
					  </table>
				</div>	

				<div class="modal-header" style="display: flex; flex-direction: column; align-items: center;">
					<h3 class="modal-title">포인트 충전</h3>	
				</div>				
				<div class="modal-body">
					<form action="/point/charge.do" id="p-form" method="post" style="display: flex; flex-direction: column; align-items: center;">						
						<input type="text" name = "point_price" class="form-control mb-2" placeholder="충전 금액을 입력하세요.">
						<button type="button" id="p-charge" class="btn btn-info">충전하기</button>
					</form>				
				</div>
			</div>			
		</div>
	</div>
	     
    <br/>
    <br/>
    
    <div class="table-responsive">
       <table class="table">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">포인트 내역</th>
            <th scope="col">구분</th>
            <th scope="col">날짜</th>
            <th scope="col">사용한 장소</th>
            <th scope="col">포인트 잔액</th>
          </tr>
        </thead>
        <tbody id="list">
        </tbody>
      </table>
    </div>
    </main>
    
    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
    	<ul class="pagination" id="pointGetPagination"></ul>
    </nav>

</body>
<script>
/*
var msg = '${msg}';
if(msg != ''){
	alert(msg);
}
*/

var showpage = 1; // 현재 페이지 번호

pointPage(1); // 처음이 1번 페이지


$('#order').change(function() {
	pointPage(showpage);
});

$('#filter').change(function(){	
	showpage=1;
	pointPage(showpage);
});


function pointPage(startpage){
		
	console.log($('#order').val());
	console.log($('#filter').val());
	
	
	
	$.ajax({
		type:'post',
		url:'/point/list.ajax',
		data:{
			'page':startpage,
			'sort':$('#order').val(),
			'state':$('#filter').val()
		},
		dataType:'json',
		success:function(data){
			//console.log(data);
	
			drawPointList(data.pointList);
			
			// 페이징
			$('#pointGetPagination').twbsPagination({
				startPage:startpage, //시작 페이지
				totalPages:data.totalPages, // 총 페이지 개수
				visiblePages:5,
				initiateStartPageClick: false, // 중요: 초기 페이지 클릭을 방지하여 무한 루프 방지
				onPageClick:function(evt,clickPg){
					pointPage(clickPg);			
				}
			});

		},
		error:function(error){
			console.log(error);
		}
	});
}

// list 그리기
function drawPointList(pointList){
    var content = '';
    console.log(pointList);
 // 현재 페이지에 따른 아이템 시작 번호 계산
    var startIndex = (showpage-1)*10;

    for(let i = 0; i < pointList.length; i++) { // pointList 배열의 각 요소에 대해 반복
        var data = pointList[i]; // 현재 요소를 data 변수에 할당
        var pageNum = startIndex + i + 1; // 페이지에 따른 올바른 번호 계산
        content += '<tr>';
        content += '<td>' + pageNum + '</td>'; 
        content += '<td>'+ data.point_price+'</td>';
        content += '<td>'+ data.point_list+'</td>';
        content += '<td>'+ data.point_date+'</td>';
        content += '<td>'+ (data.space_name || '')+'</td>';
        content += '<td>'+ data.point_balance+'</td>';
        content += '</tr>';
    }
    $("#list").html(content);
}

$(document).ready(function(){
    $("#p-charge").click(function(){
        charge();
    });
});


// 모달 창 유효성 검사
function charge(){
	var $point_price = $('input[name="point_price"]');
	
	if($point_price.val()==''){
		alert('금액을 입력해주세요.');
		$point_price.focus();
	}else{
		alert('충전이 완료되었습니다.');
		$('#p-form').submit();
	}
}

</script>
</html>