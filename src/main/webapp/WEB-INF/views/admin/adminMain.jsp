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
	    text-align: right; /* 검색 상자를 오른쪽으로 정렬 */
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
        /* 사이드바 스타일 */
    .sidebar-admin {
        background-color: white;
        margin-top: 90px; /* 헤더와의 간격 조정 */
        height: calc(100vh - 90px); /* 사이드바 높이를 화면 높이의 나머지에 맞춤 */
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
    }
    
    /* 메인 콘텐츠와의 간격 조정 */
    .main-content {
        margin-top: 90px; /* 헤더와의 간격 조정 */
        padding-top: 30px; /* 사이드바가 가리는 내용을 피하기 위해 콘텐츠 상단에 패딩 추가 */
    }
    
	
</style>
<title>AdminPage-group</title>
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
		            <a href="/adminMain">
		                <img src="/resources/images/siteImg/mypage.png" class="logo-img">
		            </a>
		        </div>
		        <!-- 검색 버튼과 검색 상자를 하나의 그룹으로 묶기 -->
		        
		    </div>
		</div>
<nav id="admin" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-admin collapse"
            style="background:white"; margin-top:90px;>
         <div class="position-sticky pt-3" >
          <h1>Admin</h1>
          <div class="bg-black" style="height: 2px"></div>
          <br/>
          <div class="">
             <h3>Reservation</h3>
          </div>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/adminMain">예약 전체 내역 조회</a>
             </li>
          </ul>
          <br/>
          <h3>Member</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/admin/get.do">회원 목록 조회</a>
             </li>
            <li class="nav-item">
                <a href="/point/adminpoint/get.do">사용자 포인트 내역 조회</a>

             </li>
          </ul>
          <br/>
          <h3>Space</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/space/list.go">등록한 장소 목록 조회</a>
             </li>
            <li class="nav-item">
                <a href="/space/register.go">장소 등록</a>
             </li>
             <li class="nav-item">
                <a href="/space/qna/list">장소별 Q&A</a>
             </li>
             <li class="nav-item">
                <a href="/adminSpaceReview">장소별 리뷰</a>
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
		sendAjaxRequest(1);
		//페이지 번호 클릭 시 이벤트 핸들러
		$(".page-link").click(function() {
		    var pageNumber = $(this).text(); // 클릭된 페이지 번호 가져오기
		    sendAjaxRequest(pageNumber); // 해당 페이지 번호에 맞는 데이터 요청
		});
		
	    // AJAX를 이용하여 서버에 데이터를 요청하는 함수
	    function sendAjaxRequest(pageNumber) {
	        $.ajax({
	            type: "GET",
	            url: "/adminMain/ajax",
	            data: { 
	                'sort': $("select[name='sort']").val(),
	                'state': $("select[name='state']").val(),
	                'order': $("select[name='order']").val(),
	                'page': pageNumber // 페이지 번호 추가
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
	            var textColor = '';
	            if (data.group_state == 0) { // 예약중인 경우
	                textColor = '#FFD700'; // 검은색 텍스트
	            } else if (data.group_state == 1) { // 예약확정인 경우
	                textColor = '#008000'; // 초록색 텍스트
	            } else if (data.group_state == 2) { // 예약취소인 경우
	                textColor = '#FF69B4'; // 빨간색 텍스트
	            }
	            
	            html += '<tr>' +
	                        '<td>' + data.group_no + '</td>' +
	                        '<td>' + data.group_name + '</td>' +
	                        '<td>' + data.group_starttime + '</td>' +
	                        '<td>' + data.meeting_status + '</td>' +
	                        '<td>' + data.group_confirm + '</td>' +
	                        '<td style="color: ' + textColor + ';">' + 
	                        (data.group_state == 0 ? '예약중' : (data.group_state == 1 ? '예약확정' : '예약취소')) + 
	                    '</td>' +
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
		        
	</script>
</html>