<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>비밀번호 변경</h2>
        <form id="passwordForm" action="change" method="post" onsubmit="return validatePassword()">
            <label for="currentPassword">현재 비밀번호:</label>
            <input type="password" id="currentPassword" name="currentPassword" value="${currentPassword}" readonly required>
            <label for="newPassword">새로운 비밀번호:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <label for="confirmPassword">새로운 비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <input type="submit" value="변경">
        </form>
    </div>

    <script>
        function validatePassword() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // 새로운 비밀번호와 확인 비밀번호가 일치하는지 확인
            if (newPassword !== confirmPassword) {
                alert("비밀번호가 일치하는지 확인해 주세요");
                return false; // 폼 제출 방지
            } else {
                alert("변경이 완료되었습니다.");
                // 모달 닫기
                closeModal();
                return true; // 폼 제출 허용
            }
        }
    </script>
</body>
</html>