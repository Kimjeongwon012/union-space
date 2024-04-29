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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<title>모임 상세보기</title>
<style>
body {
	background: #F5F6FA;
}

h1 {
	color: white;
	font-size: 40px;
	margin-top: 20px;
	margin-left: 30px;
}
h3 {
	font-size: 25px;
	text-align: center;
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

#main {
	padding: 15px;
	margin: 10px;
	margin-left: 60px;
	border-radius: 2%;
}

#sidemenu {
	margin: 10px;
	padding: 15px;
	border-radius: 2%;
}

.header {
	display: inline-block;
	width: 10rem;
	heigth: 4rem;
	margin: 20px;
}

.member {
	margin: 30px;
	wight: 9rem;
}
.groupBtn{
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
#msg{
	color: red;
}
#group_starttime {
    margin-left: 10px;
}
.modal {
  position: fixed;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.yesornoBtn{
	width: 200px;
	background: white;
	border: 1px solid gray;
	color: black;
}
</style>
</head>
<body>
	<main class="container-fluid">
		<div class="row" style="background:#3A4064;">
			<div class="col-7">
				<h1>${groupDTO.group_name}</h1>
			</div>
			<!-- 예약 확정 날짜까지 D-day, 참여중인 인원 수/ 모집 최대 인원 수 -->
			<div class="col-5 d-flex justify-content-end">
<!-- 				(장소 예약 확정 날짜 - 현재 날짜) 
						0 -> D+DAY
						0 초과 -> D+N
						0 미만 -> 모집 완료 -->
				<div class="card header">
					<div class="card-body" style="margin-top: 5px;">
						<h3 class="card-title" style="font-size: 35px;">
						    <c:choose>
						        <c:when test="${dDAY == 0}">
						            D-DAY
						        </c:when>
						        <c:otherwise>
						            D-${dDAY}
						        </c:otherwise>
						    </c:choose>
						</h3>
				  	</div>
				</div>
				<div class="card header" style="width: 24rem;">
					<div class="card-body" style="margin-top: 5px;">
				    	<h3 class="card-title" style="font-size: 35px;">참여 중인 인원 <span>${groupDTO.group_people}</span>/${groupDTO.group_highpeople}</h3>
					</div>
				</div>
				<div id="groupState" class="card header" style="width: 24rem; display: none;">
					<div class="card-body" style="margin-top: 5px;">
				    	<h3 id="msg" class="card-title" style="font-size: 35px;"></h3>
					</div>
				</div>					
			</div>
		</div>
		<div class="row">
			<div id="main" class="col-7" style="background:white;">
				<div class="row">
					<h2>모임 소개</h2>
					<p>${groupDTO.group_introduce}</p>
				</div>
				<hr/>
				<div class="row">
					<div class="row">				
						<h2>모임장</h2>
					    <div class="card member" style="width: 10rem;">
						  	<div class="card-body">
						    	<h3 class="group_creater" class="card-title">${groupRegistrant.user_id}</h3>
						    	<!-- 매너점수 뿌리기 -->
						    	<h3 class="manner_score" class="card-text">${groupRegistrant.user_mannerpoint}</h3>
							</div>
						</div>
					</div>
					<div class="row">				
						<h2>팀원</h2>
						<c:forEach items="${groupMemberList}" var="m">
						    <div class="card member" style="width: 10rem;">
							  	<div class="card-body" style="padding: 12px;">
							    	<h3 class="" class="card-title">${m.user_id}</h3>
							    	<h3 class="manner_score" class="card-text">${m.user_mannerpoint}점</h3>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="sidemenu" class="col-4" style="background:white;">	
				<div class="row">
					<h2>모집 기간</h2>
					<h2 id="group_confirm"></h2>
					
					<hr/>
				</div>
				<br/>
				<div class="row">
					<h2>장소 예약 날짜</h2>
					<h2 id="group_starttime"></h2>
					<hr/>
				</div>
				
				<br/>
				<br/>
				<div id="groupBtn" class="row d-flex justify-content-center"></div>
			</div>
		</div>
	</main>
		
	<!-- 모임 참여 모달창 -->
	<div class="modal" id="modal" style="width:40%; height:60%; place-items:center;">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">모임 참여</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<div class="modal-header">
					<h3 id="modalMsg" class="modal-title">해당 모임에 참여하시겠습니까?</h3>	
				</div>				
				<div class="modal-body d-flex justify-content-center">
					<form id="groupAction"action="/group/paymentJoin.go" method="POST">		
						<input type="hidden" name="group_no" value="${groupDTO.group_no}"/>			
        				<button type="submit" class="btn btn-primary yesornoBtn">예</button>
        				<button type="button" class="btn btn-secondary yesornoBtn" data-bs-dismiss="modal">아니오</button>
					</form>				
				</div>
			</div>			
		</div>
	</div>
</body>
<script>
	var content = '';
	
	if ('${alertMsg}' != '') {
		alert('${alertMsg}');
	}
	switch (${response}) {
		case 7:
			alert('허용되지 않은 접근입니다.');
			location.href="/main";
			break;
		case 6:
			$('#msg').html('삭제된 모임');
			console.log($('#groupState'));
			$('.header').hide();
			$('#groupState').css('display', 'block');
			break;
		case 5:
			$('#msg').html('모집실패');
			$('.header').hide();
			$('#groupState').css('display', 'block');
			break;
		case 4:
			$('#msg').html('모집완료');
			$('.header').hide();
			$('#groupState').css('display', 'block');
			if ('${groupRegistrant.user_id}' == '${sessionScope.loginInfo}') {				
				content += '<form action="/group/edit.go" method="GET">';
				content += '<div style="text-align: center;">';
				content += '<input type="hidden" name="group_no" value="${groupDTO.group_no}"/>';
				content += '<button type="submit" name="groupEditBtn" class="btn btn-success groupBtn">수정하기</button>';
				content += '</div><br/>';
				content += '</form>';
	
				content += '<div style="text-align: center;">';
				content += '<button id="groupDeleteBtn" type="button" class="btn btn-success groupBtn" data-bs-toggle="modal" data-bs-target="#modal">삭제하기</button>';
				content += '</div>';
			}
			break;
		case 3:
			content += '<form action="/group/edit.go" method="GET">';
			content += '<div style="text-align: center;">';
			content += '<input type="hidden" name="group_no" value="${groupDTO.group_no}"/>';
			content += '<button type="submit" name="groupEditBtn" class="btn btn-success groupBtn">수정하기</button>';
			content += '</div><br/>';
			content += '</form>';

			content += '<div style="text-align: center;">';
			content += '<button id="groupDeleteBtn" type="button" class="btn btn-success groupBtn" data-bs-toggle="modal" data-bs-target="#modal">삭제하기</button>';
			content += '</div>';
		    break;
		case 2:
//			content += '<form action="/group/exit.do" method="POST">';
			content += '<div style="text-align: center;">';
//			content += '<input type="hidden" name="group_no" value="${groupDTO.group_no}"/>';
//			content += '<button type="submit" name="groupExitBtn" class="btn btn-success groupBtn">나가기</button>';
			content += '<button id="groupExitBtn" type="button" class="btn btn-success groupBtn" data-bs-toggle="modal" data-bs-target="#modal">나가기</button>';
			content += '</div><br/>';
//			content += '</form>';
			break;
		case 1:
//			content += '<form action="/group/join.do" method="POST">';
			content += '<div style="text-align: center;">';
//			content += '<input type="hidden" name="group_no" value="${groupDTO.group_no}"/>';
//			content += '<button type="submit" name="groupJoinBtn" class="btn btn-success groupBtn">참여하기</button>';
			if (${groupDTO.group_people} < ${groupDTO.group_highpeople}) {				
				content += '<button id="groupJoinBtn" type="button" class="btn btn-success groupBtn" data-bs-toggle="modal" data-bs-target="#modal">참여하기</button>';
			} else {
				content += '<button id="groupJoinBtn" type="button" class="btn btn-success groupBtn" style="background: gray;">참여하기</button>';
			}
			content += '</div><br/>';
//			content += '</form>';
			break;
	}

	$('#groupBtn').html(content);

	$(document).ready(function() {
	    // 데이터
	    var rawData = "${groupDTO.group_confirm}";
	    // 데이터 파싱
	    var endDate = new Date(rawData.replace(' ', 'T'));
	    // 날짜 형식 변경
	    var formattedEndDate = endDate.getFullYear() + "년 " + (endDate.getMonth() + 1) + "월 " + endDate.getDate() + "일 " + endDate.getHours() + "시";
	    // 화면에 표시
	    $("#group_confirm").text("  ~ " + formattedEndDate + "까지");
	    rawData = "${groupDTO.group_starttime}";
	    endDate = new Date(rawData.replace(' ', 'T'));
	    formattedEndDate = endDate.getFullYear() + "년 " + (endDate.getMonth() + 1) + "월 " + endDate.getDate() + "일 " + endDate.getHours() + "시";
	    $("#group_starttime").text(formattedEndDate);
	});
	
	$('#groupExitBtn').click(function() {
		$('#modalMsg').text('모임에서 나가시겠습니까?');
		$('#groupAction').attr('action', '/group/exit.do');
	});
	$('#groupJoinBtn').click(function() {
		$('#modalMsg').text('해당 모임에 참여하시겠습니까?');
		$('#groupAction').attr('action', '/group/paymentJoin.go');
	});
	
	$('#groupDeleteBtn').click(function() {
		$('#modalMsg').text('해당 모임을 삭제하시겠습니까?');
		$('#groupAction').attr('action', '/group/remove.do');
	});
</script>
</html>