<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
				
					<div class="labelCntGp detailUp fileUp">
					
						<div style="display: flex;">
							<!-- 날짜 표시 시작 -->
							<div class="labelEventDate">
								<c:set var="dateValue" value="${data.eventDate}" />
								${dateValue}											
							</div>
							<!-- 날짜 표시 끝 -->
						</div>
						
						<!-- 파일 부분 시작 -->
						<div class="labelCnt">
						
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
						
						
							<c:set var="fileValue" value="${data.fileName}" />
							<c:set var="originalFileValue" value="${data.originalFileName}" />
							<c:set var="fileSize" value="${data.fileSize}" />
							<fmt:formatNumber var="fileSizeRound" pattern=".00" value="${fileSize/1024}"/>
							<c:choose>
								<c:when test="${fn:length(originalFileValue) gt 40}">
									<div class="dFlex" style="justify-content: space-between;"></div>
									<div >
										<input type="hidden" value="/resources/fileUpload/${fileValue}" id="goFile">
										<a download="${data.originalFileName}" id = "goFileA">
											${fn:substring(originalFileValue,0,40)}..
										</a>
									</div>
									<div style="line-height:24px;">		
										<c:choose>
											<c:when test="${fileSize>1024}">
												[ ${fileSizeRound} KB ]
											</c:when>
											<c:otherwise>
												[ ${fileSize} Bite ]
											</c:otherwise>
										</c:choose>
									</div>
								</c:when>
								<c:otherwise>
								<div class="dFlex" style="justify-content: space-between;">
										<div>
											<input type="hidden" value="/resources/fileUpload/${fileValue}" id="goFile">
											<a download="${data.originalFileName}" id="goFileA">
												${originalFileValue}
											</a>
										</div>
										<div style="line-height:24px;">		
											<c:choose>
												<c:when test="${fileSize>1024}">							
													[ ${fileSizeRound} KB ]
												</c:when>
												<c:otherwise>
													[ ${fileSize} Bite ]
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 파일 부분 끝 -->
						
					</div>
				</c:forEach>
				<!-- 반복 끝 -->	
			</c:otherwise>
		</c:choose>
			
	</div>

</body>
</html>