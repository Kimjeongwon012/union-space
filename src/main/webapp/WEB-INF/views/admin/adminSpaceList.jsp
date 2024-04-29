<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"	/>
<link rel="stylesheet" href="/resources/css/style.css"	/>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<title>등록한 장소 목록 조회</title>
<style>
	th, td {
		text-align: center;
	}
</style>
</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Admin Page</a>
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
        <!-- 사이드바 메뉴 -->
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              예약 전체 내역 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              회원 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              포인트 충전 및 사용 내역
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/space/list.go">
              <span data-feather="users"></span>
              <b>등록한 장소 목록 조회</b>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/space/register.go">
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
      </div>
    </nav>
    <!-- 사이드바 메뉴_End -->
	<!-- MainContent -->    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">등록한 장소 리스트 조회</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <button id="delete_btn" type="button" class="btn btn-primary btn-sm" >삭제</button>
        </div>
      </div>
	
	<!-- table -->
      <div class="table-responsive">
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
          <tbody id="list-tbody">
           	<tr>
          		<td class="checkBox">
				  <input class="form-check-input" type="checkbox">
          		</td>
				<td class="name"></td>
				<td class="region"></td>
				<td class="registDate"></td>
				<td class="rsvCnt"></td>
				<td class="point"></td>
				<td class="status">
					<select id="status_select" name="space_status" class="form-select form-select-sm">	
						<option value="0">영업 중지</option>
						<option value="1">영업중</option>
						<option value="2">영업 종료</option>
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
      <nav class="nav justify-content-center">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach var="i" begin="1" end="5">
		    	<li class="page-item"><a class="page-link" href="#">${i}</a></li>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		<!-- paginationEnd -->
    </main>
    <!-- MainEnd -->
    
  </div>
</div>
<!-- modals -->
<div id="delet_modal" class="modal" tabindex="-1">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
        <p>해당 장소를 삭제 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal" onclick="closeDeleteModal()">취소</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="deleteSpace()">삭제</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
	
	// 변수
	var page=1;
	const checkedNo = new Set();
	
	$(document).ready(function() {
		getSpaceList();
	});
	
	//event
	// 삭제 버튼 클릭 시
	$('#delete_btn').on('click', function(){
		console.log('삭제할 장소 번호: ', checkedNo);
		console.log('삭제할 장소 번호: ', checkedNo.size);
		
		if(checkedNo.size < 1){
			alert('삭제할 데이터가 없습니다.');
		} else{
			$('#delet_modal').modal('show');			
		}
	});
	// 각 수정 버튼 클릭 시
	$('#update_btn').click(function(e){
		var space_no = $(e.target).val();
		console.log('수정: ',space_no);
		location.href = "space/update?idx="+space_no;
		
	});
	
	// 체크박스 전체 선택
	$('#checkAll_input').on("click", function(){
		if($("#checkAll_input").is(":checked")) {
			$(".form-check-input").prop("checked", true);
		}else {
			$(".form-check-input").prop("checked", false);
		}
		var chk = $(".checkBox input");
		chk.each(function(idx, item){
			if($(item).is(":checked")){
	        	var val = $(this).val();
	        	checkedNo.add($(this).val());
	      	}else {
	      		checkedNo.delete($(this).val());
	      	}
		});
		//console.log(checkedNo);			
	});
	// 체크 박스 선택 시
	$('.checkBox input').on({
		click: function(e){
			console.log('click ckb: ',$(e.target).val());
			if($("#checkAll_input").is(":checked")){
				$("#checkAll_input").prop("checked", false);
			}
			if($(e.target).is(":checked")){
				checkedNo.add($(e.target).val());
			} else{
				checkedNo.delete($(e.target).val());
			}
			//console.log(checkedNo);
		}
	});
	
	// method
	// 장소 삭제 모달 창 닫기 버튼 클릭
	function closeDeleteModal(){
		$('#delet_modal').modal('hide');
		checkedNo.clear();
		console.log('삭제set: ', checkedNo);
		$(".form-check-input").prop("checked", false);
	}
	
	// 장소 삭제
	function deleteSpace(){
		$('#delet_modal').modal('hide');
		$(".form-check-input").prop("checked", false);

		for(let idx of checkedNo){
			console.log('삭제할 idx: ', idx);

			/* $.ajax({
			type	: 'post',
			url		: '/space/delete',
			data	: idx,
			dataType: 'json',
			success	: function(result){
				console.log('getSpaceList: ',result.spaceList);	
			},
			error	:	function(error){
				console.log(error);
			}
		}); */
			
		}
		
	}
	
	// 장소 리스트 가져오기
	function getSpaceList(){
		$.ajax({
			type	: 'get',
			url		: '/space/list/get',
			dataType: 'json',
			success	: function(result){
				console.log('getSpaceList: ',result.spaceList);	
				if(result.spaceList.length > 0){
					result.spaceList.forEach(data => {
						createTable(data);	
					});
					$('#list-tbody').find('tr').first().empty();
					
				}else{
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
	// 리스트 테이블로 생성
	function createTable(data){
		let table = $('#list-tbody').find('tr').first().clone(true);
		var date = new Date(data.space_regist_date);
		
		table.find('.form-check-input').val(data.space_no);
		table.find('.name').text(data.space_name);
		table.find('.region').text(data.space_region);
		table.find('.registDate').text(date.toLocaleDateString());
		table.find('.rsvCnt').text(data.space_rsvCnt);
		table.find('.point').text(data.space_point);
		table.find('#status_select').val(data.space_status).prop('selected', true);
		table.find('#update_btn').val(data.space_no);

		$('#list-tbody').append(table);
		
	}	
	
	
</script>
</html> 