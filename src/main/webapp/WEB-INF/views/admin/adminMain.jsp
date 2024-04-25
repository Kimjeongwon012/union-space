<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<style>
</style>
<title>AdminPage-group</title>
</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Union Space</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input id="searchInput" class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <button id="" class="btn btn-outline-secondary" style="height: 38px;">검색</button>
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
              포인트 충전 및 사용 내역
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
        <h1 class="h2">예약(모임)내역</h1>
      </div>
		<form action="/adminMain/ajax" method="GET">
		    <div class="search">
		        <div class="col-7"></div>
		        <div class="col-5">
		            <div class="btn-toolbar mb-2 mb-md-0">
		                <div class="btn-group me-2">
		                    <select name="sort" class="form-sort" aria-label="Default select example">
		                        <option value="" selected>전체 조회</option>
		                        <option value="group_no">예약번호순정렬</option>
		                        <option value="start_time">모임날짜순정렬</option>
		                    </select>
		                    <select name="state" class="form-state" aria-label="Default select example">
		                        <option value="" selected>전체</option>
		                        <option value="confirm">예약 확정</option>
		                        <option value="cancel">예약 취소</option>
		                        <option value="booking">예약중</option>
		                    </select>
		                    <button id="searchBtn" type="button" class="btn btn-outline-secondary" style="width: 200px; height: 40px;">검색</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</form>
    <br/>
    <br/>
    <div class="table-responsive">
       <table id="adminMainTable" class="table">
        <thead>
          <tr>
            <th scope="col">예약(모임)번호</th>
            <th scope="col">모임명</th>
            <th scope="col">모임 날짜 및 시간</th>
            <th scope="col">모임 인원 현황</th>
            <th scope="col">예약 확정 날짜</th>
            <th scope="col">예약 상태</th>
          </tr>
        </thead>
		<tbody id="adminMain_list">
		    <c:forEach items="${adminMain_list}" var="adminMain">
		        <tr>
		            <td>${adminMain.group_no}</td>
		            <td>${adminMain.group_name}</td>
		            <td>${adminMain.group_starttime}</td>
		            <td>${adminMain.meeting_status}</td>
		            <td>${adminMain.group_confirm}</td>
		            <td>
		                <c:choose>
		                    <c:when test="${adminMain.group_state == 0}">
		                        예약중
		                    </c:when>
		                    <c:when test="${adminMain.group_state == 1}">
		                        예약확정
		                    </c:when>
		                    <c:when test="${adminMain.group_state == 2}">
		                        예약취소
		                    </c:when>
		                    <c:otherwise>
		                        기타 상태
		                    </c:otherwise>
		                </c:choose>
		            </td>
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
           <ul class="pagination">
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
	$(document).ready(function() {
	    // AJAX를 이용하여 서버에 데이터를 요청하는 함수
	    function sendAjaxRequest() {
	        $.ajax({
	            type: "GET",
	            url: "/adminMain/ajax",
	            data: { 
	                'sort': $("select[name='sort']").val(),
	                'state': $("select[name='state']").val(),
	                'order': $("select[name='order']").val()
	            },
	            dataType: "json",
	            success: function(response) {
	                // 서버에서 받은 응답을 처리하는 함수
	                handleResponse(response);
	            },
	            error: function(xhr, status, error) {
	                // 에러 발생 시 처리하는 함수
	                console.error("AJAX 요청 실패:", status, error);
	            }
	        });
	    }

	    // 서버로부터 받은 응답을 처리하는 함수
	    function handleResponse(response) {
	        var result = response.result; // 변경된 부분
	        var html = '';

	        // 테이블 내용을 채워주는 부분
	        result.forEach(function(data) { // 변경된 부분
	            html += '<tr>' +
	                        '<td>' + data.group_no + '</td>' +
	                        '<td>' + data.group_name + '</td>' +
	                        '<td>' + data.group_starttime + '</td>' +
	                        '<td>' + data.meeting_status + '</td>' +
	                        '<td>' + data.group_confirm + '</td>' +
	                        '<td>' + (data.group_state == 0 ? '예약중' : (data.group_state == 1 ? '예약확정' : (data.group_state == 2 ? '예약취소' : '기타 상태'))) + '</td>' +
	                    '</tr>';
	        });

	        $("#adminMain_list").html(html);
	    }

	    // 검색 버튼 클릭 시 AJAX 요청을 보내는 이벤트 리스너
	    $("#searchBtn").click(function() {
	        // 선택한 리스트 등을 가져오는 코드
	        var adminMain_list = [];

	        // 첫 번째 선택 옵션에서 선택한 값을 가져와서 adminMainSearch에 추가
	        var stateValue = $("select[name='state']").val();
	        adminMain_list.push(stateValue);
	        
	        // 두 번째 선택 옵션에서 선택한 값을 가져와서 adminMainSearch에 추가
	        var sortValue = $("select[name='sort']").val();
	        adminMain_list.push(sortValue);

	        // AJAX 요청 보내는 함수 호출
	        sendAjaxRequest();
	    });
	});
	</script>
</html>