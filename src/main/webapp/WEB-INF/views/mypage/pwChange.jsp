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
        <form id="passwordForm" action="pwChange.do" method="post">
            <label for="currentPassword">현재 비밀번호:</label>
            <!-- 사용자가 현재 비밀번호를 입력하는 입력 필드 -->
            <input type="password" id="currentPassword" name="currentPassword" required>
            <label for="newPassword">새로운 비밀번호:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <label for="confirmPassword">새로운 비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <input type="button" onclick="validatePassword()" value="변경">
        </form>
    </div>

<script>
    function validatePassword() {
    	console.log(5);
    	$('form').submit();
    }
</script>

</body>
</html>
