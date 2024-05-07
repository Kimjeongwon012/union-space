<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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


   

<!-- 페이지 내용 -->
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
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>모임 수정</h2>
            </div>
            <div class="row gx-5">
                <!-- 모임 이름 -->
                <div class="input-group mb-3">
                    <div class="col-2">
                        <p>모임 이름</p>
                    </div>
                    <div class="col-7">
                        <input type="text" id="group_name" class="form-control" placeholder="모임의 이름을 작성해주세요." aria-label="Username" aria-describedby="basic-addon1" value="${groupDTO.group_name}">
                    </div>
                    <div class="col-1"></div>
                </div>
            </div>
            <br/>
            <br/>

            <br/>
            <div class="input-group">
                <div class="col-2">
                    <p>모임 소개</p>
                </div>
                <div class="col-7">
                    <div class="form-floating">
                        <textarea class="form-control" id="group_introduce" style="height: 300px">${groupDTO.group_introduce}</textarea>
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
                        <textarea class="form-control" id="group_caution" style="height: 300px">${groupDTO.group_caution}</textarea>
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
            <div class="row justify-content-center mt-3">
                <div class="col-2">
                    <button id="btn" type="button" name="update_btn" class="btn btn-primary btn-lg">수정하기</button>
                </div>
                <div class="col-2">
                    <button id="btn" type="button" name="exit" class="btn btn-success btn-lg">나가기</button>
                </div>
            </div>

            <br/>
            <br/>
        </main>
    </div>
</div>
<div class="container-fluid">
  <div class="row">
    
    <nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white">
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


    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="background:black">
    </main>
  </div>
</div>

</body>
<script>
$(document).ready(function() {
    init();

    // 검색 버튼 클릭 시 동작
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

function init() {
    // 모임 수정 시 기존 데이터를 폼에 입력
	    $('#group_name').val(`${groupDTO.group_name}`);
		$('#group_introduce').val(`${groupDTO.group_introduce}`);
		$('#group_caution').val(`${groupDTO.group_caution}`);

    // 수정 버튼 클릭 시 동작
    $('button[name="update_btn"]').click(function(){
        let form = {
            group_no: '${groupDTO.group_no}', 
            group_name: $('#group_name').val(),
            group_introduce: $('#group_introduce').val(),
            group_caution: $('#group_caution').val()
        };
        
        // 유효성 검사
        if (form.group_introduce == '') {
            alert('모임 소개 내용을 작성해주세요.');
        } else if (form.group_caution == '') {
            alert('모임 주의사항을 작성해주세요.');
        } else if (form.group_name == '') {
            alert('모임의 이름을 작성해주세요.');
        } else {
            $.ajax({
                type: 'POST',
                url: '/group/edit.do', // 수정을 처리하는 서버의 URL
                data: form,
                success: function(response) {
                    alert('모임이 성공적으로 수정되었습니다.');
                    window.location.href = '/group/detail.go?group_no=' + form.group_no;
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    alert('모임 수정 중 오류가 발생했습니다. 관리자에게 문의해주세요.');
                }
            });
        }
    });

    // 나가기 버튼 클릭 시 동작
    $('button[name="exit"]').click(function(){
    	var space_no = '${space_no}';
        console.log('space_no:', space_no); // space_no 값 콘솔에 출력
        if (space_no.trim() !== '') { // space_no가 비어있지 않은지 확인
            console.log(1);
            window.location.href = '/space/detail.go?space_no=' + space_no;
        } else {
            console.error('space_no is empty'); // space_no가 비어있는 경우 콘솔에 오류 출력
        }
    });
}
</script>



</html>
