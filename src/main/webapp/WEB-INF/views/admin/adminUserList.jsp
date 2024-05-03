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

	
	
</style>
<title>AdminPage-UserList</title>
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
            <a class="nav-link" href="#" style="font-weight:bold; color:black;">
              <span data-feather="shopping-cart"></span>
              사용자 포인트 내역 조회
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