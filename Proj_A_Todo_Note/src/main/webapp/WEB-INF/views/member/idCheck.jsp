<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>아이디 중복 체크</title>
    
		<!-- bootstrap css 사용 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
			crossorigin="anonymous">
		<!-- bootstarp icon 사용  -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=57">			
	</head>

	<body class="popBody">
		<div id="wrap_Popup">
			<c:if test="${idUse==true}">
		    	<div>
		    		<h1>${uId}</h1>
		    		<p>사용가능한 아이디입니다.</p>
	   			</div>
		    	<hr>
				<div id="closeBtnArea">
	   				<input type="hidden" id="idUse" value="true">
	   				<button type="button" id="idBtn" class="btn btn-purple w-50">사용하기</button>
	    		</div>
	   		</c:if>
			<c:if test="${idUse==false}">
				<div>
					<span>이미 존재하는 아이디입니다.</span>
				</div>
	    		<hr>	
				<div id="closeBtnArea">
	    			<input type="hidden" id="idUse" value="false"/>
	    			<button type="button" id="idBtn" class="btn btn-light w-50">아이디 재입력</button>
	    		</div>
	   		</c:if>    	        
	    </div>
	    
		<!--  jQuert js 사용 -->
		<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
		<script src="${path}/resources/script/script_SignUp.js?no=8"></script>
	 	
	 	<!-- bootstrap js 사용 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
	</body>
</html>