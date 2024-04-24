<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
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
            background-color: #e74c3c;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원 탈퇴</h2>
        <form id="withdrawForm">
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
			<input type="submit" value="회원 탈퇴" style="padding: 8px 15px; font-size: 14px;" onclick="confirmDelete()">
        </form>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	function confirmDelete() {
	    var confirmResult = confirm("정말로 탈퇴하시겠습니까?");
	    if (confirmResult) {
	        $('#withdrawForm').submit(); // 폼 제출
	    }
	}
	
    $(document).ready(function() {
        $('#withdrawForm').submit(function(e) {
            e.preventDefault(); // 폼 기본 제출 방지

            var password = $('#password').val();

            // 비밀번호 필드가 비어 있는지 확인
            if (password === "") {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            // 회원 탈퇴 요청
            $.ajax({
                type: 'POST',
                url: 'withdraw',
                data: {
                    password: password
                },
                success: function(response) {
                    if (response === "success") {
                        alert("회원 탈퇴가 완료되었습니다.");
                        window.location.href = "/login.go"; // 로그아웃 페이지로 이동
                    } else if (response === "incorrect") {
                        alert("비밀번호가 일치하지 않습니다.");
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
