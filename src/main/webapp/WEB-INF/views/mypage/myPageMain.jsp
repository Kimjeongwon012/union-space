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
	.mypage-banner {
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    padding: 20px;
	}
	
	.profile-info {
	    display: flex;
	    align-items: center;
	}
	
	.profile-info img {
	    width: 100px;
	    height: 100px;
	    border-radius: 50%;
	    margin-right: 20px;
	}
	
	.user-info h5 {
	    margin-bottom: 10px;
	    color: #333;
	}
	
	.user-info p {
	    margin: 5px 0;
	    color: #666;
	}
	
	.progress {
	    height: 20px;
	    margin-top: 10px;
	}
	
	.progress-bar {
	    border-radius: 5px;
	}

</style>
<title>myPageMain</title>
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
    <br/>    
    <div class="mypage-banner">
        <div class="profile-info">
            <img src="/path/to/profile_picture.jpg" alt="프로필 사진">
            <div class="user-info">
                <h5>Mypage</h5>
                <div class="row">
                    <div class="col-md-3">
                        <p>포인트 잔액: <span id="pointBalance">1000</span></p> <!-- 포인트 잔액은 데이터베이스에서 가져온 값으로 대체 -->
                    </div>
                    <div class="col-md-3">
                        <p>매너 점수: <span id="mannerscore">90</span></p> <!-- 매너 점수는 데이터베이스에서 가져온 값으로 대체 -->
                    </div>
                    <div class="col-md-3">
                        <p>출석률: <span id="attendanceRate">90%</span></p> <!-- 출석률은 데이터베이스에서 가져온 값으로 대체 -->
                    </div>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <div class="table-responsive">
        <div>
            <h5>현재 예약 현황</h5>   
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">예약번호</th>
                    <th scope="col">예약명</th>
                    <th scope="col">예약 일시</th>
                    <th scope="col">참여중/최대인원</th>
                    <th scope="col">예약확정날짜</th>
                    <th scope="col">예약상태</th>
                    <th scope="col">출석체크</th>
                </tr>
            </thead>
            		<tbody id="mypage">
		    <c:forEach items="${mypage}" var="my">
		        <tr>
		            <td>${my.group_no}</td>
		            <td>${my.group_name}</td>
		            <td>${my.group_time}</td>
		            <td>${my.par_people}</td>
		            <td>${my.group_confirm}</td>
		            <td>${my.group_state}</td>
		        </tr>
		    </c:forEach>
		</tbody>
        </table>
    </div>
</main>  
</body>
<script>
</script>
</html>