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
    /* 마우스를 호버할 때 살짝쿵 효과 */
    td.review-content:hover {
        cursor: pointer; /* 마우스 커서를 포인터로 변경하여 클릭 가능한 상태로 보여줍니다. */
        color: #007bff; /* 글자 색을 파란색으로 변경합니다. */
        text-decoration: underline; /* 밑줄을 추가하여 클릭 가능한 것처럼 보여줍니다. */
    }
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
<title>AdminPage-SpaceReview</title>
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
			<div class="flex-column">
				<h3>Main</h3>
			</div>
			<hr/>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a href="/QnAList">문의 게시판</a>
				</li>
			</ul>
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
        <h1 class="h2">장소별 리뷰</h1>
      </div>
	    <div class="search">
	        <div class="col-7"></div>
	        <div class="col-5">
	            <div class="btn-toolbar mb-2 mb-md-0">
	                <div class="btn-group me-2">
	                    <select name="sort" class="form-sort" aria-label="Default select example">
	                        <option value="" selected>전체 조회</option>
	                        <option value="newset">최신 등록 순</option>
	                        <option value="oldset">오래된 순</option>
	                    </select>
	                    <input name="keyword" type="text" class="form-control" placeholder="장소번호를 입력해주세요" aria-label="장소번호" aria-describedby="basic-addon2">
	                    <button id="searchBtn" type="button" class="btn btn-outline-secondary" style="width: 200px; height: 40px;">검색</button>
	                </div>
	            </div>
	        </div>
	    </div>
    <br/>
    <br/>
    <div class="table-responsive">
       <table id="adminSpaceReview" class="table">
        <thead>
          <tr>
            <th scope="col">장소번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성날짜</th>
            <th scope="col">작성자</th>
          </tr>
        </thead>
		<tbody id="adminSpaceReview_list">
		    <c:forEach items="${adminSpaceReview_list}" var="adminSpaceReview">
		        <tr>
		            <td>${adminSpaceReview.space_no}</td>
		            <td class="review-content">${adminSpaceReview.review_content}</td>
		            <td>${adminSpaceReview.review_date}</td>
		            <td>${adminSpaceReview.user_id}</td>
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
		    // 페이지 로드 시 첫 페이지의 데이터 요청
		    sendAjaxRequest(1);
		
		//페이지 번호 클릭 시 이벤트 핸들러
		$(".page-link").click(function() {
		    var pageNumber = $(this).text(); // 클릭된 페이지 번호 가져오기
		    sendAjaxRequest(pageNumber); // 해당 페이지 번호에 맞는 데이터 요청
		});
	    
         //AJAX를 이용하여 서버에 데이터를 요청하는 함수
         function sendAjaxRequest(pageNumber) {
        	 $.ajax({
                 type: "GET",
                 url: "/admin/adminSpaceReviewSerch.ajax",
                 data: { 
                      'sort': $("select[name='sort']").val(),
                      'space_no': $("input[name='keyword']").val(),
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
              var result = response.result;
              var html = '';
      
              // 테이블 내용을 채워주는 부분
              result.forEach(function(data) {
                  html += '<tr>' +
                              '<td>' + data.space_no + '</td>' +
                              '<td class="review-content">' + data.review_content + '</td>' +
                              '<td>' + data.review_date + '</td>' +
                              '<td>' + data.user_id + '</td>' +
                          '</tr>';
              });
              $("#adminSpaceReview_list").html(html);
          }

       // 검색 버튼 클릭 시 AJAX 요청을 보내는 이벤트 리스너
          $("#searchBtn").click(function() {
              // 페이지 번호를 1로 초기화
              var pageNumber = 1;
              
              // adminSpaceReview를 배열로 초기화
              var adminSpaceReview = [];
              
              // 첫 번째 선택 옵션에서 선택한 값을 가져와서 adminSpaceReview에 추가
              var sortValue = $("select[name='sort']").val();
              adminSpaceReview.push(sortValue);
              
              // 두 번째 선택 옵션에서 선택한 값을 가져와서 adminSpaceReview에 추가
              var keyword = $("input[name='keyword']").val(); // 수정된 부분
              adminSpaceReview.push(keyword);
              
              // AJAX 요청 보내는 함수 호출
              sendAjaxRequest(pageNumber); // 페이지 번호를 전달
          });
		});
             // 리뷰 내용을 클릭했을 때의 이벤트 핸들러 추가
             $("#adminSpaceReview_list").on("click", "td.review-content", function() {
                 // 클릭된 리뷰의 고유한 space_no 가져오기
                 var spaceNo = $(this).closest("tr").find("td:first-child").text();
                 // 연결될 다른 페이지의 URL 설정 (예시 URL)
                 var nextPageUrl = "/space/detail.go?space_no=" + spaceNo; // 예시 URL을 실제로 적절한 URL로 수정해야 합니다.
                 // 해당 페이지로 이동
                 window.location.href = nextPageUrl;
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