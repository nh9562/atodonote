<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>    

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
		    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=40">			
		</head>
		
		<body class="loginBody">
		
			<!-- wrap 시작 -->
			<div id="wrap">
			
				<!-- 해더 그룹 시작 -->
				<%@ include file="/resources/ind/headerTmp.jsp" %>			
				<!-- 해더 그룹 끝 -->

				<!-- 아이디 찾기 시작 -->
				<div class = "findIdGp">
				
					<!-- 로그인 타이틀 그룹 시작 -->
					<div class="loginTitleGp">
						<p class="loginTitle">	A Todo Note</p>
						<p class="loginsubTitle">오늘의 일정, 빠르고 간편하게</p>
					</div>
					<!-- 로그인 타이틀 그룹 끝 -->
				
					<!-- 아이디 찾기 폼 그룹 시작 -->
					<div class="findIdFrmGp mt-5">
						<form name="findIdFrm" id="findIdFrm" method="post" action="/findId">
						
							<c:choose>
								<c:when test="${!empty findIdRes}">
									<div class="w-100 findDiv">
											아이디 찾기 결과 :
											<span class="findIdRes">${findIdRes}</span>
									</div>
								    <button type="button" onclick="location.href='/findPw?uId=${findIdRes}'" class="w-100 btn btn-lg btn-purple mt-3" id="findPwBtn">비밀번호 찾기</button>
								</c:when>
								<c:otherwise>
									<div class="w-100 findDiv">
											일치하는 회원이 존재하지 않습니다.
											<span class="findIdRes">${findIdRes}</span>
									</div>
								    <button type="button" onclick="location.href='/findId'" class="w-100 btn btn-lg btn-purple mt-3" id="findIdBtn">다시 찾기</button>	
								</c:otherwise>
							</c:choose>
							
							<!-- 돌아가기 버튼 시작 -->						    				    
						    <button type="button" onclick="location.href='/'" class="w-100 btn btn-lg btn-light mt-1" id="goIndex">메인페이지로</button>
						    <!-- 돌아가기 버튼 끝 -->
				
						</form>
					</div>
					<!-- 아이디 찾기 폼 그룹 끝 -->
					
				</div>
				<!-- 아이디 찾기 끝 -->

				<!-- 푸터 그룹 시작  -->
				<%@ include file="/resources/ind/footerTmp.jsp" %>
				<!-- 푸터 그룹 끝  -->
				
			</div>
			<!-- wrap 끝 -->

			<!--  jQuert js 사용 -->
			<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
			<script src="${path}/resources/script/script_SignUp.js"></script>
			<!-- bootstrap js 사용 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous"></script>
				
		</body>
		
	</html>