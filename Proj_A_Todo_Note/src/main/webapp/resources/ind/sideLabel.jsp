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
<title>사이드라벨 템플릿</title>
</head>
<body>

	<!-- 라벨 컬러 필터 시작 -->
	<div class="labelGp d-flex">
		<button class="sideLabelIconBox" id="none">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#aaaaaa;"></i>
		</button>
		<button class="sideLabelIconBox" id="cherry">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#cc0000;"></i>
		</button>
		<button class="sideLabelIconBox" id="orange">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#e69138"></i>
		</button>
		<button class="sideLabelIconBox" id="mango">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#f1c232;"></i>
		</button>
		<button class="sideLabelIconBox" id="lime">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#6aa84f;"></i>
		</button>
		<button class="sideLabelIconBox" id="watermelon">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#45818e;"></i>
		</button>
		<button class="sideLabelIconBox" id="blueberry">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#3d85c6;"></i>
		</button>
		<button class="sideLabelIconBox" id="grapes">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#674ea7;"></i>
		</button>
		<button class="sideLabelIconBox" id="plum">
			<i class="bi bi-tag-fill sideLabelIcon" style="color:#a64d79;"></i>
		</button>
	</div>
	<!-- 라벨 컬러 필터 끝 -->
	
	<!-- 라벨 리스트 시작 -->
	<div class="labelCntBox">
		<c:choose>
			<c:when test="${color=='cherry'}">
			
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#cc0000">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
							<div class="labelCntGp detailUp" style="position:relative;">
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
							
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#cc0000">
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
				
			</c:when>
			
			<c:when test="${color=='orange'}">
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#e69138">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
								<div class="labelCntGp detailUp" style="position:relative;">
								
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
								
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#e69138">
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
			</c:when>
			
			<c:when test="${color=='mango'}">
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#f1c232">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
								
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#f1c232">
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
			</c:when>
			
			<c:when test="${color=='lime'}">
				<!-- 인클루드 필터 라임 리스트 -->
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#6aa84f">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#6aa84f">
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
			</c:when>
			
			<c:when test="${color=='watermelon'}">
				<!-- 인클루드 필터 라임 리스트 -->
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#45818e">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#45818e">
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
			</c:when>
			
			<c:when test="${color=='blueberry'}">
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#3d85c6">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#3d85c6">
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
			</c:when>
			
			<c:when test="${color=='grapes'}">
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#674ea7">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#674ea7">
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
			</c:when>
			
			<c:when test="${color=='plum'}">
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#a64d79">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
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
						
							<div class="labelCntGp detailUp" style="position:relative;">
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
							
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#a64d79">
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
			</c:when>
			
			<c:otherwise>
				<c:choose>
					<c:when test="${empty labelList}">
						<div class="labelCntGpNone">
							<div class="labelCntTitle" style="color:#aaaaaa">등록된 라벨이 없습니다.</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<!-- 반복 시작 -->
						<c:forEach var="data" items="${labelList}">
							<div class="labelCntGp detailUp" style="position:relative;">
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
							
								<!-- 삭제에 쓸 파라미터 -->
								<input type="hidden" value="${data.mNum}" id="labelMNum">
								<input type="hidden" value="label" id="side">
								<input type="hidden" value="${data.labelName}" id="color">
								
								<div style="position:absolute;right:10px;top:5px;">
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
								<div class="labelCntTitle" style="color:#aaaaaa;">
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
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 라벨 리스트 끝 -->

</body>
</html>