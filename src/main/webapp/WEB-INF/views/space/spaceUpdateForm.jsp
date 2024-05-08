<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8f26759fa89f153554cb8f010686303e&libraries=services"></script>

<title>장소 수정</title>
</head>
<style>
.header {
    background-color: #f6f9ff;
    color: #f6f9ff;
    padding: 10px 0;
    display: flex;
    justify-content: center;
    align-items: center;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    
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
	
</style>
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


    
	
	<!-- 페이지 내용 -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
     <h2>장소 정보 수정</h2>
     
     <!-- 등록 form -->
    <form action="/space/register" method="post" enctype="multipart/form-data">
    <div class="container">
		<div class="row gx-5">
		    <div class="col-3">장소명</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="name_input" name="space_name" class="form-control" placeholder="장소명을 입력해주세요" aria-describedby="inputGroup-sizing-default" value="${space.space_name}" readonly>	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
	 	</div>
		<div class="row gx-5 pb-4">
	    <div class="col-3">장소 유형</div>
	    <div class="col-6">
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="space_type" id="type_radio1" value="회의실" ${space.space_type == '회의실' ? 'checked' : ''} disabled>
	            <label class="form-check-label" for="type_radio1">회의실</label>
	        </div>
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="space_type" id="type_radio2" value="스터디룸" ${space.space_type == '스터디룸' ? 'checked' : ''} disabled>
	            <label class="form-check-label" for="type_radio2">스터디룸</label>
	        </div>
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="space_type" id="type_radio3" value="파티룸" ${space.space_type == '파티룸' ? 'checked' : ''} disabled>
	            <label class="form-check-label" for="type_radio3">파티룸</label>
	        </div>
	        <div class="form-check form-check-inline">
	            <input class="form-check-input" type="radio" name="space_type" id="type_radio4" value="카페" ${space.space_type == '카페' ? 'checked' : ''} disabled>
	            <label class="form-check-label" for="type_radio4">카페</label>
	        </div>
	    </div>
	</div>
		<div class="row gx-5">
		    <div class="col-3">장소 대여 금액</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="number" id="price_input" name="space_point" class="form-control" placeholder="정확한 금액을 입력해주세요" value="${space.space_point}">	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5 mb-3">
		    <div class="col-3">장소 지역</div>
		    <div class="col-2">
				<select id="region_select" name="space_region" class="form-select" size="1" disabled>
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 주소</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="addr_input" name="space_address" class="form-control" onchange="transAddr()" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${space.space_address}" readonly>	
				  <input type="hidden" id="latitude_input" name="space_latitude">
				  <input type="hidden" id="longitude_input" name="space_longitude">
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-3">사용 가능 최대 인원</div>
		    <div class="col-2">
				<select id="max_select" name="space_max" class="form-select" size="1" disabled>
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5 mb-3">
		    <div class="col-3">사용 가능 최소 인원</div>
		    <div class="col-2">
				<select id="min_select" name="space_min" class="form-select" size="1" disabled>
				</select>
		    </div>
   		    <div class="col-6"></div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">운영 시간</div>
		    <div id="time_div" class="col-8 pb-3">
			</div>
		 </div> 
		 <div class="row gx-5">
		    <div class="col-3">장소 소개</div>
		    <div class="col-6">
				<div class="form-floating mb-3">
					<textarea id="intro_input" name="space_intro_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea" value="">${space.space_intro_content}</textarea>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div> 
 		 <div class="row gx-5">
		    <div class="col-3">장소 전화번호</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="text" id="phone_input" name="space_contact" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${space.space_contact}" readonly>	
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">시설 안내</div>
		    <div class="col-6">
				<div  class="form-floating mb-3">
					<textarea id="guide_input"  name="space_guide_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">${space.space_guide_content}</textarea>
					<label for="floatingTextarea">시설 안내</label>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		 </div>
		 <div class="row gx-5">
		    <div class="col-3">장소 유의사항</div>
		    <div class="col-6">
				<div  class="form-floating mb-3">
					<textarea id="notice_input" name="space_notice_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">${space.space_notice_content}</textarea>
					<label for="floatingTextarea">장소 유의사항</label>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
  		<div class="row gx-5">
	    	<div class="col-3">대표 사진</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="file" id="mainImg_input" name="mainPhoto" class="form-control" multiple="multiple" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" id="mainImg_btn" class="btn btn-primary" >등록</button>
				</div>
		    </div>
		    <div class="col-1">
		    </div>
		</div>
		<div class="row gx-5">
	    	<div class="col-3">장소 사진</div>
		    <div class="col-6">
				<div class="input-group mb-3">
				  <input type="file" id="img_input" name="photos" class="form-control" multiple="multiple" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">	
			      <button type="button" id="img_btn" class="btn btn-primary" >등록</button>
				</div>
		    </div>
		    <div class="col-1"></div>
		</div>
		<div class="row gx-5">
		    <div class="col-10"></div>
		    <div class="col-2">
		    	<button class="btn btn-primary">수정</button>
		    </div>
		</div>
	</div> 
	<input type="hidden" id="space_no" name="space_no" value="${space_no}">
	
	</form>
    <!-- 등록 form_End -->
    </main>
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

</body>
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
	// 변수
	var addr_flag = false;
	
	
		
	$(document).ready(function() {
		
		// <select> 생성		
		let content;
		
		// 장소 지역
		const region = ['강남구', '강북구', '강서구', '관악구', '구로구', '금천구', '종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', '성북구', '도봉구', '노원구', '은평구', '서대문구', 
			'마포구', '양천구', '영등포구', '동작구', '서초구', '송파구', '강동구']
		for(let r of region){
			content += "<option value="+r+">"+r+"</option>";
		}
		$('#region_select').append(content);
		
		// 운영시간
		const dayWeek = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
		content = '';
		
		var idx = 0;
		for(const dw of dayWeek){
			content = '<div class="col mb-3"><div class="input-group mb-3"><input type="text" name="space_day" class="form-input" value="'
			content += dw+'" disabled><select name="';
			content += idx+'start" class="startTime_select form-select-inline" size="1">';
			for(var i=1; i<24; i++){
				content += "<option value="+i+">"+i+"</option>";
			}
			content += '</select><span class="mt-1 mr-1 ml-1"> ~ </span>';
			content += '<select name="';
			content += idx+'end" class="endTime_select form-select-inline" size="1">';
			for(var i=2; i<25; i++){
				content += "<option value="+i+">"+i+"</option>";
			}
			content += '</select></div>';
			//console.log(content);
			$('#time_div').append(content);
			idx++;
			
		}
		// 최대/최소 인원_option 생성
		content = '';
		for(var i=1; i<=20; i++){
			content += "<option value="+i+">"+i+"</option>";
		}
		$('#max_select').append(content);
		$('#min_select').append(content);

		// <select> 기본 옵션 설정
		// 지역
		$('#region_select').val('금천구').prop("selected", true);
		// 운영시간
		$('.startTime_select').val('9').prop("selected", true);
		$('.endTime_select').val('22').prop("selected", true);		
		// 최대/최소 인원
		$('#max_select').val('1').prop("selected", true);
		$('#min_select').val('3').prop("selected", true);
		
	});
	
	//event

	//function
	
	// 주소 -> 자표 변환
	function transAddr(){		
		var addr = $('#addr_input').val();
		console.log('주소: '+addr	);
		
		if(addr != null){
			// 카카오 주소-좌표 변환 객체 생성
			const geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색
			geocoder.addressSearch(addr, function(result, status) {
				 // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	// 위도, 경도
			        if(result[0].x == null || result[0].y == null){
			        	result[0].x = 0.0;
			        	result[0].y = 0.0;
			        }
			        $('#latitude_input').val(result[0].y);
			        $('#longitude_input').val(result[0].x);
			        
			        console.log('주소 좌표: '+coords);
			     }
			});
			addr_flag = true;
		}

	}
	// 수정 버튼 클릭 이벤트 핸들러
    $('form').submit(function(e) {
        e.preventDefault(); // 기본 동작 방지
        var space_no = $('#space_no').val();
        
        space_no = parseInt(space_no);
        
        var latitude = $('#latitude_input').val();
        var longitude = $('#longitude_input').val();
		
        // 수정할 장소 정보를 FormData로 가져옴
        var formData = new FormData($(this)[0]);
        formData.append("space_no", space_no);
        console.log(space_no);
        console.log( $('#space_no').val());
        
        // AJAX를 이용해 서버에 수정된 정보를 전송
        $.ajax({
            url:'/space/update.do', // 수정 처리를 담당하는 서버의 URL
            type:'POST',
            data:formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response.space_no);
                alert('장소 정보가 수정되었습니다.');
                window.location.href = '/space/detail.go?space_no='+space_no;
            },
            error: function(xhr, status, error) {
                // 수정 중 오류가 발생하면 오류 메시지를 표시
                alert('장소 정보를 수정하는 중 오류가 발생했습니다.');
                console.error(xhr.responseText);
            }
        });
        
    });

	
	
</script>
</html> 