<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
		/* 예약 상태에 따른 텍스트 색상 지정 */
		.pending {
		     color: #FFD700; /* 예약 중 */
		}
		
		.confirmed {
		    color: #008000; /* 예약 확정 (민트색) */
		}
		
		.cancelled {
		    color: #FF69B4; /* 예약 취소 */
		}
		
        /* 스타일 수정 */
        .mypage-banner {
            background-color: #4e73df; /* 진한 남색 배경색 */
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px; /* 상단 여백 추가 */
        }

        /* 배너 안에 있는 텍스트들만 흰색으로 변경 */
        .mypage-banner .profile-info h4,
        .mypage-banner .profile-info p {
            color: white;
        }
		
		/* 배너 제목 스타일 */
		.banner-title {
		    color: white;
		    margin-bottom: 10px;
		}
		
		/* 사용자 정보 아이템 스타일 */
		.info-item {
		    color: white;
		    margin-bottom: 5px;
		}
		/* 진행 상태 바 스타일 */
		.progress {
		    height: 10px;
		    margin-top: 10px;
		}
			
		.progress-bar {
		    border-radius: 5px;
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
    .btn {
    	background: white;
    	color: #17A2B8;
    	border: 2px solid #17A2B8;
    	font-weight: 500;
    	margin: auto;
    }
    .btn-success {
    	--bs-btn-bg: #17A2B8;
    }
    .btn:hover {
    	background: #17A2B8;
    	border: 2px solid #17A2B8;
    }
    #rsvCancelBtn {
    	border: 2px solid #DC3545;
    	color: #DC3545;
    }
    #rsvCancelBtn:hover {
     	background: #DC3545;
    	border: 2px solid #DC3545;
    	color: white;   
    }
    .modal{
		 position: fixed;
		  top: 60%; /* 상단에서부터 화면의 60% 위치에 배치 */
  		  left: 50%; /* 좌측에서부터 화면의 50% 위치에 배치 */
  		  transform: translate(-50%, -50%); /* 정확한 중앙 위치로 조정 */ 		  
		  width: 1000px;
		  height: 1000px;
	}
</style>
<title>myPageMain</title>
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
		    </div>
		   </div>
<div class="container-fluid">
  <div class="row">
<nav id="login" class="col-md-3 col-lg-2 d-md-block sidebar sidebar-login collapse"
            style="background:white; margin-top:90px;">
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
 
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="mypage-banner">
		    <div class="profile-info">
		        <div class="user-info">
		            <h4 class="mb-3">Mypage</h4>
		            <br/>
		            <p>User ID : <span id="userId">${userId}</span></p>
		            <br/>
		            <div class="row">
		                <div class="col-md-3">
		                    <p>나의 포인트 : <span id="pointBalance">${pointBalance}p</span></p>
		                </div>
		                <div class="col-md-3">
		                    <p>매너 점수 : <span id="mannerScore">${mannerScore}점</span></p>
		                </div>
		                <div class="col-md-3">
			                <c:set var="attendanceRate" value="${attendanceRate}" />
							<c:choose>
							    <c:when test="${attendanceRate eq 0}">
							        <p>출석 내역이 없습니다.</p>
							    </c:when>
							    <c:otherwise>
							        <p>출석률 : <span id="attendanceRate">${attendanceRate}%</span></p>
							    </c:otherwise>
							</c:choose>
		                </div>
		                <div class="col-md-3">
		                	<c:set var="attendanceRate" value="${attendanceRate}" />
							<c:choose>
							    <c:when test="${attendanceRate eq 0}">
							    </c:when>
							    <c:otherwise>
				                    <div class="progress">
				                        <div class="progress-bar bg-success" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
							    </c:otherwise>
							</c:choose>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
    <br/>
    <div class="table-responsive">
        <div>
            <h5>현재 예약 현황</h5>   
        </div>
        <table class="table">
            <thead>
                <tr style="text-align: center;">
                    <th scope="col">예약번호</th>
                    <th scope="col">예약명</th>
                    <th scope="col">예약 일시</th>
                    <th scope="col">참여중/최대인원</th>
                    <th scope="col">예약확정날짜</th>
                    <th scope="col">예약상태</th>
                    <th scope="col">구분</th>
                </tr>
            </thead>
			  <tbody id="mypage">
				<c:set var="mypage" value="${empty mypage ? 'empty' : mypage}" />
				
				<c:choose>
				    <c:when test="${mypage eq 'empty'}">
				        <tr>
				            <td colspan="7" style="text-align: center;">조회할 내역이 없습니다.</td>
				        </tr>
				    </c:when>
				    <c:otherwise>
					    <c:forEach items="${mypage}" var="my">
					        <tr>
					            <td>${my.group_no}</td>
					            <td><a href="/group/detail.go?group_no=${my.group_no}">${my.group_name}</a></td>
					            <td>${my.group_time}</td>
					            <td>${my.par_people}</td>
					            <td>${my.group_confirm}</td>
					            <td style="text-align: center;font-weight: 700;">
					                <%-- 예약 상태에 따른 텍스트 변환 --%>
									<c:choose>
									    <c:when test="${my.group_state eq 0}"><span class="pending">모집중</span></c:when>
									    <c:when test="${my.group_state eq 1}">
									    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" var="temp" value="<%= new java.util.Date() %>" />
											<c:set var="currentDate" value="${temp}" />
											<c:choose>
											    <c:when test="${my.group_starttime < currentDate and currentDate < my.group_endtime}">
											    	<span class="confirmed">사용중</span>
											    </c:when>
												<c:otherwise><span class="confirmed">모집완료</span></c:otherwise>
											</c:choose>
									    </c:when>
									    <c:when test="${my.group_state eq 2}"><span class="cancelled">모집실패</span></c:when>
									    <c:when test="${my.group_state eq 3}"><span class="cancelled">모임삭제</span></c:when>
									    <c:when test="${my.group_state eq 4}"><span class="cancelled">사용완료</span></c:when>
									    <c:when test="${my.group_state eq 5}"><span class="pending">예약 중</span></c:when>
									    <c:when test="${my.group_state eq 6}"><span class="confirmed">예약 확정</span></c:when>
									    <c:when test="${my.group_state eq 7}"><span class="cancelled">예약 취소</span></c:when>
									    <c:otherwise><span class="cancelled">기타 상황</span></c:otherwise>
									</c:choose>
					            </td>
					            <td style="text-align: center;">
					            	<c:choose>
									    <c:when test="${my.group_state eq 1}">
									    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" var="temp" value="<%= new java.util.Date() %>" />
											<c:set var="currentDate" value="${temp}" />
										    <c:if test="${my.group_starttime < currentDate and currentDate < my.group_endtime}">
										    	<c:if test="${my.attenDance_status == '미참석' }">
													<button class="btn btn-success" id="attenDanceBtn" value="${my.group_no}">출석체크</button>
										    	</c:if>
										    	<c:if test="${my.attenDance_status == '참석' }">
													<button class="btn btn-success">출석완료</button>
										    	</c:if>
											</c:if>
									    </c:when>
									    <c:otherwise></c:otherwise>
									</c:choose>
					            </td>
					        </tr>
					    </c:forEach>
				    </c:otherwise>
				</c:choose>
			</tbody>
        </table>
    </div>
    <!-- 출석체크 모달 시작 -->
	<div class="modal" id="attenDance">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">출석체크</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>					
				</div>
				<div class="modal-body" style="color:black; font-weight: 700">
					<div class="row" id="attenDanceModalMsg">
						<p>출석이 확인되었습니다</p>
					</div>
					<div class="row" style="margin-top: 20px;">
						<button type="button" class="btn btn-success" id="evaluateMemberSaveBtn" class="btn-close" data-bs-dismiss="modal">확인</button>
					</div>
				</div>	
			</div>			
		</div>
	</div>
    <!-- 출석체크 모달 끝 -->
</main>  
</body>
<script>
	$('#attenDanceBtn').click(function () {
		$.ajax({
			type:'post',
			url:'/mypagemain/attenDance.ajax',
			data:{
				'group_no':$('#attenDanceBtn').val()
			},
			dataType:'json',
			success:function(response){
				var content = '';
				content += '<p>출석이 확인되었습니다</p>';
				$('#attenDanceModalMsg').html(content);
			},
			error:function(error){
				console.log(error)
			}
		});
		$('#attenDance').modal('show');	
	});
	
	$('#attenDance').on('hidden.bs.modal', function (e) {
		window.location.href='/mypagemain';
	});
			//출석률을 가져와서 상태바의 너비를 조정하는 함수
			function updateAttendanceRate(attendanceRate) {
			    // 출석률이 없거나 0보다 작은 경우
			    if (!attendanceRate || attendanceRate <= 0) {
			        attendanceRate = 0;
			    }
			    // 출석률이 100을 초과하는 경우
			    else if (attendanceRate > 100) {
			        attendanceRate = 100;
			    }
			
			    // 출석률 상태바 엘리먼트
			    var progressBar = document.querySelector('.progress-bar');
			
			    // 출석률에 따라 상태바의 너비를 조정
			    progressBar.style.width = attendanceRate + '%';
			    progressBar.setAttribute('aria-valuenow', attendanceRate);
			}
			
			// 페이지 로드 후 실행
			document.addEventListener('DOMContentLoaded', function() {
			    // 출석률 값을 가져와서 업데이트
			    var attendanceRateValue = parseFloat(document.getElementById('attendanceRate').innerText.replace('%', ''));
			    updateAttendanceRate(attendanceRateValue);
			});
			
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