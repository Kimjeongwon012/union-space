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

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<title>등록한 장소 목록 조회</title>
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
					<a href="/qna/list.go">문의 게시판</a>
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
		 	<h1>등록한 장소 리스트 조회</h1>
		</div>
	
	<!-- filtering -->
	<div class="row search flex-grow-1 mb-3">
		<div class="col-md-2 col-sm-6 filter_div">
			<select id="region_select" class="form-select">
				<option value="all" selected>전체</option>
			</select>				
		</div>
		<div class="col-md-2 col-sm-6 filter_div">
			<select id="statusFilter_select" class="form-select">
				<option value="all" selected>전체</option>
				<option value="0">영업중</option>
				<option value="1">영업 중지</option>
			</select>				
		</div>
		<div class="col-md-2 col-sm-6 filter_div">
			<select id="order_select" class="form-select">
				<option value="recent" selected>최신 등록순</option>
				<option value="point">누적 포인트순</option>
			</select>				
		</div>
 	</div>
	<!-- filteringEnd -->

	<!-- table -->
	<div id="table-container" class="table-responsive">
	</div>
	<div id="table-template" class="table-responsive" style="display: none;" >
		<table id="list-table" class="table">
		<thead>
			<tr>
			<th scope="col">
				<div class="form-check">
				  <input id="checkAll_input" class="form-check-input" type="checkbox">
				</div>
			</th>
			<th scope="col">장소 이름</th>
			<th scope="col">지역</th>
			<th scope="col">장소 등록 날짜</th>
			<th scope="col">예약 건수</th>
			<th scope="col">누적 포인트</th>
			<th scope="col">장소 운영 상태</th>
			<th scope="col">수정</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="checkBox">
				  <input class="form-check-input" type="checkbox">
				</td>
				<td class="name">
					<a data-bs-toggle="modal" href="#spaceDetail-modal" ></a>
				</td>
				<td class="region"></td>
				<td class="registDate"></td>
				<td class="rsvCnt"></td>
				<td class="point"></td>
				<td class="status">
					<select id="status_select" name="space_status" class="form-select form-select-sm">	
						<option value="0">영업 중지</option>
						<option value="1">영업중</option>
					</select>
				</td>
				<td class="update">
					<button id="update_btn" type="button" class="btn btn-primary btn-sm" >수정</button>
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
<!-- modals -->
<!--  장소 삭제 확인 모달창 -->
<div id="delete-modal" class="modal" tabindex="-1">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
		<div class="modal-body">
		  <p>해당 장소를 삭제 하시겠습니까?</p>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal" onclick="closeDeleteModal()">취소</button>
		  <button id="delete_yes_btn" type="button" class="btn btn-primary btn-sm" >삭제</button>
		</div>
    </div>
  </div>
</div>

<!-- 장소 상세 보기 모달창 -->
<div id="spaceDetail-modal" class="modal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title">장소 상세 정보</h5>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<div class="row gx-5 pb-3">
			<div class="col-5">장소 번호</div>
		    <div class="col-6">
				<div class="input-group">
				  <input type="text" id="space_no" class="form-control" readonly>	
				</div>
		    </div>
	 	</div>
			<div class="row gx-5 pb-3">
			<div class="col-5">장소명</div>
		    <div class="col-6">
				<div class="input-group">
				  <input type="text" id="name" class="form-control" readonly>	
				</div>
		    </div>
	 	</div>
			<div class="row gx-5 pb-3">
			<div class="col-5">상세 주소</div>
		    <div class="col-6">
				<div class="input-group">
				  <input type="text" id="address" class="form-control" readonly>	
				</div>
		    </div>
	 	</div>
			<div class="row gx-5 pb-3">
			<div class="col-5">전화번호</div>
		    <div class="col-6">
				<div class="input-group">
				  <input type="text" id="contact" class="form-control" readonly>	
				</div>
		    </div>
	 	</div>
		 <div class="row gx-5 pb-3">
		    <div class="col-5">사용 가능 최대 인원</div>
		    <div class="col-3">
				<input type="text" id="ava_max" class="form-control" readonly>
		    </div>
		 </div>
		 <div class="row gx-5 pb-3">
		    <div class="col-5">사용 가능 최소 인원</div>
		    <div class="col-3">
				<input type="text" id="ava_min" class="form-control" readonly>
		    </div>
		 </div>
			
		</div>
    </div>
  </div>
</div>
</body>
<script>

	const checkedNo = new Set();
	const rowArr = new Array();
	let showPage = 1;
	let filterType;
	let filterVal;
	var isLoggedIn = '';
	var content
	const region = ['강남구', '강북구', '강서구', '관악구', '구로구', '금천구', '종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', '성북구', '도봉구', '노원구', '은평구', '서대문구', 
		'마포구', '양천구', '영등포구', '동작구', '서초구', '송파구', '강동구']
	
	$(document).ready(function() {

		// 장소 목록 리스트
		getSpaceList(showPage);

		// 장소 지역
		for(let r of region){
			content += "<option value="+r+">"+r+"</option>";
		}
		$('#region_select').append(content);
		
		// 로그인 상태
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
			console.log('로그인 상태');
			
		}
	});
	
	
	// ajax
	// 장소 상태 변경
	function changeStatus(param){
		console.log('변경 param: ', param);
		$.ajax({
			type	: 'post',
			url		: '/space/updateState',
			data	: param,
			dataType: 'json',
			success	: function(result){
				if(result.msg > 0){
					console.log('변경 완료');
				}
			},
			error	:	function(error){
				console.log(error);
			}
		});
	}
	// 장소 삭제
	function deleteSpace(idx){
		$.ajax({
			type	: 'post',
			url		: '/space/delete',
			data	: {'idx'	: idx},
			dataType: 'json',
			success	: function(result){
				if(result.msg > 0){
					console.log('삭제 완료');
				}
			},
			error	: function(error){
				console.log(error);
			}
		});
	}

	// 장소 리스트 가져오기
	function getSpaceList(page){
		let table = $('#table-template table').clone(true);
		$('#table-container').empty();
		$('#table-container').append(table);		
		$(".form-check-input").prop("checked", false);
    	rowArr.splice(0, rowArr.length);
		checkedNo.clear();

		$.ajax({
			type	: 'get',
			url		: '/space/list/get',
			data	: {'page'	: page},
			dataType: 'json',
			success	: function(result){
				console.log('getSpaceList: ',result.spaceList);
				// 장소 있을 경우 리스트업
				if(result.spaceCnt > 0){
					result.spaceList.forEach((data, idx) => {
						//console.log(idx+': data: ',data);
						createTable(idx, data);	// 리스트에 값 대입
					});
					loadPage(result.currPage, result.spaceCnt);
					
				}else{	// 장소가 없을 경우 
					let td = $('#list-tbody').find('td').first().clone();
					$('#list-tbody').find('tr').empty();
					td.removeClass('checkBox');
					td.attr('colspan', '8');
					td.text("등록한 장소가 없습니다.");
					$('#list-tbody').find('tr').append(td);
				}
			},
			error	:	function(error){
				console.log(error);
			}
		});
	}
	//ajaxEnd
	
	//event
	$('.filter_div').on('change', function(){
		filter = $(this).find('select');
		console.log('필터링: ', );
		switch(filter.attr('id')){
		case 'region_select':
			filterType = 'region';
			filterVal = filter.val();
			break;
		case 'statusFilter_select':
			filterType = 'status';
			filterVal = filter.val();
			break;
		case 'order_select':
			filterType = 'order';
			filterVal = filter.val();
			break;
		}
	});	
	// 장소명 클릭 시(장소 상세 모달창 open)
	$('.name a').click(function(){
		var idx = $(this).attr("name");
		var modal = $('#spaceDetail-modal');
		console.log('클릭 row idx: ',idx);
		modal.find('#space_no')[0].value = rowArr[idx].get('space_no');
		modal.find('#name')[0].value = rowArr[idx].get('name');
		modal.find('#address')[0].value = rowArr[idx].get('address');
		modal.find('#contact')[0].value = rowArr[idx].get('contact');
		modal.find('#ava_max')[0].value = rowArr[idx].get('ava_max');
		modal.find('#ava_min')[0].value = rowArr[idx].get('ava_min');

	});
	// 각 수정 버튼 클릭 시
	$('#update_btn').click(function(e){
		var space_no = $(e.target).val();
		console.log('수정: ',space_no);
		location.href = "./update.go?space_no="+space_no;
	});
	// 장소 운영 상태 변경 시
	$('#status_select').on('change', function(){
		let idx = $(this).attr('name');
		let val = $(this).val();
		console.log(idx, ' 장소 운영 상태: ',val);
		let param = {
				'idx'	: idx,
				'state'	: val
		}
		changeStatus(param);
	});
	// 삭제 버튼[확인] 클릭 시
	$('#delete_yes_btn').on('click', function(){
		$('#delete-modal').modal('hide');

		for(let idx of checkedNo){
			if(idx == 'on'){
				checkedNo.delete(idx);
			}
			console.log('삭제할 idx: ', idx);
			//deleteSpace(idx);
		}
		showPage = 1;
		getSpaceList(showPage);

	});
	// 체크박스 전체 선택
	$('#checkAll_input').on("click", function(){
		var checkAll = $(this);
		if($("#checkAll_input").is(":checked")) {
			$(".form-check-input").prop("checked", true);
		}else {
			$(".form-check-input").prop("checked", false);
		}
		
	});
	// 체크 박스 선택 시
	$('.checkBox input').on('click', function(e){
		console.log('click ckb: ',$(e.target).val());
		
		if($("#checkAll_input").is(":checked")){
			$("#checkAll_input").prop("checked", false);
		}
	});
	//eventEnd
	
	// method
 	// [장소 삭제 모달창]닫기 버튼 클릭
	function closeDeleteModal(){
		$('#delete-modal').modal('hide');
		$(".form-check-input").prop("checked", false);
		checkedNo.clear();
		console.log('삭제set: ', checkedNo);
	}
	// [장소 삭제]버튼 클릭
	function openDeleteModal(){
		var chk = $(".checkBox input");
		chk.each(function(idx, item){
		  	var space_no = $(item).val();

		  	if($(item).is(":checked")){
			  	checkedNo.add(space_no);
				}else {
					checkedNo.delete(space_no);
				}
		  	if(space_no == 'on'){
		  		//console.log('제외할: ',idx, '번호: ', space_no)
		  		checkedNo.delete(space_no);
		  	}
		});
		console.log('선택한 장소 번호: ', checkedNo);
		console.log('선택 번호 수: ', checkedNo.size);
		if(checkedNo.size < 1){
			alert('삭제할 데이터가 없습니다.');
			$(".form-check-input").prop("checked", false);
		} else{
			$('#delete-modal').modal('show');
		}
	}
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
		    	getSpaceList(showPage);
		    }
	     });
	}
	// 리스트 테이블로 생성
	function createTable(row, data){
		const detailMap = new Map();
		var date = new Date(data.space_regist_date);
		var td = $('#table-template tbody').find('tr').clone(true);
		// 장소 정보 저장
		detailMap.set('space_no', data.space_no);
		detailMap.set('name', data.space_name);
		//detailMap.set('name', details.eq(2).val());
		detailMap.set('contact', data.space_contact);
		detailMap.set('address', data.space_address);
		detailMap.set('region', data.space_region);
		detailMap.set('regist_date', data.space_regist_date);
		detailMap.set('rsv',  data.space_rsvCnt);
		detailMap.set('point', data.space_point);
		detailMap.set('ava_max', data.space_max);
		detailMap.set('ava_min', data.space_min);
		rowArr.push(detailMap);
 		// table row 값 입력
		td.find('.name').find('a').text(data.space_name);
		td.find('.region').text(data.space_region);
		td.find('.registDate').text(date.toLocaleDateString());
		td.find('.rsvCnt').text(data.space_rsvCnt);
		td.find('.point').text(data.space_point);
		// row attributes
		td.find('.form-check-input').val(data.space_no);
		td.find('#status_select').val(data.space_status);
		td.find('#status_select').val(data.space_status).prop('selected', true);
		td.find('#update_btn').val(data.space_no);
		td.find('.name').find('a').attr('name', row);
		td.find('#status_select').attr('name', data.space_no);
		
		$('#list-table tbody').find('tr').first().empty();
		$('#table-container tbody').append(td);
		
	}
	
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
	//methodEnd
	
</script>
</html> 