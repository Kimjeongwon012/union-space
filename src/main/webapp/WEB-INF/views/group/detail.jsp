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
						<h3 id="dDay" class="card-title" style="font-size: 35px;">
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
				    	<h3 id="dDay" class="card-title" style="font-size: 35px;">참여 중인 인원 <span>${groupDTO.group_people}</span>/${groupDTO.group_highpeople}</h3>
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
				</div>
				<div class="row">
					<h2>장소 예약 날짜</h2>
				</div>
				<br/>
				<br/>
<!-- 				로그인 안한 사람
				아무것도 보이지 않아야함
				
				참여하기만 보임
				로그인도 했고 참여한 인원 (모임장 X)
				나가기
				로그인도 했고 모임장인 사람
				나가기
				수정하기
				삭제하기 -->
<%-- 				<c:choose>
					<!-- 로그인은 한 사람 -->
			        <c:when test="${sessionScore.loginInfo != null}">
			        	<p>아아</p>
			        	<!-- 참여 한 사람 -->
			        	<c:when test="${sessionScore.loginInfo != null}">
			        		<!-- 모임장 -->
			        		<c:when test="${sessionScore.loginInfo != null}">	
			        			<button type="button" name="groupExitBtn" class="btn btn-success groupBtn">수정하기</button>
			        			<button type="button" name="groupEditBtn" class="btn btn-success groupBtn">나가기</button>
			        			<button type="button" name="groupDeleteBtn" class="btn btn-success groupBtn">삭제하기</button>
			        		</c:when>
			        		<!-- 모임장 아닌 팀원 -->
			        		<c:otherwise>
			        			<button type="button" name="groupExitBtn" class="btn btn-success groupBtn">나가기</button>		         
			        		</c:otherwise>
			        	</c:when>
			        	<!-- 참여 안한 사람 -->
			        	<c:otherwise>
			        		<button type="button" name="groupJoinBtn" class="btn btn-success groupBtn">참여하기</button>
			        	</c:otherwise>
			        </c:when>
			        <!-- 로그인 안한 사람 -->
			        <c:otherwise>			         
			        </c:otherwise>
			    </c:choose> --%>
			    <p>${sessionScore.loginInfo}</p>
				<div class="row d-flex justify-content-center">
					<c:choose>
					    <c:when test="${sessionScore.loginInfo != null}">
					        <c:choose>
					            <c:when test="${sessionScore.loginInfo == null}">
					                <button type="button" name="groupExitBtn" class="btn btn-success groupBtn">수정하기</button>
					                <button type="button" name="groupEditBtn" class="btn btn-success groupBtn">나가기</button>
					                <button type="button" name="groupDeleteBtn" class="btn btn-success groupBtn">삭제하기</button>
					            </c:when>
					            <c:otherwise>
					                <button type="button" name="groupExitBtn" class="btn btn-success groupBtn">나가기</button>
					            </c:otherwise>
					        </c:choose>
					    </c:when>
					    <c:otherwise>
					        <button type="button" name="groupJoinBtn" class="btn btn-success groupBtn">참여하기</button>
					    </c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</main>
</body>
<script>
</script>
</html>