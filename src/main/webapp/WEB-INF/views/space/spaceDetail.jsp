<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<title>장소 상세보기</title>
<style>
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
	.table {
		max-width: 100%;
	}
	.table-active {
		background: #ff7f00;
	}
	.table-active td {
		color: white;
		font-size: 15px;
		text-align: center;
		width: 1px;
		padding: 0;
	}
	#reservationPeople {
		width: 150px;
	}
	#reservationSelector button {
		font-size: 30px;
		background: white;
		color: black;
		border: 2px solid gray;
	}
	.btn-success {
		background: blue;
	}
	.arrow-prev,
	.arrow-next {
	    position: relative;
	    float:left;
	    border:1px solid #000;
	    width:30px;
	    height:30px;
	}
	
	.arrow-prev::after {
	    position: absolute;
	    left: 10px; 
	    top: 7px;
	    content: '';
	    width: 15px; /* 사이즈 */
	    height: 15px; /* 사이즈 */
	    border-top: 5px solid #000; /* 선 두께 */
	    border-right: 5px solid #000; /* 선 두께 */
	    transform: rotate(225deg); /* 각도 */
	}
	
	.arrow-next::after {
	    position: absolute;
	    left: 4px; 
	    top: 7px; 
	    content: '';
	    width: 15px; /* 사이즈 */
	    height: 15px; /* 사이즈 */
	    border-top: 5px solid #000; /* 선 두께 */
	    border-right: 5px solid #000; /* 선 두께 */
	    transform: rotate(45deg); /* 각도 */
	}
	#spaceImage{
		border: 1px solid black;
		display: inline-block;
		max-width: 70%;
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
<br/>
<main class="container-fluid">
    <div class="row gx-5 pb-4">
    	<div class="col-1"></div>
        <div class="col-7">
        	<div class="row">
            	<h2>신림역 도보 2분 이루리스터디룸</h2>
            </div>
            <hr/>
            <!-- 사진 -->
            <div class="row">
			  <div class="row d-flex justify-content-sm-center">
				<span class="arrow-prev"></span>
				<img src="..." id="spaceImage" class="img-fluid rounded-start" alt="...">
				<span class="arrow-next"></span>
			  </div>
            </div>
            
            <!-- 바로가기 -->
            <div class="row">
            	<div class="hstack gap-3">
				  <div class="p-2">소개</div>
				  <div class="vr"></div>
				  <div class="p-2">시설 안내</div>
				  <div class="vr"></div>
				  <div class="p-2">유의사항</div>
				  <div class="vr"></div>
				  <div class="p-2">연락처 및 위치</div>
				  <div class="vr"></div>
				  <div class="p-2">모임</div>
				  <div class="vr"></div>
				  <div class="p-2">후기 및 Q&A</div>
				</div>
            </div>
        </div>
        <div class="col-2">
        	<div class="row gx-10 gy-10">
        		<h5>운영 시간</h5>
        		<hr/>
        		<!-- 운영시간 끌어와서 여기에 뿌려줘야함 -->
        	</div>
        	<form>
	        	<div class="row gx-10 gy-10">
	        		<div class="col">
		        		<h5>날짜 선택</h5>
		        		<hr/>
					    <div class="row d-flex justify-content-sm-center px-2">
					        <div class="form-group row">
					          <input type="text" id="dp1" class="datepicker mr-2" placeholder="Select Date" name="date"><br>
					        </div>
					    </div>
				    </div>
	        	</div>
	        	<div class="row gx-10 gy-10">
	        		<h5>시간 선택</h5>
	        		<hr/>
	        		<table class="table table-bordered">
	        			<tbody>
	        				<tr class="table-active">
	        					<td>0</td>
	        					<td>1</td>
	        					<td>2</td>
	        					<td>3</td>
	        					<td>4</td>
	        					<td>5</td>
	        					<td>6</td>
	        					<td>7</td>
	        				</tr>
	        				<tr class="table-active">
	        					<td>8</td>
	        					<td>9</td>
	        					<td>10</td>
	        					<td>11</td>
	        					<td>12</td>
	        					<td>13</td>
	        					<td>14</td>
	        					<td>15</td>
	        				</tr>
	        				<tr class="table-active">
	        					<td>16</td>
	        					<td>17</td>
	        					<td>18</td>
	        					<td>19</td>
	        					<td>20</td>
	        					<td>21</td>
	        					<td>22</td>
	        					<td>23</td>
	        				</tr>
	        			</tbody>	
	        		</table>
	        		<!-- 예약 일시 뿌려줘야한다 -->
	        		<h5>예약 일시 : <span>2024년</span></h5>
	        		<hr/>
	        	</div>
	        	<!-- 예약 인원 선택 -->
	        	<div class="row gx-10 gy-10">
	        		<h5>예약 인원</h5>
	        		<div id="reservationSelector" class="btn-group d-flex justify-content-center">
				    	<button class="btn btn-primary" id="minus"type="button">-</button>
				    	<!-- 아래 버튼의 값이 장소 최소 대여 인원으로 들어가야한다 -->
				    	<button id="reservationPeople" class="btn btn-primary">4</button>
				    	<button class="btn btn-primary" id="plus" type="button">+</button>
				    </div>
				    <hr/>
	        	</div>
	        	<div class="row gx-10 gy-10">
	        		
	        		<h5>대여 포인트 금액</h5>
	        		<!-- 장소의 대여 금액을 가져와야함 -->
	        		<p class="text-end">40000P</p>
	        	</div>
	        	<div class="row gx-10 gy-10">
					<button type="submit" class="btn btn-success">바로 예약하기</button>
					<br/>
					<button type="submit" class="btn btn-success">모임 생성하기</button>        	
	        	</div>

        	</form>
        </div>
    </div>
</main>
<script>
	$(document).ready(function(){
		$('.datepicker').datepicker({
		    format: 'yyyy-mm-dd',
		    todayHighlight: true,
		    toggleActive: true,
		    language : "ko",
		    clearBtn : false,
		    datesDisabled : ['2024-04-20']
		}).on("changeDate", function(e) {
			console.log(e);
			console.log(e.date);
		});
	});
</script>
</body>
</html>