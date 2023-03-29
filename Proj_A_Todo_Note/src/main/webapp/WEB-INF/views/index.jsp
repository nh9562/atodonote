<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="session" value="${sessionScope.memDto}"/>

<!DOCTYPE html>
	<html lang ="ko">
		<head>
			<meta charset="UTF-8">
		    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		    <meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>A Todo Note</title>
			
			<!-- bootstrap css 사용 -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
				rel="stylesheet"
				integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
				crossorigin="anonymous">
			<!-- bootstarp icon 사용  -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=42">
		</head>
		
		<body class="loginBody">
		
			<!-- wrap 시작 -->
			<div id="wrap">
				
				<!-- 해더 그룹 시작 -->
				<%@ include file="/resources/ind/headerTmp.jsp" %>			
				<!-- 해더 그룹 끝 -->
				
				<!-- 로그인 그룹 시작 -->
				<div class="loginGp">
					
					<!-- 로그인 타이틀 그룹 시작 -->
					<div class="loginTitleGp">
						<p class="loginTitle">	A Todo Note</p>
						<p class="loginsubTitle">오늘의 일정, 빠르고 간편하게</p>
					</div>
					<!-- 로그인 타이틀 그룹 끝 -->
					
					<!-- 로그인 폼 그룹 시작 -->
					<div class="loginFrmGp mt-5">
					
						<form name="loginFrm" id="loginFrm" method="post" action="/login">
							<div class="form-floating">
								<input type="text" name="uId" id="uId"
									class="form-control" placeholder="아이디 입력" value="${remember_uId}">
								<label for="uId">아이디 입력</label>
							</div>
							<div class="form-floating">
								<input type="password" name="uPw" id="uPw"
									class="form-control" placeholder="비밀번호 입력">
								<label for="uPw">비밀번호 입력</label>
							</div>
							
						<!-- 로그인 버튼 시작 -->
					    <button class="w-100 btn btn-lg btn-purple" id="loginBtn">로그인</button>				    
					    <!-- 로그인 버튼 끝 -->
					
						<!-- 아이디 기억 체크박스 시작 -->
						<div class="loginFnGp mt-3 container">
							<div class="row row-cols-auto">
								<div class="col">
									<label>
										<a href="/findId">
											아이디 찾기
										</a>
									</label>
								</div>								
								/
								<div class="col">	
									<label>
										<a href="/findPw">
											비밀번호 찾기
										</a>
									</label>
								</div>
								<div class="col checkbox">
							      	<label>
							        	<input type="checkbox" id="remember_uId"> 아이디 저장
							    	</label>
						    	</div>
					    	</div>
					    </div>
					    <!-- 아이디 기억 체크박스 끝 -->
					    
					</form>
					</div>
					<!-- 로그인 폼 그룹 끝 -->
				    
				</div>
				<!-- 로그인 그룹 끝 -->	
				
				<!-- 푸터 그룹 시작  -->
				<%@ include file="/resources/ind/footerTmp.jsp" %>
				<!-- 푸터 그룹 끝  -->
				
			</div>
			<!-- wrap 끝 -->

			<!--  jQuert js 사용 -->
			<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
			<script src="${path}/resources/script/jquery.cookie.js"></script>
			<script src="${path}/resources/script/script_Login.js?no=4"></script>
			<script src="${path}/resources/script/script_SignUp.js?no=4"></script>
			<!-- bootstrap js 사용 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous"></script>
			
		</body>
	</html>