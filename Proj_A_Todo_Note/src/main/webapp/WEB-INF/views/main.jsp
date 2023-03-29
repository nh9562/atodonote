<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
				
					<!-- 왼쪽 작업영역 시작 : hide로 숨기기-->
					<div id="mainLeft" class="flex-fill mainLeft">
						<div class="todayBox">
							<div class="day" id = "mainLeftDay"></div>
							<div class="date" id="mainLeftDate"></div>
						</div>
						<div class="flex-fill todayCntTitle">Todo List</div>
						
						<div class="flex-fill todayCntAdd">						
							<form id="mainLeft_InsertMemo">
							
								<!-- 값을 가져가야하는 히든 박스들 : 선택되어 있는 오늘 날짜(년-월-일) -->
								<input type="hidden" id="todoWriteUId" name="todoWriteUId" value="${session.uId}">
								<input type="hidden" id="currentPageDate" name="currentPageDate" value="${selectDate}">
							
								<div class="d-flex" style="width:100%;height:40px;background:#d9d2e9;
									padding:3px;border-radius: 5px;">
									<input type="text" class="form-control"
										style="width:80%;height:34px;font-size:14px;border-radius: 5px 0 0 5px;border:1px solid #9400d3;"
										name="todayCntAddInsert" id="todayCntAddInsert"
										placeholder="메모를 작성해주세요.">
									<button type="button" class="btn btn-purple"
										style="width:20%;height:34px;font-size:14px;border:0;margin-left:-1;
										border-radius: 0 5px 5px 0"
										id="todayCntAddInsertBtn">입력</button>
								</div>							

							</form>
						</div>
						
						<div class="todayCnt">
						
							<!-- 반복 작업 시작 -->
							<c:choose>
							
								<c:when test="${empty todoList}">
									<div class="todayCntLine d-flex">
										<div class="todayCntLineNone">
											등록된 일정이 없습니다.
										</div>
									</div>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="data" items="${todoList}">
										<!-- 오늘의 메모 라인 시작 -->
										<div class="todayCntLine d-flex detailUp">
											<!-- 라벨 아이콘 표시 -->
											<div class="todayCntLineLabel">
												<div class="d-flex">
													<input type="hidden" value="${data.labelName}" id="labelColor">
													<i class="bi bi-tag-fill" style="font-size: 20px" id="mainLeft_labelIcon"></i>
													<div style="border-right:1px solid #d9d2e9;margin-left:5px;"></div>
												</div>
											</div>
												
											<!-- 메모 타이틀 출력 -->
											<div class="todayCntLineTitle">
												<c:set var="subjectValue" value="${data.subject}" />
												<c:choose>
													<c:when test="${fn:length(subjectValue) gt 12}">
														${fn:substring(subjectValue,0,12)}..
													</c:when>
													<c:otherwise>
														${subjectValue}
													</c:otherwise>
												</c:choose>
											</div>
											
											<!-- 삭제에 쓸 데이터 확보 -->
											<input type="hidden" value="${data.mNum}" id=cntLineMNum>
											
											<!-- 디테일에 쓸 데이터 확보 -->
											<input type="hidden" value="${data.mNum}" id="detail_mNum">
											<input type="hidden" value="${data.uId}" id="detail_uId">
											<input type="hidden" value="${data.subject}" id="detail_subject">
											<input type="hidden" value="${data.content}" id="detail_content">
											<input type="hidden" value="${data.eventDate}" id="detail_eventDate">
											<input type="hidden" value="${data.link}" id="detail_link">
											<input type="hidden" value="${data.fileName}" id="detail_fileName">
											<input type="hidden" value="${data.originalFileName}" id="detail_originalFileName">
											<input type="hidden" value="${data.fileSize}" id="detail_fileSize">
											<input type="hidden" value="${data.regTM}" id="detail_regTM">
											<input type="hidden" value="${data.labelName}" id="detail_labelName">
											
											<!-- 메모 아이콘 그룹 -->
											<div class="todayCntLineIconGp">
												<div class="d-flex" style="justify-content:flex-end">
													<!-- 링크 아이콘 표시 -->
													<c:if test="${not empty data.link}">
														<i class="bi bi-link-45deg CntLineIconStyle"></i>
													</c:if>
													<!-- 첨부 아이콘 표시 -->
													<c:if test="${not empty data.fileName}">
														<i class="bi bi-paperclip CntLineIconStyle" ></i>
													</c:if>																										
													<div style="border-right:1px solid #d9d2e9;cursor:pointer" id="closeIconDiv"></div>
													<i class="bi bi-x" id="closeIcon" style="cursor:pointer"></i>
												</div>
											</div>
									</div>
									<!-- 오늘의 메모 라인 끝 -->
									</c:forEach>
								</c:otherwise>
								
							</c:choose>

							<!-- 반복 작업 끝 -->
						</div>
					</div>
	
					<!-- 캘린더 영역 시작 -->
					<input type="hidden" id="pageState" value="main">
					<%@ include file="/resources/ind/mainCalendar.jsp" %>
					<!-- 캘린더 영역 끝 -->


				</div>
				<!-- 작업 영역 끝 -->

				<!-- 푸터 그룹 시작  -->
				<%@ include file="/resources/ind/footerTmpLogin.jsp" %>
				<!-- 푸터 그룹 끝  -->
				
			</div>
			<!-- wrap 끝 -->

			<!--  jQuery js 사용 -->
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