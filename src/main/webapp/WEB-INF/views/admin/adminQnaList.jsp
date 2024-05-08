<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.twbsPagination.js"></script>
<title>문의 게시판</title>
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



<div class="container-fluid">
	<div class="row">
	<!-- 사이드바 메뉴 -->
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
			<div class="flex-column">
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
	<!-- 사이드바 메뉴_End -->

	<!-- MainContent -->    
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="pagetitle">
	 	<h1>문의 리스트</h1>
	</div>
	
	<div class="p-2">
		<button id="qna_btn" type="button" class="btn btn-success float-right" 
			onclick="location.href='/member/qna/register.go'" style="display: none;">문의하기</button>
	</div>

	<!-- table -->
	<div id="table-container" class="table-responsive">
	</div>
		<div id="table-template" class="table-responsive" style="display: none;">
		<table id="list-table" class="table">
		<thead>
				<tr>
				  <th scope="col">글번호</th>
				  <th scope="col">글 제목</th>
				  <th scope="col">작성자</th>
				  <th scope="col">작성 날짜</th>
				  <th scope="col">답변 상태</th>
				  <th scope="col">답변 작성</th>
				</tr>
		</thead>
		<tbody>
		 	<tr>
				<td class="number">1</td>
				<td class="title"><a href="/help/qnaDetails" ></a></td>
				<td class="writer">user</td>
				<td class="registDate">2024.04.04</td>
				<td class="replyState">답변 완료</td>
				<td class="reply">
					<button id="reply_btn" type="button" class="btn btn-primary btn-sm" >답변 작성</button>
				</td>
				
			</tr>
		</tbody>
		  </table>
		</div>
		<!-- tableEnd -->
		
		<!-- pagination -->
		<div class="container">
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>
		</div>
		<!-- paginationEnd -->
    </main>
    <!-- MainEnd -->
    
  </div>
</div>

</body>
<script>
	// 변수
	var isLoggedIn = '';
	var showPage = 1;
		
	$(document).ready(function() {
		// 로그인 상태
		var id = '${sessionScope.loginInfo}';
		var type = '${sessionScope.loginType}';
		isLoggedIn = '${sessionScope.loginInfo}' !== '';	
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
			console.log('로그인 상태');
			}
		console.log('id:', id,'/ type:', type);
		if(type == "user"){
			$('#qna_btn').css('display', 'block')
		}
		// list 가져오기
		getQnaList(showPage);
	});
	
	//event
	
	//method
	// list
	function getQnaList(page){
		let table = $('#table-template table').clone(true);
		$('#table-container').empty();
		$('#table-container').append(table);
		
		$.ajax({
			type	: 'get',
			url		: '/qna/list/get',
			data	: {'page'	: page},
			dataType: 'json',
			success	: function(result){
				console.log('QnAList: ',result.QnAList);
				// 장소 있을 경우 리스트업
				if(result.QnACnt > 0){
 					result.QnAList.forEach((data, idx) => {
						//console.log(idx+': data: ',data);
						createTable(idx, data);	// 리스트에 값 대입
					});
					loadPage(result.currPage, result.QnACnt);
					
				}else{	// 장소가 없을 경우 
					let td = $('#list-tbody').find('td').first().clone();
					$('#list-tbody').find('tr').empty();
					td.attr('colspan', '5');
					td.text("등록된 문의가 없습니다.");
					$('#list-tbody').find('tr').append(td);
				}
			},
			error	:	function(error){
				console.log(error);
			}

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
                <a href="/point/list.do">포인트 충전 및 사용내역</a>
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
                <a href="/adminQna">장소별 Q&A</a>
             </li>
             <li class="nav-item">
                <a href="/adminSpaceReview">장소별 리뷰</a>
             </li>
          </ul>
       </div>
     </nav>
    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Q&A 관리</h1>
      </div>
		<form action="/admin/search" method="GET">
		    <div class="search">
		        <div class="col-7"></div>
		        <div class="col-5">
		            <div class="btn-toolbar mb-2 mb-md-0">
		                <div class="btn-group me-2">
		                    <select name="state" class="form-state" aria-label="Default select example">
		                        <option value="" selected>전체 조회</option>
		                        <option value="confirm">답변완료</option>
		                        <option value="ready">답변대기</option>
		                    </select>
		                    <select name="order" class="form-order" aria-label="Default select example">
		                        <option value="" selected>전체</option>
		                        <option value="newest">최신등록순</option>
		                        <option value="oldest">오래된 순</option>
		                    </select>
		                    <input name="keyword" type="text" class="form-control" placeholder="장소번호를 입력해주세요" aria-label="장소번호" aria-describedby="basic-addon2">
		                    <button id="searchBtn" type="button" value="space_no" class="btn btn-outline-secondary" style="width: 200px; height: 40px;">검색</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</form>
    <br/>
    <br/>
    <div class="table-responsive">
       <table id="adminQnaTable" class="table">
        <thead>
          <tr>
            <th scope="col">장소번호</th>
            <th scope="col">내용</th>
            <th scope="col">Q&A 작성 날짜</th>
            <th scope="col">답변 작성 날짜</th>
            <th scope="col">작성자</th>
            <th scope="col">답변상태</th>
            <th scope="col">질문번호</th>
            <th scope="col">구분</th>
          </tr>
        </thead>
	<tbody id="adminQna_list">
	    <c:forEach items="${adminQna_list}" var="adminQna">
	        <tr data-space-no="${adminQna.space_no}">
	            <td>${adminQna.space_no}</td>
	            <td>${adminQna.space_content1}</td>
	            <td>${adminQna.space_write_date1}</td>
	            <td>${adminQna.space_write_date2}</td>
	            <td>${adminQna.user_id}</td>
	            <td>
	                <c:choose>
	                    <c:when test="${adminQna.qna_state == 0}">
	                        답변대기
	                    </c:when>
	                    <c:when test="${adminQna.qna_state == 1}">
	                        답변완료
	                    </c:when>
	                    <c:otherwise>
	                        답변대기
	                    </c:otherwise>
	                </c:choose>
	            </td>
	            <td>${adminQna.space_qna_no}</td>
	            <td>
	                <button class="answerBtn btn btn-primary" 
	                        data-space-no="${adminQna.space_no}" 
	                        data-content="${adminQna.space_content1}" 
	                        data-answer="${adminQna.space_content2}" 
	                        data-state="${adminQna.qna_state}" 
	                        data-question-no="${adminQna.space_qna_no}">
	                    ${adminQna.qna_state == 1 ? '답변 완료' : '답변 작성'}
	                </button>
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
    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal_content">
            <span class="modal_close" onclick="closeModal()">&times;</span>
            <h2>작성 내용</h2>
            <p id="questionContent"></p>
            <h2>답변 작성</h2>
            <!-- 답변을 작성할 텍스트 영역 -->
            <textarea class="form-control" id="answerTextarea" rows="5" style="width: 100%;"></textarea>
            <button id="saveAnswerBtn" class="btn btn-primary">답변작성</button>
            <!-- 해당 행의 질문번호를 hidden input에 설정 -->
            <input type="hidden" id="questionNoInput">
            <input type="hidden" id="spaceNumber">
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
    	console.log(pageNumber);
        $.ajax({
            type: "GET",
            url: "/adminQna/ajax",
            data: { 
                'state': $("select[name='state']").val(),
                'sort': $("select[name='order']").val(), 
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
            
            result.forEach(function(data) {
                html +=  '<tr data-space-no="' + data.space_no + '">' +
                            '<td>' + data.space_no + '</td>' +
                            '<td>' + data.space_content1 + '</td>' +
                            '<td>' + data.space_write_date1 + '</td>' +
                            '<td>' + (data.space_write_date2 == null ? '미작성' : data.space_write_date2) + '</td>' +
                            '<td>' + data.user_id + '</td>' +
                            '<td>' + (data.qna_state == 1 ? '답변완료' : '답변대기') + '</td>' + // 수정된 부분
                            '<td>' + data.space_qna_no + '</td>' +
                            '<td><button class="answerBtn btn btn-primary" data-space-no="' + data.space_no + '" data-content="' + data.space_content1 + '" data-answer="' + data.space_content2 + '" data-state="' + data.qna_state + '" data-question-no="' + data.space_qna_no + '">' + (data.qna_state == 1 ? '답변 완료' : '답변 작성') + '</button></td>' +
                        '</tr>';
                
                
            });
            
            $("#adminQna_list").html(html);
            
        }

	 // 버튼 클릭 시 AJAX 요청을 보내는 이벤트 리스너
	    $("#searchBtn").click(function() {
	        // 선택한 리스트 등을 가져오는 코드
	        var adminQna_list = [];

	        // 첫 번째 선택 옵션에서 선택한 값을 가져와서 selList에 추가
	        var stateValue = $("select[name='state']").val();
	        adminQna_list.push(stateValue);

	        // 두 번째 선택 옵션에서 선택한 값을 가져와서 selList에 추가
	        var orderValue = $("select[name='order']").val();
	        adminQna_list.push(orderValue);
	        
	        // 세 번쨰 선택 옵션에서 장소번호로 입력한 값을 가져와서 selList입력
	        var spaceNO = $("input[name='keyword']").val();
	        adminQna_list.push(spaceNO);
	        
	        // AJAX 요청 보내는 함수 호출
	        sendAjaxRequest(1);
	    });
	});

		// 답변 버튼 클릭 시
		$(document).on("click", ".answerBtn", function() {
		    var content = $(this).data("content");
		    var spaceNo = $(this).data("space-no");
		    var answer = $(this).data("answer");
		    var qnaState = $(this).data("state");
		    var questionNo = $(this).data("question-no");
		    console.log(questionNo);
		    openModal(content, spaceNo, answer, qnaState, questionNo);
		});
	}
	
	// method
	// 리스트 페이징 처리
	function loadPage(start, cnt){
		// 전체 페이지 수 구하기
		let totalPages = cnt / 10;
		if(cnt % 10 > 0){
			totalPages++;
		}
		var nowPage = start > totalPages ? totalPages : start;
		
		$('#pagination').twbsPagination('destroy');	// 페이지 갱신
		
		$('#pagination').twbsPagination({
			startPage: nowPage,
			totalPages: totalPages,
		    visiblePages: 10,		    //페이지당 보이는 글의수는 10개				    
		    first:'<span sris-hidden="true">«</span>' ,
		    last:'<span sris-hidden="true">»</span>' ,
		    prev:'<span sris-hidden="true"><</span>' ,
		    next:'<span sris-hidden="true">></span>' ,
		    initiateStartPageClick: false,
		    onPageClick: function (event, pg) {
		    	console.log('nowPage: ',pg);
		    	showPage = pg;
		    	getQnaList(showPage);
		    }
	     });
	}
	// 리스트 테이블로 생성
	function createTable(idx, data){
		var date = new Date(data.qna_write_date);
		var td = $('#table-template tbody').find('tr').clone(true);
 		// table row 값 입력
 		td.find('.number').text(idx+1);
		td.find('.title').find('a').text(data.qna_title);
		td.find('.title').find('a').attr('href', '/qna/get/param='+data.qna_no);
		td.find('.writer').text(data.qna_id);
		td.find('.registDate').text(date.toLocaleDateString());	
		td.find('#reply_btn').val(data.qna_no);
		if(data.qna_state == '0'){
			td.find('.replyState').text('답변 대기');
			td.find('.replyState').css('color', 'orange');
		}else{
			td.find('.replyState').text('답변 완료');
			td.find('.replyState').css('color', 'green');
		}
		
		$('#list-table tbody').find('tr').first().empty();
		$('#table-container tbody').append(td);
		
	}
	// 검색
	function search(){
		var keyword = $("input[placeholder='장소 및 모임을 입력하세요']").val();
		//  검색 시 스터디룸, 회의실, 파티룸, 카페 중 하나면 카테고리와 같은 위치로 이동
		if (keyword === '스터디룸' || keyword === '회의실' || keyword === '파티룸' || keyword === '카페') {
			window.location.href = "/searchResult.go?type=" + encodeURIComponent(keyword);
		} else {
			window.location.href = "/searchResult.go?name=" + encodeURIComponent(keyword);
		}
		console.log('keyword: ',keyword);
	}
    // 모달 열기
    function openModal(content, spaceNo, answer, qnaState, questionNo) {
        document.getElementById("answerTextarea").value = answer;
        document.getElementById("questionContent").innerText = content;
        document.getElementById("questionNoInput").value = questionNo; // 질문번호 설정
        document.getElementById("myModal").style.display = "block";
        $('#spaceNumber').val(spaceNo);
        console.log(questionNo);

        if (qnaState == '1') {
            document.getElementById("saveAnswerBtn").disabled = true;
            document.querySelector(".answerBtn[data-question-no='" + questionNo + "']").textContent = "답변 완료";
        } else {
            document.getElementById("saveAnswerBtn").disabled = false;
            document.querySelector(".answerBtn[data-question-no='" + questionNo + "']").textContent = "답변 작성";
        }
        
        // 답변 작성 버튼 비활성화
        var saveAnswerBtn = document.getElementById("saveAnswerBtn");
        saveAnswerBtn.disabled = qnaState == '1'; // 답변 완료인 경우 비활성화

        // 텍스트 영역 읽기 전용 설정
        var answerTextarea = document.getElementById("answerTextarea");
        answerTextarea.readOnly = qnaState == '1'; // 답변 완료인 경우 읽기 전용으로 설정
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    // 답변 작성 버튼 클릭 시
    document.getElementById("saveAnswerBtn").onclick = function() {
        var answerTextareaValue = document.getElementById("answerTextarea").value;
        var questionNo = document.getElementById("questionNoInput").value; // 질문번호 가져오기
        console.log(questionNo);
        if (answerTextareaValue.trim() !== "") { // 답변 내용이 비어 있지 않은 경우에만 저장 요청
            $.ajax({
                type: "POST",
                url: "/adminQna/saveAnswer", //서버에 요청 보낼 URL
                data: {
                    answer: answerTextareaValue,
                    questionNo: questionNo
                },
                dataType: "json",
                success: function(response) {
                    // 서버에서의 응답 처리
                    if (response.success) {
                        // 성공적으로 저장되었을 때의 처리
                        alert("답변이 성공적으로 저장되었습니다.");
                        var button = document.querySelector(".answerBtn[data-question-no='" + questionNo + "']");
                        button.textContent = "답변 완료";
                        closeModal();
                        updateTable(response.updatedData); // 테이블 업데이트 함수 호출
                        
                    } else {
                        // 저장 실패 시의 처리
                        alert("답변 저장에 실패했습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    // AJAX 요청 실패 시의 처리
                    console.error("AJAX 요청 실패:", status, error);
                }
            });
        } else {
            alert("답변을 작성해주세요.");
        }
    };
		 // 테이블 업데이트 함수
		    function updateTable(updatedData) {
			 	var spaceNumber = $('#spaceNumber').val();
		        // 업데이트된 데이터를 테이블에 적용
		        var row = $("#adminQna_list").find("tr[data-question-no='" + spaceNumber + "']");
		        console.log(row);
		        row.find("td:eq(5)").text(updatedData.qna_state == 1 ? '답변완료' : '답변대기'); // 답변 상태 업데이트
		        row.find("td:eq(3)").text(updatedData.space_write_date2); // 답변 작성 날짜 업데이트
		        console.log(updatedData.space_write_date2);
		    }
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