<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="session" value="${sessionScope.memDto}"/>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 템플릿</title>
</head>
<body>
	
	<!-- 메모 작성 부분 시작 -->
	<form id="memoWriteFrm">
		<div class="memoWrite" style="height:50px;">
			<div class="d-flex" style="width:100%;height:40px;background:#d9d2e9;
				padding:3px;border-radius: 5px;">
				<input type="text" class="form-control"
					style="width:80%;height:34px;font-size:14px;border-radius: 5px 0 0 5px;border:1px solid #9400d3;"
					name="memoInsert" id="memoInsert"
					placeholder="메모를 작성해주세요.">
				<button type="button" class="btn btn-purple"
					style="width:20%;height:34px;font-size:14px;border:0;margin-left:-1;
					border-radius: 0 5px 5px 0"
					id="memoInsertBtn">입력</button>
			</div>		
		</div>
	</form>
	<!-- 메모 작성 부분 끝 -->
	
	<div class="memoCntBox" style="margin-top:0;height:91%">
		<c:choose>
			<c:when test="${empty memoList}">
				<div class="labelCntGpNone">
					<div class="labelCntTitle" style="color:#777777">등록된 메모 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 반복 시작 -->
				<c:forEach var="data" items="${memoList}">
				

				
					<div class="labelCntGp" style="position:relative;">
					
						<!-- 삭제에 쓸 파라미터 -->
						<input type="hidden" value="${data.mNum}" id="labelMNum">
						<input type="hidden" value="memo" id="side">
						
						<div style="position:absolute;right:10px;top:10px;">
							<!-- 딜리트 버튼 -->
							<i class="bi bi-x" id="EventDelIcon" style="cursor:pointer"></i>
							<!-- 딜리트 버튼 -->		
						</div>
					
						<div style="display: flex;">
							<!-- 날짜 표시 시작 -->
							<div class="labelEventDate">
								<c:set var="dateValue" value="${data.eventDate}" />
								${dateValue}											
							</div>
							<!-- 날짜 표시 끝 -->
						</div>
						
						<!-- 제목 부분 시작 -->
						<div class="labelCntTitle" style="color:#777777">
							<c:set var="subjectValue" value="${data.subject}" />
							<c:choose>
								<c:when test="${fn:length(subjectValue) gt 15}">
									${fn:substring(subjectValue,0,15)}..
								</c:when>
								<c:otherwise>
									${subjectValue}
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 제목 부분 끝 -->

						<!-- 내용 부분 시작 -->
						<div class="labelCnt">
							<c:set var="contentValue" value="${data.content}" />
							
							<c:choose>
								<c:when test="${fn:length(contentValue) gt 40}">
									${fn:substring(contentValue,0,40)}..
								</c:when>
								<c:otherwise>
									${contentValue}
								</c:otherwise>
							</c:choose>
							
						</div>
						<!-- 내용 부분 끝 -->

					</div>
				</c:forEach>
				<!-- 반복 끝 -->	
			</c:otherwise>
		</c:choose>
			
	</div>

</body>
</html>