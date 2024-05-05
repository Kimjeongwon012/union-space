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
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>모임 등록</title>
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

	h1 {
		margin-right: 10px;
		margin-top: 5px;
		font-size: 20px;
	}
	.form-input {
		background: white;
	}
	p {
		margin-right: 10px;
		margin-top: 5px;
		top: 5px;
	}
	.form-control {
		resize: none;
	} 
	#btn{
	    width: 250px;
	    height: 60px;
	    font-size: 30px;
	    background: #3a4064;
	    border: 0px;
	    color: white;
	    font-weight: 500;
	    opacity: 100%;
	    margin-bottom: 10px;
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
  <!-- 검색 버튼과 검색 상자를 하나의 그룹으로 묶기 -->
  
</div>
</div>

	<nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"style="background:white; margin-top:90px;position: absolute;">
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

<!-- 페이지 내용 -->
<div class="container-fluid" style="display: flex;">
	<div class="col-2" style="width: 300px;"></div>
	<div class="col-10" style="flex-grow: 1;margin-top: 50px;">
	<div class="row">
		<main class="col-md-9 col-lg-10 px-md-4" style="margin-left: 200px;">
			<div class="d-flex align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h2>모임 등록</h2>
			</div>
				<div class="row gx-5">
				    <!-- 모임 이름 -->
				    <div class="input-group mb-3">
				    	<div class="col-2">
				        	<p>모임 이름</p>
				        </div>
				        <div class="col-7">
				        	<input type="text" id="group_name" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1">
				        </div>
				        <div class="col-1"></div>
				    </div>
				</div>
				<br/>
				<div class="row gx-5">
					<div class="input-group mb-3">
						<div class="col-2">
							<p>모임 최소 인원</p>
						</div>
						<div class="col-7">
							<select id="group_lowpeople" class="form-select" aria-label="Default select example">
								<option selected disabled>최소 인원 선택</option>
							</select>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 최대 인원</p>
					</div>
					<div class="col-7">
						<select id="group_highpeople" class="form-select" aria-label="Default select example">
						  <option selected disabled>최대 인원 선택</option>
						</select>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 소개</p>
					</div>
					<div class="col-7">
						<div class="form-floating">
						  <textarea class="form-control" id="group_introduce" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>모임 주의사항</p>
					</div>
					<div class="col-7">
						<div class="form-floating">
						  <textarea class="form-control" id="group_caution" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<br/>
				<br/>
				<div class="input-group">
					<div class="col-2">
						<p>장소 정보</p>
					</div>
					<div class="col-7">
						<div class="card w-100">
						  <img src="${photoSrc}" class="img-fluid rounded-start w-100" style="height: 500px;" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">${spaceDTO.space_name}</h5>
						    <h6 class="card-title">${spaceDTO.space_region}</h6>
						    <h6 class="card-title">수용 인원 최소 ${spaceDTO.space_min}명 ~ 최대 ${spaceDTO.space_max}명</h6>
						  </div>
						</div>
					</div>
					<div class="col-1">
					</div>
				</div>
				<div class="row" style="text-align: center;">
					<form style="width: 200px;text-align: center;margin-right: 20px;margin-left: 30%;" action="/group/paymentRegistration.go" method="POST">
	        			<input type="hidden" name="space_no" value="${space_no}"/>
	        			<input type="hidden" name="user_id" value=""/>
	        			<input type="hidden" name="group_name" value=""/>
	        			<input type="hidden" name="group_people" value=""/>
	        			<input type="hidden" name="group_introduce" value=""/>
	        			<input type="hidden" name="group_caution" value=""/>
	        			<input type="hidden" name="group_starttime" value=""/>
	        			<input type="hidden" name="group_endtime" value=""/>
	        			<input type="hidden" name="group_lowpeople" value=""/>
	        			<input type="hidden" name="group_highpeople" value=""/>
						<button id="btn" style="width: 200px;" type="button" name="reservation_btn" class="btn btn-success">등록하기</button>
					</form>
					<button id="btn" style="width: 200px;text-align: center;" onclick="exit()" type="button" name="exit" class="btn btn-success justify-content-sm-center">나가기</button>
				</div>
			<br/>
			<br/>
		</main>
	</div>
	</div>
</div>
</body>
<script>
	function exit() {
		window.location.href='/home';
	}

	$(document).ready(function() {
		init();
	});
	function init() {
	    for (var i = parseInt(${spaceDTO.space_min}); i <= parseInt(${spaceDTO.space_max}); i++) {
	        var option = $("<option>", {
	            value: i,
	            text: i
	        });
	        
	        $('#group_lowpeople').append(option);
	    }
	    for (var i = parseInt(${spaceDTO.space_min}); i <= parseInt(${spaceDTO.space_max}); i++) {
	        var option = $("<option>", {
	            value: i,
	            text: i
	        });
	        
	        $('#group_highpeople').append(option);
	    }
		$('button[name="reservation_btn"]').click(function(){
			let form = {
				space_no			: '${spaceDTO.space_no}',
				user_id				: '${user_id}',
			    group_name			: $('#group_name').val(),
			    group_people		: ${group_people},
			    group_introduce		: $('#group_introduce').val(),
			    group_caution		: $('#group_caution').val(),			     
			    group_starttime		: '${start_date}',
			    group_endtime   	: '${end_date}',
			    group_lowpeople 	: parseInt($('#group_lowpeople').val()),
			    group_highpeople	: parseInt($('#group_highpeople').val())
			};
			console.log(form);
			if (form.group_highpeople < form.group_lowpeople) {
				alert('모집 최소 인원은 최대 인원보다 크지 않아야 합니다.');
			} else if (form.group_introduce == '') {
				alert('모임 소개 내용을 작성해주세요.');
			} else if (form.group_caution == '') {
				alert('모임 주의사항을 작성해주세요.');
			} else if (form.group_name == '') {
				alert('모임의 이름을 작성해주세요.');
			} else {
				$('input[name="space_no"]').val(form.space_no);
				$('input[name="user_id"]').val(form.user_id);
				$('input[name="group_name"]').val(form.group_name);
				$('input[name="group_people"]').val(form.group_people);
				$('input[name="group_introduce"]').val(form.group_introduce);
				$('input[name="group_caution"]').val(form.group_caution);
				$('input[name="group_starttime"]').val(form.group_starttime);
				$('input[name="group_endtime"]').val(form.group_endtime);
				$('input[name="group_lowpeople"]').val(form.group_lowpeople);
				$('input[name="group_highpeople"]').val(form.group_highpeople);
				$('form').submit();
			}
		});
		$('button[name="exit"]').click(function(){
			
			console.log(1);
		});
	}
</script>
<script>
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