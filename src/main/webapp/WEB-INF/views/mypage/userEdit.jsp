<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f9ff;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원정보 수정</h2>
        <form id="userInfoForm" action="updateUserInfo" method="post">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="${user_name}">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" value="${sessionScope.loginInfo}" readonly>
            <label for="phone">전화번호:</label>
            <input type="text" id="phone" name="phone" value="${user_phone}">
            <label for="email">이메일:</label>
            <input type="text" id="email" name="email" value="${user_email}">
            <!-- 저장 버튼을 눌렀을 때 JavaScript 함수를 호출하도록 수정 -->
            <input type="submit" value="저장" onclick="saveAndCloseModal()">
        </form>
    </div>
</body>
<script>
    // 저장 및 모달 닫기 함수
    function saveAndCloseModal() {
        // 저장 완료 alert 표시
        alert("저장이 완료되었습니다.");

        // 모달 닫기
        window.parent.closeModal();

        // 사용자 정보 다시 불러오기
        //reloadUserInfo();
        location.href='./userInfo';
    }

   
</script>
</html>
