<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>AdminPage-PointGet</title>
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
             <span>Reservation</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
        
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              예약 전체 내역 조회
            </a>
          </li>
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Member</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              회원 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="font-weight:bold; color:black;">
              <span data-feather="shopping-cart"></span>
              사용자 포인트 내역 조회
            </a>
          </li>
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Space</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
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

        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              장소별 리뷰
            </a>
          </li>
        </ul>
      </div>
    </nav>
    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">사용자 포인트 내역 조회</h1>
      </div>
     <form action="/adminpoint/list.go">
     	<div class="row">
        <div class="col-6"></div>
        <div class="col-2">
           <div class="btn-toolbar mb-2 mb-md-0" >
             <div class="btn-group me-2">
                <select id="order" class="form-select" aria-label="Default select example" style="width: 300px; height: 40px;">
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
             <input name="keyword" type="text" class="form-control" placeholder="사용자 아이디를 입력해주세요." aria-label="사용자ID" aria-describedby="basic-addon2">
			 <button id="searchbtn" type="button" value="userId" class="btn btn-outline-secondary" style="width: 200px; height: 40px;">검색</button>
             </div>
            </div>
        </div>      
     </div>
     </form>
     
    <br/>
    <br/>
    <div class="table-responsive">
       <table class="table">
        <thead>
          <tr>
            <th scope="col">사용자 ID</th>
            <th scope="col">포인트 내역</th>
            <th scope="col">구분</th>
            <th scope="col">날짜</th>
            <th scope="col">사용한 장소</th>
            <th scope="col">포인트 잔액</th>
          </tr>
        </thead>
        <tbody id="userPointList">
         
        </tbody>
      </table>
    </div>
    </main> 
    
    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
    	<ul class="pagination" id="AdminPointGetPagination"></ul>
    </nav>
       
</body>
<script>

var showpage = 1; // 현재 페이지 번호

adminPointPg(1); // 처음이 1번 페이지

$('#order').change(function(){
	showpage=1;
	adminPointPg(showpage);
});

$("#filter").change(function(){
	showpage=1;
	adminPointPg(showpage);
});

$("#searchbtn").click(function(){
	showpage=1;
	adminPointPg(showpage);
});


function adminPointPg(startpage){
	
	console.log($('#order').val());
	console.log($('#filter').val());
	console.log(startpage);
	
	$.ajax({
		type:'post',
		url:'/point/adminpoint/list.ajax',
		data:{
			'page':startpage,
			'sort':$('#order').val(),
			'state':$('#filter').val(),
			'userId':$("input[name='keyword']").val()
		},
		dataType:'json',
		success:function(data){
			drawUserPointList(data.userPointList);
			
			// 페이징처리
			$('#AdminPointGetPagination').twbsPagination({
				startPage:startpage, // 시작 페이지
				totalPages:data.totalPages, // 총 페이지 개수
				visiblePages:5,
				initiateStartPageClick: false, // 중요: 초기 페이지 클릭을 방지하여 무한 루프 방지
				onPageClick:function(evt,clickPg){
					adminPointPg(clickPg);
				}
				
			});
		},
		error:function(error){
			console.log(error);
		}
	});
}


// 사용자 포인트 내역 그리기
function drawUserPointList(userPointList){
	var content = '';
	console.log(userPointList);
	
	for(data of userPointList){
		content += '<tr>';
		content += '<td>' + data.user_id + '</td>'; 
        content += '<td>'+ data.point_price+'</td>';
        content += '<td>'+ data.point_list+'</td>';
        content += '<td>'+ data.point_date+'</td>';
        content += '<td>'+ (data.space_name || '')+'</td>';
        content += '<td>'+ data.point_balance+'</td>';
        content += '</tr>';		
	}
	$('#userPointList').html(content);
	
}
</script>
</html>