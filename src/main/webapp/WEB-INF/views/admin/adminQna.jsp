<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<style>
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal_content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.modal_close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.modal_close:hover,
.modal_close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
<title>AdminPage-Q&A</title>
</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Union Space</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input id="searchInput" class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <button id="" class="btn btn-outline-secondary" style="height: 38px;">검색</button>
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Sign out</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Reservation</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
        
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">
              <span data-feather="home"></span>
              예약 전체 내역 조회
            </a>
          </li>
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Member</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
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
          
          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
             <span>Space</span>
             <a class="link-secondary" href="#" aria-label="Add a new report">
               <span data-feather="plus-circle"></span>
             </a>
          </h6>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              등록한 장소 목록 조회
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
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

        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              장소별 리뷰
            </a>
          </li>
        </ul>
      </div>
    </nav>
    
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Q&A 관리</h1>
      </div>
     
	 <div class="row">
	        <div class="col-7"></div>
	        <div class="col-5">
	           <div class="btn-toolbar mb-2 mb-md-0">
	             <div class="btn-group me-2">
	                <select class="form-select" aria-label="Default select example">
	              <option selected>답변완료</option>
	              <option value="1">답변대기</option>
	              </select>
	              <select class="form-select" aria-label="Default select example">
	              <option selected>최신등록순</option>
	              <option value="1">오래된 순</option>
	             </select>
	              <input type="text" class="form-control" placeholder="장소번호" aria-label="장소번호" aria-describedby="basic-addon2">
	              <button id="searchBtn" type="button" class="btn btn-outline-secondary"  style="width: 200px; height: 40px;">검색</button>
	             </div>
	            </div>
	        </div>
	  </div>
    <br/>
    <br/>
    <div class="table-responsive">
       <table id="adminQnaTable" class="table">
        <thead>
          <tr>
            <th scope="col">장소번호</th>
            <th scope="col">내용</th>
            <th scope="col">Q&A 작성 날짜</th>
            <th scope="col">답변 작성 날짜</th>
            <th scope="col">작성자</th>
            <th scope="col">답변상태</th>
            <th scope="col">구분</th>
          </tr>
        </thead>
        <tbody id="adminQna_list">
          <c:forEach items="${adminQna_list}" var="adminQna">
            <tr data-space-no="${adminQna.space_no}">
                <td>${adminQna.space_no}</td>
                <td>${adminQna.space_content1}</td>
                <td>${adminQna.space_write_date1}</td>
                <td>${adminQna.space_write_date2}</td>
                <td>${adminQna.user_id}</td>
                <td>${adminQna.qna_state}</td>
                <td><button class="answerBtn btn btn-primary" data-space-no="${adminQna.space_no}" data-content="${adminQna.space_content1}" data-answer="${adminQna.space_content2}" data-state="${adminQna.qna_state}">${adminQna.qna_state == '답변완료' ? '답변 완료' : '답변 작성'}</button></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    </main> 
    <div class="row">
       <div class="col-6"></div>
       <div class="col-5">
          <nav aria-label="Page navigation example">
           <ul class="pagination">
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Previous">
                 <span aria-hidden="true">&laquo;</span>
               </a>
             </li>
             <li class="page-item"><a class="page-link" href="#">1</a></li>
             <li class="page-item"><a class="page-link" href="#">2</a></li>
             <li class="page-item"><a class="page-link" href="#">3</a></li>
             <li class="page-item"><a class="page-link" href="#">4</a></li>
             <li class="page-item"><a class="page-link" href="#">5</a></li>
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Next">
                 <span aria-hidden="true">&raquo;</span>
               </a>
             </li>
           </ul>
         </nav>
       </div>
    </div>
    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal_content">
            <span class="modal_close" onclick="closeModal()">&times;</span>
            <h2>작성 내용</h2>
            <p id="questionContent"></p>
            <h2>답변 작성</h2>
            <!-- 답변을 작성할 텍스트 영역 -->
            <textarea class="form-control" id="answerTextarea" rows="5" style="width: 100%;"></textarea>
            <button id="saveAnswerBtn" class="btn btn-primary">답변작성</button>
            <!-- 해당 행의 장소번호를 hidden input에 설정 -->
            <input type="hidden" id="spaceNoInput">
        </div>    
    </div>
</body>
<script>
    // 검색 버튼 클릭 시
    document.getElementById("searchBtn").onclick = function() {
        var searchInput = document.getElementById("sortByInput").value.trim().toLowerCase();
        var rows = document.querySelectorAll("#adminQnaTable tbody tr");
        rows.forEach(function(row) {
            var rowData = row.querySelector("td:first-child").textContent.trim().toLowerCase();
            if (rowData.includes(searchInput)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    };

    // 답변 버튼 클릭 시
    var answerBtns = document.querySelectorAll(".answerBtn");
    answerBtns.forEach(function(btn) {
        btn.addEventListener("click", function() {
            var content = this.getAttribute("data-content");
            var spaceNo = this.getAttribute("data-space-no");
            var answer = this.getAttribute("data-answer");
            var qnaState = this.getAttribute("data-state");
            openModal(content, spaceNo, answer, qnaState);
        });
    });

    // 모달 열기
    function openModal(content, spaceNo, answer, qnaState) {
        document.getElementById("answerTextarea").value = answer;
        document.getElementById("questionContent").innerText = content;
        document.getElementById("spaceNoInput").value = spaceNo;
        document.getElementById("myModal").style.display = "block";

        // 답변 상태가 '답변완료'일 때 답변 작성 버튼 비활성화
        if (qnaState === '답변완료') {
            document.getElementById("saveAnswerBtn").disabled = true;
        } else {
            document.getElementById("saveAnswerBtn").disabled = false;
        }
    }

    // 모달 닫기
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    // 답변 작성 버튼 클릭 시
    document.getElementById("saveAnswerBtn").onclick = function() {
        var answerTextareaValue = document.getElementById("answerTextarea").value;
        alert("작성된 답변: " + answerTextareaValue);
        var spaceNo = document.getElementById("spaceNoInput").value;
        var button = document.querySelector(".answerBtn[data-space-no='" + spaceNo + "']");
        button.textContent = "답변 완료";
        closeModal();
    };
</script>
</html>
	