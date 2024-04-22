<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>

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
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              포인트 사용 내역
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
        <h1 class="h2">포인트 내역 조회</h1>
      </div>

	  <form action="/point/list">
	  	<div class="row">
	    <div class="col-6"></div>
	    <div class="col-1">
	       <div class="btn-toolbar mb-2 mb-md-0">
	         <div class="btn-group me-2">
	         	
         		<select id="filterOrder" class="form-select" aria-label="Default select example">
	   	         <option selected value="0">최신 순</option>
	   	         <option value="1">오래된 순</option>
	            </select>
	            <select id="filterType" class="form-select" aria-label="Default select example">
	    	        <option selected value="all">구분 전체</option>
	    	        <option value="1">충전</option>
	        	    <option value="2">확정금차감</option>
	            	<option value="3">보증금차감</option>
	            	<option value="4">보증금반환</option>
	            	<option value="5">취소금액 반환</option>
	            </select>	        	            
	            <button type="button" class="btn btn-outline-secondary"  style="width: 500px; height: 40px;" data-bs-toggle="modal" data-bs-target="#charge">포인트 충전하기</button>
	           </div>
	          </div>
	      </div>      
	   	</div>
	  </form>
	  
	   	
	<!-- 포인트 충전 모달 -->
	<div class="modal" id="charge" style="width:40%; height:60%; place-items:center;">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">현재 포인트 금액</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<%--
				<div class="modal-body">
					  <table>
					    <tbody>
					      <c:forEach items="${list}" var="charge">
					        <tr>
					          <td>${charge.user_point}</td>
					        </tr>
					      </c:forEach>
					    </tbody>
					  </table>
				</div>	
				 --%>
				<div class="modal-header">
					<h3 class="modal-title">포인트 충전</h3>	
				</div>				
				<div class="modal-body">
					<form action="./charge.do" method="post">						
						<input type="number" name = "point_price" class="form-control mb-2" placeholder="충전 금액을 입력하세요.">
						<button type="submit" class="btn btn-info">충전하기</button>
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
            <th scope="col">ID</th>
            <th scope="col">포인트 사용 내역</th>
            <th scope="col">구분</th>
            <th scope="col">날짜</th>
            <th scope="col">사용한 장소</th>
            <th scope="col">포인트 잔액</th>
          </tr>
        </thead>
        <tbody id="pointlist">
        	
			<c:if test = "${list.size()<1}">
				<tr><td colspan="6">사용자 내역이 없습니다.</td></tr>
			</c:if>
			 
			<c:forEach items="${list}" var="point">
				<tr>
					<td>${point.user_id}</td>
					<td>${point.point_price}</td>
					<td>${point.point_list}</td>
					<td>${point.point_date}</td>
					<td>${point.space_name}</td>
					<td>${point.user_point}</td>
				</tr>
			</c:forEach>
        </tbody>
      </table>
    </div>
    </main>
    
    <div class="row">
       <div class="col-6"></div>
       <div class="col-5">
          <nav aria-label="Page navigation example">
           <ul class="pagination" id="pagination">
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Previous">
                 <span aria-hidden="true">&laquo;</span>
               </a>
             </li>
             <li class="page-item"><a class="page-link" href="#">1</a></li>
             <li class="page-item"><a class="page-link" href="#">2</a></li>
             <li class="page-item"><a class="page-link" href="#">3</a></li>
             <li class="page-item"><a class="page-link" href="#">4</a></li>
             <li class="page-item"><a class="page-link" href="#">5</a></li>
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Next">
                 <span aria-hidden="true">&raquo;</span>
               </a>
             </li>
           </ul>
         </nav>
       </div>
    </div>    
</body>
<script>
/*
var showPage = 1;

$(document).ready(function(){
	listCall(showPage); // 실행하자 바로 요청
});

function listCall(page){
	$.ajax({
		type:'get',
		url:'/point/get.ajax',
		data:{'page':page},
		dataType:'json',
		success.function(data){
			console.log(data.list);
			
			var startPage = data.currPage>data.totalPages?data.totalPages:data.currPage;
			
			$('#pagination').twbsPagination({
				startPage:startPage, // 시작 페이지
				totalPages:data.totalPages, // 총 페이지 개수
				visiblePages:5, // 보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(evt, pg){ // 페이지 클릭 시 실행 함수
					console.log(evt); // 이벤트 객체
					console.log(pg); // 클릭한 페이지 번호
					showPage=pg;
					listCall(pg);
				}
			});
		},
		error:function(error){
			console.log(error);
		}
	});
}
)





	/*
	$(document).ready(function(){
		$('#filterOrder').click(function(){
			var option = $('#filterOrder').val();
			$.ajax({
				type:'get',
				url:'/point/get.ajax',
				data:{'option':option},
				success:function(data){
					$('#pointlist').html(data);
				},
				error:function(error){
					console.log(error);
				}
			});
		});
	});
	*/
</script>
</html>