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
        <form id="passwordForm">
            <label for="currentPassword">현재 비밀번호:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
            <label for="newPassword">새로운 비밀번호:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <label for="confirmPassword">새로운 비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <input type="submit" value="변경">
        </form>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#passwordForm').submit(function(e) {
            e.preventDefault(); // 폼 기본 제출 방지

            var currentPassword = $('#currentPassword').val();
            var newPassword = $('#newPassword').val();
            var confirmPassword = $('#confirmPassword').val();

            // 현재 비밀번호, 새로운 비밀번호, 확인 비밀번호가 모두 입력되었는지 확인
            if (currentPassword === "" || newPassword === "" || confirmPassword === "") {
                alert("모든 필드를 입력하세요.");
                return false;
            }

            // 새로운 비밀번호와 확인 비밀번호가 일치하는지 확인
            if (newPassword !== confirmPassword) {
                alert("새로운 비밀번호가 일치하는지 확인하세요.");
                return false;
            }

            // 비밀번호 변경 요청
            $.ajax({
                type: 'POST',
                url: 'updatePassword',
                data: {
                    currentPassword: currentPassword,
                    newPassword: newPassword,
                    confirmPassword: confirmPassword 
                },
                success: function(response) {
                    if (response === "success") {
                        alert("비밀번호 변경이 완료되었습니다.");
                    } else if (response === "incorrect") {
                        alert("현재 비밀번호가 일치하지 않습니다.");
                    } else {
                        alert("서버 오류: " + response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("요청 실패:", error);
                }
            });
        });
    });
</script>

</body>
</html>
