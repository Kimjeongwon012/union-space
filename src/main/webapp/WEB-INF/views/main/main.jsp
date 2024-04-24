<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<meta charset="UTF-8">
<title>Union Space</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 0 auto;
        padding: 20px;
    }
    .header {
        background-color: #333;
        color: #fff;
        padding: 10px 0;
        display: flex; /* Make the header a flex container */
        justify-content: space-between; /* Push items to the edges */
        align-items: center; /* Center vertically */
    }
    .header h1 {
        margin: 0;
        flex-grow: 1; /* Allow h1 to grow and take up space */
        text-align: center; /* Center the text */
    }
    .login-btn {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 10px; /* Add left margin for spacing */
        margin-right: 10px;
    }
    .login-btn:hover {
        background-color: #0056b3;
    }
    .search-box {
        
        text-align: center;
        display: flex; /* Make the search box a flex container */
        align-items: center; /* Center vertically */
    }
    .search-box input[type="text"] {
        width: 300px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 10px; /* Add right margin for spacing */
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
        margin-right: 10px; /* Add right margin */
    }
    .mypage-link a {
        text-decoration: none;
        color: #333;
        border: 1px solid #333;
        padding: 5px 10px; /* Adjust padding for smaller size */
        border-radius: 4px;
        background-color: #fff;
        display: inline-block; /* Change to inline-block for smaller size */
    }
    .mypage-link a:hover {
        background-color: #c4afaf;
        color: #fff;
    }
    .logo-img {
        max-height: 50px;
        margin-right: 10px; /* Add margin between the image and text */
    }
</style>

</head>
<body>
<div class="header">
    <h1>UNION SPACE</h1>
    <div class="search-box">
        <input type="text" placeholder="장소 및 모임을 입력하세요">
        <button class="search-btn">검색</button>
    </div>
    <button class="login-btn">로그인</button>
    <div class="mypage-link">
        <a href="/mypage">
            <img src="../img/mypage.jpg" class="logo-img">
        </a>
    </div>
</div>
<div class="container">
    <!-- 이미지를 a 태그 내에 배치합니다. -->
</div>
</body>

<script>
$(document).ready(function() {
    // 로그인 버튼 클릭 이벤트
    $(".login-btn").click(function() {
        // 로그인 페이지로 이동
        window.location.href = "/login.go";
    });
});
</script>
</html>