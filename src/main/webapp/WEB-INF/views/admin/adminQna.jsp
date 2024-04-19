<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/bootstrap.css"   />
<link rel="stylesheet" href="/resources/css/style.css"   />
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<style>
/*모달창*/
.modal {
    display: none; /* 기본적으로 모달을 숨깁니다 */
    position: fixed; /* 모달을 페이지에 고정 */
    left: 50%; /* 왼쪽에서부터 50% 위치에 배치 */
    top: 50%; /* 상단에서부터 50% 위치에 배치 */
    transform: translate(-50%, -50%); /* 센터 정렬을 위해 변환 적용 */
    width: 50%; /* 모달의 너비를 50%로 설정 */
    height: 50%; /* 모달의 높이를 50%로 설정 */
    background-color: white; /* 모달의 배경색 설정 */
    z-index: 10; /* 다른 요소들 위에 모달이 보이도록 z-index 설정 */
    padding: 20px; /* 내부 여백 추가 */
    border-radius: 10px; /* 테두리 둥글게 처리 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 모달에 그림자 효과 추가 */
}

.modal_body {
    margin: 20px 0; /* 내용 주변 여백 설정 */
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
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
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
              <button type="button" class="btn btn-outline-secondary"  style="width: 200px; height: 40px;">검색</button>
             </div>
            </div>
        </div>
     </div>
    <br/>
    <br/>
    <div class="table-responsive">
       <table class="table">
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
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>@fat</td>
            <td>@fat</td>
            <td><button class="answer">답변작성</button></td>
          </tr>
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
    <div class="modal">
        <div class="modal_body">
            <h2>Q&A 작성 내용</h2>
            <p>작성내용.html</p>
            <textarea class="form-control" id="content" name="content" rows="3" style="height:100px;"></textarea>
            <br/>
            <h2>Q&A 답변 내용</h2>
            <p>답변내용.html</p>
            <textarea class="form-control" id="content" name="content" rows="3" style="height:100px;"></textarea>
            <button type="submit" class="modal_submit">답변작성</button>
            <button class="modal_close">닫기</button>
        </div>
    </div>
    
</body>
<script>

	const modal = document.querySelector('.modal'); // 팝업차을 열기 위한 변수
	const btnOpenModal = document.querySelector('.answer'); // 열기 버튼 선택
	const btnCloseModal = document.querySelector('.modal_close'); // 닫기 버튼 선택
	const btnSubmitModel = document.querySelector('.modal_submit'); // 답변 작성 버튼 선택
	
    document.querySelectorAll('.answer').forEach(btn => {
        btn.addEventListener("click", () => {
            modal.style.display = "flex";
        });
    });

    btnCloseModal.addEventListener("click", () => {
        modal.style.display = "none";
    });
    
    function btnSubmitAnswer() {
    	btnSubmitModel.disabled = true;
    	btnSubmitModel.textContent = "답변완료";
        // 데이터를 저장하거나 서버로 전송하는 로직을 추가
        // 저장된 데이터를 다시 불러올 수 있는 방법에 따라 구현
    }
    
    // 폼 제출 시 답변 작성 완료 처리
    btnSubmitModel.addEventListener("click", function (event) {
        // 폼을 서버로 제출하는 대신 여기에 데이터 저장 및 완료 처리 로직을 추가
        setTimeout(btnSubmitAnswer, 2000);
        event.preventDefault();
    });
    
</script>
</html>
