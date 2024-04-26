<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #fff;
            color: #000;
            padding: 10px 0;
            display: flex; /* 헤더를 플렉스 컨테이너로 설정 */
            justify-content: center; /* 아이템을 가운데에 배치 */
            align-items: center; /* 수직 가운데 정렬 */
            margin-bottom: 10px; /* 컨테이너와 헤더 사이 간격 조정 */
            height: 150px;
            width: 100%; /* 헤더를 화면 너비에 맞추기 */
            position: fixed; /* 헤더를 화면 위에 고정 */
            top: 0; /* 화면 상단에 고정 */
            left: 0; /* 화면 왼쪽에 고정 */
            z-index: 999; /* 다른 요소 위에 표시 */
        }
        .container {
            width: 80%;
            height: 200%;
            margin: 170px auto 0; /* 헤더 높이 + 여백 만큼 컨테이너를 아래로 내림 */
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h3 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            width: 20%;
        }
        td {
            width: 80%;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 4px;
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        /* 모달 스타일 */
        .modal {
            display: none; /* 모달 숨기기 */
            position: fixed; /* 고정 위치 */
            z-index: 1; /* 다른 요소 위에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto; /* 스크롤바 표시 */
            background-color: rgba(0,0,0,0.4); /* 배경 색상과 투명도 설정 */
        }
        .modal-content {
            background-color: #fefefe; /* 모달 내용 배경색 */
            margin: 15% auto; /* 중앙 정렬 */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        /* 닫기 버튼 스타일 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
       
    </style>
</head>
<body>
    <div class="container">
        <h3>사용자 정보 조회</h3>
        <hr/>
        <table>
            <tr>
                <th>ID</th>
                <td>${user_id != null ? user_id : ''}</td>
            </tr>
            <tr>
                <th>PW</th>
                <td>${user_pw != null ? user_pw : ''}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${user_name != null ? user_name : ''}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${user_phone != null ? user_phone : ''}</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>${user_gender != null ? user_gender : ''}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${user_email != null ? user_email : ''}</td>
            </tr>
        </table>
        <div class="btn-container">
            <!-- 회원정보 수정 버튼을 눌렀을 때 모달 열기 -->
            <button class="btn" onclick="openModal('/userEdit')">회원정보 수정</button>
            <!-- 비밀번호 변경 버튼을 눌렀을 때 모달 열기 -->
            <button class="btn" onclick="openModal('/pwChange')">비밀번호 변경</button>
        </div>
    </div>

    <!-- 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <iframe id="modalFrame" style="width:100%; height:400px; border:none;"></iframe>
        </div>
    </div>
    <div class="header">
        <a href="/home">
            <img src="/resources/images/siteImg/unionSpaceLogo.png" class="logo-img2">
        </a>
    </div>

    <script>
        // 모달 열기 함수
        function openModal(page) {
            document.getElementById("myModal").style.display = "block";
            document.getElementById("modalFrame").src = page;
        }

        // 모달 닫기 함수
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        // 모달 바깥을 클릭했을 때 모달 닫기
        window.onclick = function(event) {
            var modal = document.getElementById("myModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>