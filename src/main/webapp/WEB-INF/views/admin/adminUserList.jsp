<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	#sidebarMenu{
		width: 230px;	
	}
	th, td{
		padding: 10px 20px;
	}
	.modal{
		 position: fixed;
		 top: 50%; /* 상단에서부터 화면의 50% 위치에 배치 */
  		 left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		 transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		 width: 400px;
		 height: 600px;
	}
	#loginN{
		position: fixed;
		top: 50%; /* 상단에서부터 화면의 50% 위치에 배치 */
  		left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		width: 700px;
		height: 600px;
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
<title>AdminPage-UserList</title>
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
        <h1 class="h2">회원 목록 조회</h1>
      </div>
     <form action="/adminpoint/list.go">
     	<div class="row">
        <div class="col-6"></div>
        <div class="col-2">
           <div class="btn-toolbar mb-2 mb-md-0" >
             <div class="btn-group me-2">
             	<input name="keyword" type="text" class="form-control" placeholder="사용자 아이디를 입력해주세요." aria-label="사용자ID" aria-describedby="basic-addon2">
			 	<button id="searchbtn" type="button" value="user_id" class="btn btn-outline-secondary" style="width: 200px; height: 40px;"><i class="bi bi-search"></i></button>
                <select id="order" class="form-select" aria-label="Default select example" style="width: 300px; height: 40px;">
              <option selected value="최신 순">최신 순</option>
              <option value="과거 순">과거 순</option>
              </select>
              <select id="filter" class="form-select" aria-label="Default select example">
              	<option selected value="회원 상태">회원 상태</option>
	    	    <option value="1">일반회원</option>
	        	<option value="2">로그인 불가</option>
	          	<option value="0">탈퇴회원</option>
             </select>
             
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
            <th scope="col">사용자 이름</th>
            <th scope="col">사용자 포인트</th>
            <th scope="col">가입 날짜</th>
            <th scope="col">회원 상태</th>
            <th scope="col">경고 수</th>
          </tr>
        </thead>
        <tbody id="userList">
         
        </tbody>
      </table>
    </div>
    </main> 
    
    <!-- 회원정보 모달 -->
    <div class="modal" id="info">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="display: flex; flex-direction: row;">
					<input type="text" name="user_id" id="user_input_id" style="width:auto; border: none; outline: none;background-color: transparent;" readonly>님의 회원정보
					<button id="searchbtn" type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body" style="display: flex; flex-direction: column;" >
					  <table>
					    <tbody>
					    	<tr>
					    		<th>이름</th>
					    		<td><span id="user_name"></span></td>
					    	</tr>
					    	<tr>
					    		<th>ID</th>
					    		<td><span id="user_id"></span></td>
					    	</tr>
					    	<tr>
					    		<th>PW</th>
					    		<td><span id="user_pw"></span></td>
					    	</tr>
					    	<tr>
					    		<th>전화번호</th>
					    		<td><span id="user_phone"></span></td>
					    	</tr>
					    	<tr>
					    		<th>e-mail</th>
					    		<td><span id="user_email"></span></td>
					    	</tr>					      
					    </tbody>
					  </table>
				</div>	
			</div>			
		</div>
	</div>
	
	<!-- 로그인 불가 기간 -->
    <div class="modal" id="loginN">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="display: flex; flex-direction: column; align-items: flex-start;">
				    <div style="width: 100%; display:  flex; flex-direction: row;justify-content: space-between;">
				        <input type="text" name="user_id" id="user_input_id2" style="width: auto; flex-grow: 1; border: none; outline: none; background-color: transparent;" readonly>
				        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				    </div>
				    <label for="user_input_id2">님의 로그인 불가 기간</label>
				</div>
				<div class="modal-body" style="display: flex; flex-direction: row;" >
					<tbody>
						<table>
							
							<tr>
								<th></th>
								<th>시작날짜</th>
								<th>종료날짜</th>
							</tr>
							<tr>
								<th>로그인 불가 기간</th>
								<td><span id="start_penalty_date"></span></td>
								<td><span id="end_penalty_date"></span></td>
							</tr>
						</table>	
					</tbody>
				</div>	
			</div>			
		</div>
	</div>
    
    <!-- 페이징 -->
    <nav class="d-flex justify-content-sm-center" aria-label="Page navigation" style="text-align:center">
    	<ul class="pagination" id="userListPagination"></ul>
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
adminUListPg(1);

$(document).ready(function() {
    $(document).on('click', '.user-link', function() {
    	var userId = $(this).data('userid');
    	$('#user_input_id').val(userId);
    	
    	$.ajax({
    		type:'get',
    		url:'/admin/getUser.ajax',
    		data:{user_id:userId},
    		success:function(data){
    			userinfo(data.userInfo);
    		},
    		error:function(error){
    			console.log(error)
    		}
    	});
        
    });
});


$(document).ready(function() {
    $(document).on('click', '.user-loginN', function() {
    	
    	if($(this).data('status') == 2){
    		var userId = $(this).data('userid');
    		$('#user_input_id2').val(userId);
    		
    		$.ajax({
    			type:'get',
    			url:'/admin/penalty.ajax',
    			data:{user_id:userId},
    			success:function(data){
    				penaltyTime(data.penaltyTime);
    			},
    			error:function(error){
    				console.log(error)
    			}
    		});
    	}
    	
    	
    	        
    });
});


$('#order').change(function() {
	showpage=1;
	adminUListPg(showpage);
});

$('#filter').change(function(){	
	showpage=1;
	adminUListPg(showpage);
});

$("#searchbtn").click(function(){
	showpage=1;
	adminUListPg(showpage);
});


function adminUListPg(startpage){
	
	console.log(startpage);
	
	$.ajax({
		type:'post',
		url:'/admin/userList.ajax',
		data:{
			'page':startpage,
			'sort':$('#order').val(),
			'state':$('#filter').val(),
			'user_id':$("input[name='keyword']").val()
		},
		dataType:'json',
		success:function(data){
			drawUserList(data.userList);

			
			// 페이징처리
			$('#userListPagination').twbsPagination({
				startPage:startpage, // 시작 페이지
				totalPages:data.totalPages, // 총 페이지 개수
				visiblePages:5,
				initiateStartPageClick: false, // 중요: 초기 페이지 클릭을 방지하여 무한 루프 방지
				onPageClick:function(evt,clickPg){
					adminUListPg(clickPg);
				}
				
			});
		},
		error:function(error){
			console.log(error);
		}
	});
}


// 회원 목록 그리기
function drawUserList(userList){
	var content = '';
	console.log(userList);
	
	for(data of userList){
		content += '<tr>';
		content += '<td><a data-bs-toggle="modal" data-bs-target="#info" class="user-link" data-userId="' + data.user_id + '">' + data.user_id + '</a></td>';
        content += '<td>'+ data.user_name+'</td>';
        content += '<td>'+ data.user_point+'</td>';
        content += '<td>'+ data.user_joindate+'</td>';
        if(data.user_status == 0){
        	content += '<td>탈퇴회원</td>';
        }else if(data.user_status == 1){
        	content += '<td>일반회원</td>';
        }else if(data.user_status == 2){
        	content += '<td><a data-bs-toggle="modal" data-bs-target="#loginN" class="user-loginN" data-status="' + data.user_status +  '" data-userId="' + data.user_id +  '">로그인 불가</a></td>';
        }
        
        content += '<td>'+ data.panalty_warning_cnt+'</td>';
        content += '</tr>';		
	}
	$('#userList').html(content);
}

// 회원정보 모달
function userinfo(userInfo){
	$('#user_name').text(userInfo.user_name);
    $('#user_id').text(userInfo.user_id);
    $('#user_pw').text(userInfo.user_pw);
    $('#user_phone').text(userInfo.user_phone);
    $('#user_email').text(userInfo.user_email);
}

// 로그인 불가 기간 모달
function penaltyTime(penaltyTime){
	$('#start_penalty_date').text(penaltyTime.start_penalty_date);
	$('#end_penalty_date').text(penaltyTime.end_penalty_date);
}






</script>
</html>