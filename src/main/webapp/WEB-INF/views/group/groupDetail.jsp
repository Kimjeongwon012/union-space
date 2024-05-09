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
.rheader {
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
body {
	background: #F5F6FA;
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
	text-align: center;
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
	<div class="rheader">
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
	
	<main class="container-fluid" style="display: flex;">
		<div class="col-12" style="flex-grow: 1;">
		<div class="row" style="background:#3A4064;">
			<div class="col-7">
				<h1 style="font-size: 35px;color: white;margin: 25px;">${groupDTO.group_name}</h1>
			</div>
			<!-- 예약 확정 날짜까지 D-day, 참여중인 인원 수/ 모집 최대 인원 수 -->
			<div class="col-5 d-flex justify-content-end">
<!-- 				(장소 예약 확정 날짜 - 현재 날짜) 
						0 -> D+DAY
						0 초과 -> D+N
						0 미만 -> 모집 완료 -->
				<div class="card header" style="text-align: center;width: 12rem;height: 85px;"> 
					<h3 class="card-title" style="font-size: 25px;color:black;">
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
				<div class="card header" style="text-align: center;width: 24rem;height: 85px;">
				    <h3 class="card-title" style="font-size: 25px;color:black;">참여 중인 인원 <span style="color:green;font-size: 25px;">${groupDTO.group_people}</span>/${groupDTO.group_highpeople}</h3>
				</div>
				<div id="groupState" class="card header" style="display:none;width: 24rem;height: 85px;text-align: center;">
					<div class="card-body" style="margin-top: 5px;">
				    	<h3 id="msg" class="card-title" style="font-size: 30px;padding-top: 10px;"></h3>
					</div>
				</div>					
			</div>
		</div>
		<div class="row">
			<div id="main" class="col-7" style="background:white;">
				<div class="row">
					<h2>모임 소개</h2>
					<div style="white-space:pre-wrap;"><c:out value="${groupDTO.group_introduce}" /></div>
				</div>
				<hr/>
				<div class="row">
					<h2>주의사항</h2>
					<div style="white-space:pre-wrap;"><c:out value="${groupDTO.group_caution}" /></div>
				</div>
				<hr/>
				<div class="row">
					<div class="row">				
						<h2>모임장</h2>
					    <div class="card member" style="width: 10rem;">
						  	<div class="card-body">
						    	<h3 class="group_creater" class="card-title">${groupRegistrant.user_id}</h3>
						    	<!-- 매너점수 뿌리기 -->
						    	<h3 class="manner_score" class="card-text">${groupRegistrant.user_mannerpoint}점</h3>
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
			$('#msg').html('삭제된 모임입니다');
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
	    $("#group_starttime").html("&nbsp;&nbsp;" +formattedEndDate);
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