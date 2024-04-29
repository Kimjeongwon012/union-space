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
</style>
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

<!-- 페이지 내용 -->
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
                    <div class="card" style="width: 18rem;">
                        <img src="#" class="card-img-top" alt="...">
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
                    <button type="button" name="update_btn" class="btn btn-primary btn-lg">수정하기</button>
                </div>
                <div class="col-2">
                    <button type="button" name="exit" class="btn btn-success btn-lg">나가기</button>
                </div>
            </div>

            <br/>
            <br/>
        </main>
    </div>
</div>


</body>
<script>
    $(document).ready(function() {
        init();
    });

    function init() {
        // 모임 수정 시 기존 데이터를 폼에 입력
        $('#group_name').val('${groupDTO.group_name}');
        $('#group_introduce').val('${groupDTO.group_introduce}');
        $('#group_caution').val('${groupDTO.group_caution}');

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
            let space_no = '${space_no}';
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
