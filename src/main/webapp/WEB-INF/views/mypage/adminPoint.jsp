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
	
</style>
<title>AdminPage-PointGet</title>
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
        <h1 class="h2">사용자 포인트 내역 조회</h1>
      </div>
     <form action="/adminpoint/list.go">
     	<div class="row">
        <div class="col-6"></div>
        <div class="col-2">
           <div class="btn-toolbar mb-2 mb-md-0" >
             <div class="btn-group me-2">
                <select id="order" class="form-select" aria-label="Default select example" style="width: 300px; height: 40px;">
              <option selected value="new">최신 순</option>
              <option value="old">과거 순</option>
              </select>
              <select id="filter" class="form-select" aria-label="Default select example">
              	<option selected value="all">구분 전체</option>
	    	    <option value="1">충전</option>
	        	<option value="2">확정금차감</option>
	          	<option value="3">보증금차감</option>
	           	<option value="4">보증금반환</option>
	            <option value="5">취소금액 반환</option>
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

/* 상단바 스크립트 시작 */
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

/* 상단바 스크립트 끝 */



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
			
			if(data.totalPages == 0){
				var content = '';
				content += '<tr>';
				content += content += '<td colspan="6" style="text-align: center;">조회할 내역이 없습니다.</td>';
				content += '</tr>';
				$("#list").html(content);
			}else{
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
			}
			
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