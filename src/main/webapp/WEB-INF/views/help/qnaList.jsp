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
            <a href="/mypagemain">
                <img src="/resources/images/siteImg/mypage.png" class="logo-img">
            </a>
        </div>
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
	<!-- 사이드바 메뉴_End -->

	<!-- MainContent -->    
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">문의 리스트</h1>
      </div>
	
	<div class="p-2">
		<button id="qna_btn" type="button" class="btn btn-success float-right" 
			onclick="location.href='/member/qna/register.go'" style="display: none; padding-left:0px;">문의하기</button>
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
				</tr>
		</thead>
		<tbody>
		 	<tr>
				<td class="number">1</td>
				<td class="title"><a></a></td>
				<td class="writer">user</td>
				<td class="registDate">2024.04.04</td>
				<td class="replyState">답변 완료</td>
			</tr>
		</tbody>
		  </table>
		</div>
		<!-- tableEnd -->
		
		<!-- pagination -->
		<!-- 페이징 -->
	    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
	    	<ul class="pagination" id="pagination"></ul>
	    </nav>
		
		
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
	$(document).ready(function() {
	    var isLoggedIn = '${sessionScope.loginInfo}' !== '';

	    // 마이페이지 링크 클릭을 처리하는 함수
	    function handleMyPageClick() {
	        if (!isLoggedIn) {
	            alert('로그인이 필요합니다!');
	            window.location.href = "/login.go";
	        } else {
	            // 마이페이지로 리디렉션
	            window.location.href = "/mypagemain";
	        }
	    }

	    // 마이페이지 링크에 클릭 이벤트를 연결
	    $(".mypage-link a").click(function(event) {
	        event.preventDefault(); // 기본 링크 동작 방지
	        handleMyPageClick();
	    });

	    // 로그인 상태에 따라 로그인 버튼 텍스트와 동작을 업데이트
	    if (!isLoggedIn) {
	        $(".login-btn").text('로그인');
	        $(".login-btn").click(function() {
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
	});
	
</script>
</html> 
