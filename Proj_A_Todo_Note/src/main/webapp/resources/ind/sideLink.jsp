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
<title>사이드 링크 템플릿</title>
</head>
<body>

	<div class="linkCntBox" style="margin-top:0;height:100%">
	
		<c:choose>
			<c:when test="${empty linkList}">
				<div class="labelCntGpNone">
					<div class="labelCntTitle" style="color:#777777">등록된 링크가 없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 반복 시작 -->
				<c:forEach var="data" items="${linkList}">
				
					<div class="labelCntGp detailUp linkUp">					
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
						
							<c:set var="linkValue" value="${data.link}" />
							<c:choose>
								<c:when test="${fn:length(linkValue) gt 40}">
									<a id="linkA">
										${fn:substring(linkValue,0,40)}..
									</a>
								</c:when>
								<c:otherwise>
									<a id="linkA">
										${linkValue}
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