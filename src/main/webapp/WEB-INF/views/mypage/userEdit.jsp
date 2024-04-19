<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
</head>
<body>
    <h2>회원정보 수정</h2>
    <form action="updateUserInfo" method="post">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" value="${user_name}">
        <br>
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" value="${user_id}" readonly>
        <br>
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" value="${user_phone}">
        <br>
        <label for="email">이메일:</label>
        <input type="text" id="email" name="email" value="${user_email}">
        <br>
        <input type="submit" value="저장">
    </form>
</body>
</html>