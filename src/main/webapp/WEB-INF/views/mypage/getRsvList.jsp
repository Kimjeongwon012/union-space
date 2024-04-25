<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<style>
	.header {
        background-color: #fff;
        color: #000;
        padding: 10px 0;
        display: flex; /* 헤더를 플렉스 컨테이너로 설정 */
        justify-content: center; /* 아이템을 가운데에 배치 */
        align-items: center; /* 수직 가운데 정렬 */
		margin-top : 10px;
        height :150px;
    }
</style>
<body>
    <div class="header">
        <a href="/main/main">
            <img src="/resources/images/siteImg/unionSpaceLogo.png" class="logo-img2">
        </a>
    </div>
</body>
</html>