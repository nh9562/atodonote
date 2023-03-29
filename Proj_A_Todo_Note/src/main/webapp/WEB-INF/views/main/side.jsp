<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="session" value="${sessionScope.memDto}"/>

<!-- 로그인 체크 구문 -->
<%@ include file="/resources/ind/loginChk.jsp" %>

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
		    <link rel="stylesheet" href="${path}/resources/style/style_Common.css?no=40">			
		    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=42">
   		    <!-- JQuery datePicker -->
		    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">					
		</head>
		
		<body>
		
			<!-- wrap 시작 -->
			<div id="wrap">
			
				<!-- 해더 그룹 시작 -->
				<%@ include file="/resources/ind/headerTmpLogin.jsp" %>			
				<!-- 해더 그룹 끝 -->

				<!-- 작업 영역 시작 -->
				<div class="d-flex" style="height:600px;">
	
					<!-- 캘린더 영역 시작 -->
					<input type="hidden" id="pageState" value="side">
					<%@ include file="/resources/ind/mainCalendar.jsp" %>
					<!-- 캘린더 영역 끝 -->

					<!-- 사이드 영역 시작 -->
					<div id="sidebar" class="flex-fill sidebar">
						<c:choose>
							<c:when test="${side=='label'}">
								<!-- 인클루드 라벨 사이드 -->
								<%@ include file="/resources/ind/sideLabel.jsp" %>
							</c:when>
							<c:when test="${side=='memo'}">
								<!-- 인클루드 메모 사이드 -->
								<%@ include file="/resources/ind/sideMemo.jsp" %>														
							</c:when>
							<c:when test="${side=='link'}">
								<!-- 인클루드 링크 사이드 -->
								<%@ include file="/resources/ind/sideLink.jsp" %>
							</c:when>
							<c:otherwise>
								<!-- 인클루드 파일 사이드 -->
								<%@ include file="/resources/ind/sideFile.jsp" %>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 사이드 영역 끝 -->

				</div>
				<!-- 작업 영역 끝 -->

				<!-- 푸터 그룹 시작  -->
				<%@ include file="/resources/ind/footerTmpLogin.jsp" %>
				<!-- 푸터 그룹 끝  -->
				
			</div>
			<!-- wrap 끝 -->

			<!--  jQuert js 사용 -->
			<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
			
			<!--  사용자 js 사용 -->
			<script src="${path}/resources/script/script_SignUp.js"></script>
			<script src="${path}/resources/script/script_Main.js?no=6"></script>
			
			<!-- 팝업 js 사용 -->
			<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
			<script src="https://unpkg.com/@popperjs/core@2"></script>
			
			<!-- bootstrap js 사용 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous"></script>
				
			<!--  jQuery datepicker 용 -->	
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
				
		</body>
		
	</html>