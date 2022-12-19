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
<title>파일 링크 템플릿</title>
</head>
<body>

	<div class="fileCntBox" style="margin-top:0;height:100%">
		
		<c:choose>
			<c:when test="${empty fileList}">
				<div class="labelCntGpNone">
					<div class="labelCntTitle" style="color:#777777">등록된 파일이 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 반복 시작 -->
				<c:forEach var="data" items="${fileList}">
					<div class="labelCntGp">
					
						<div style="display: flex;">
							<!-- 날짜 표시 시작 -->
							<div class="labelEventDate">
								<c:set var="dateValue" value="${data.eventDate}" />
								${dateValue}											
							</div>
							<!-- 날짜 표시 끝 -->
						</div>
						
						<!-- 링크 부분 시작 -->
						<div class="labelCnt">
							<c:set var="fileValue" value="${data.fileName}" />
							<c:set var="originalFileValue" value="${data.originalFileName}" />
							<c:set var="fileSize" value="${data.fileSize}" />
							<c:choose>
								<c:when test="${fn:length(fileValue) gt 40}">
									<a href="/resources/fileUpload/${fileValue}" id="fileA" download>
										${fn:substring(fileValue,0,40)}..
									</a>
								</c:when>
								<c:otherwise>
									<a href="/resources/fileUpload/${fileValue}" id="fileA" download>
										${fileValue}
									</a>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 링크 부분 끝 -->
						
					</div>
				</c:forEach>
				<!-- 반복 끝 -->	
			</c:otherwise>
		</c:choose>
			
	</div>

</body>
</html>