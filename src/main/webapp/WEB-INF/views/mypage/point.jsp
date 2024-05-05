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
<title>MyPage-Point</title>
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
    <nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white; margin-top:90px;">
         <div class="position-sticky pt-3" >
          <h1>Menu</h1>
          <div class="bg-black" style="height: 2px"></div>
          <br/>
          <div class="">
             <h3>Union Space</h3>
          </div>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/home">Union Space</a>
             </li>
            <li class="nav-item">
                <a href="/QnAList">문의</a>
             </li>
          </ul>
          <br/>
          <h3>Search</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/searchResult.go">장소 및 모임 찾기</a>
             </li>
            
          </ul>
          <br/>
          <h3>MyPage</h3>
          <hr/>
          <ul class="nav flex-column">
             <li class="nav-item">
                <a href="/mypagemain">현재 예약 현황</a>
             </li>
            <li class="nav-item">
                <a href="/reservation/get.do">예약 내역 조회</a>
             </li>
             <li class="nav-item">
                <a href="/point/list.do">포인트 내역 조회</a>
             </li>
             <li class="nav-item">
                <a href="/userinfo">회원 정보 조회</a>
             </li>
             <li class="nav-item">
                <a href="/userInfoOut">회원 탈퇴</a>
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
				<div class="modal-body" style="display: flex; flex-direction: column; align-items: center; font-weight:bold;">
				    <table>
				        <tbody>
				            <c:forEach items="${lastpoint}" var="charge">
				                <tr>
				                    <td> <span id="currentPoint">현재 포인트: ${charge.user_point} 원 </span> </td>
				                </tr>
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

pointPage(1); // 처음이 1번 페이지

$('#order').change(function() {
	pointPage(showpage);
});

$('#filter').change(function(){	
	pointPage(showpage);
});


function pointPage(startpage){
		
	console.log($('#order').val());
	console.log($('#filter').val());
	
	
	
	$.ajax({
		type:'get',
		url:'/point/list.ajax',
		data:{
			'page':startpage,
			'sort':$('#order').val(),
			'state':$('#filter').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);	
			drawPointList(data.pointList)

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
		error: function(error) {
	        console.error(error);
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