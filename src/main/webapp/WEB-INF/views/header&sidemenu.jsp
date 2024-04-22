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
<title>page</title>
</head>
<body>

<header class="navbar navbar-white sticky-top bg-white flex-md-nowrap p-0 shadow">
	<div class="container-fluid">
	    <img src="/resources/images/siteImg/menu.png" id="menu" alt="...">
	    <img src="/resources/images/siteImg/unionSpaceLogo.png" id="logo" alt="...">
	    <div class="d-flex justify-content-end">		    
		    <input type="text" placeholder="Search" aria-label="Search">	
		    <button>로그인</button>
		    <img src="/resources/images/siteImg/mypage.png" id="logo" alt="...">
	    </div>
	</div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse"
    	style="background:white">
    	<div class="position-sticky pt-3" >
    		<h1>Menu</h1>
    		<div class="bg-black" style="height: 2px"></div>
    		<br/>
    		<div class="">
    			<h3>Union Space</h3>
    		</div>
    		<hr/>
    		<ul class="nav flex-column">
    			<li class="nav-item">
    				Union Space
    			</li>
				<li class="nav-item">
	    			문의
	    		</li>
    		</ul>
	    	<br/>
    		<h3>Search</h3>
    		<hr/>
    		<ul class="nav flex-column">
    			<li class="nav-item">
    				장소 찾기
    			</li>
				<li class="nav-item">
	    			모임 찾기
	    		</li>
    		</ul>
    	</div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="background:black">
    </main>
  </div>
</div>


</body>
<script>
</script>
</html> 