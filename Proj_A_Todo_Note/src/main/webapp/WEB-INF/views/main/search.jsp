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
		    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=43">
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
				<div style="height:600px;padding-right:10px;padding-left:10px;width:100vw;max-width:1000px;">
					<div class="form-floating dFlex" style="max-width: 980px;">
							<input type="text" class="form-control"
								name="mainSearch" id="mainSearch" placeholder="검색 키워드를 입력하세요." value="${keyWord}"
								style="height:40px;font-size:14px;margin-right:-1;border-radius: 5px 0 0 5px;border:1px solid #9400d3;">
							<label for="mainSearch" 
								style="padding-top:6px;padding-left:10px;font-size:14;">
									검색 키워드를 입력하세요.
							</label>						
						<button type="button" class="btn btn-purple" id="mainSearchBtn" style="width:125px;height:40px;border-radius: 0 5px 5px 0;padding:0;"> 
							<i class="bi bi-search" style="color:#ffff;font-size:20px;line-height: 20px;"></i>검색
						</button>
					</div>
				
					<div class="searchList dFlex">
					
						<!-- 반복해서 들어갈 부분 시작 -->
						<c:choose>
							<c:when test="${empty searchList}">
								<div class="searchListLine">
									<div class="searchListLineNone">
											검색 결과가 없습니다.
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="data" items="${searchList}">
								
									<div class="searchListLine detailUp2">
									
									 	<div class="searchListLineTop dFlex">
									 	
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
											<input type="hidden" value="${crtPage}" id = "crtPage">
									 	
									 		<!-- 라벨아이콘 표시 : 라벨컬러 세팅해야함 -->
											<div class="searchListLineLabel">
												<input type="hidden" value="${data.labelName}" id="searchLabelColor">
												<i class="bi bi-tag-fill" style="font-size: 20px" id="searchLabel"></i>
											</div>
											
											<!-- 제목 표시 -->
											<div class="searchListLineTitle">
												<c:set var="subjectValue" value="${data.subject}" />
												<c:choose>
													<c:when test="${fn:length(subjectValue) gt 20}">
														${fn:substring(subjectValue,0,20)}..
													</c:when>
													<c:otherwise>
														${subjectValue}
													</c:otherwise>
												</c:choose>
											</div>
											
											<!-- 삭제에 쓸 데이터 확보 -->
											<input type="hidden" value="${data.mNum}" id="searchLineMNum">
											<!-- 돌아갈 키 데이터 확보 -->
											<input type="hidden" value="${keyWord}" id="returnKeyWord">
											
											<div class="searchListLineIconGp dFlex">
												<!-- 링크 아이콘 표시 -->
												<c:if test="${not empty data.link}">
													<i class="bi bi-link-45deg CntLineIconStyle"></i>
												</c:if>
												<!-- 첨부 아이콘 표시 -->
												<c:if test="${not empty data.fileName}">
													<i class="bi bi-paperclip CntLineIconStyle" ></i>
												</c:if>
																					
												<!-- 닫기 아이콘 표시 -->				
												<div class="searchListLineCloseIconDiv" id="searchListLineCloseIconDiv">
													<i class="bi bi-x" id="searchListLineCloseIcon"></i>
												</div>
											</div>
									 	</div>
						 	
									 	<div class="searchListLineBot">
									 		<!-- 날짜 표시 -->
									 		<div class="searchListLineEventDate">${data.eventDate}</div>
									 		<!-- 내용 표시 -->
									 		<c:choose>
									 			<c:when test="${empty data.content || data.content==''}">
									 				내용이 없는 일정입니다.
									 			</c:when>
									 			<c:otherwise>
									 				${data.content}
									 			</c:otherwise>
								 			</c:choose>
									 	</div>
									 	
									</div>
								
								</c:forEach>
							</c:otherwise>
						</c:choose>	
						<!-- 반복해서 들어갈 부분 끝 -->												
					</div>
					
					<!-- 페이징 시작 -->
					<div class="searchPageGp dFlex">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<!-- 이전블럭으로 시작-->
								<c:choose>
									<c:when test="${pageMaker.prev}">
										<li class="page-item">
											<a class="page-link" href="/search?keyWord=${keyWord}&page=${pageMaker.startPage-1}"
												aria-label="Previous"
												style="border:1px solid #9400d3">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled">
											<a class="page-link" href="/search?keyWord=${keyWord}&page=${pageMaker.startPage-1}"
												aria-label="Previous"
												style="border:1px solid #9400d3;background:#eee;">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								<!-- 이전블럭으로 끝-->
								
								<!-- 페이징 시작 : 결과가 더 있으면 추가되어야 하는 부분 -->
								<c:forEach
									begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}"
									var="pageNum">
									
									<li class="page-item">
										<a class="page-link page-link_num" href="/search?keyWord=${keyWord}&page=${pageNum}"
											style="border:1px solid #9400d3">
												${pageNum}
										</a>
									</li>
									
								</c:forEach>
								<!-- 페이징 끝 -->
								
								<!-- 다음블럭으로 시작-->
								<c:choose>
								<c:when test="${pageMaker.next && pageMaker.endPage>0}">
									<li class="page-item">
										<a class="page-link" href="/search?keyWord=${keyWord}&page=${pageMaker.endPage+1}"
											aria-label="Next"
											style="border:1px solid #9400d3">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="/search?keyWord=${keyWord}&page=${pageMaker.endPage+1}"
											aria-label="Next"
											style="border:1px solid #9400d3;background:#eee;">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:otherwise>
								</c:choose>
								<!-- 다음블럭으로 끝-->
								
							</ul>
						</nav>
					</div>
					<!-- 페이징 끝 -->

<!-- ################### [ 여기부터는 모달 시작 ] ################### -->

			<!-- detail, edit 모달 시작 - 코멘트 붙일 수 있음 -->
			<div class="modal fade" tabindex="-1" id="detailModal"
				aria-labelledby="detailModalLabel" data-bs-backdrop="static"
				data-bs-keyboard="false" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					<div class="modal-content" style="min-width: 500px; width: 500px;">
						<div class="modal-body">
							<!-- 파일전송을 위한 폼 설정 -->
							<form name="detailModalFrm" id="detailModalFrm"
									enctype="multipart/form-data"> 
							
								<div class="detailModalFrmGp">
									<input type="hidden" name="detailModal_mNum" id="detailModal_mNum">
									<input type="hidden" name="detailModal_uId" id="detailModal_uId" value="${session.uId}">
									<input type="hidden" name="detailModal_labelName" id="detailModal_labelName" value="none" >
									<input type="hidden" name="detailModal_keyWord" id="detailModal_keyWord" value="${keyWord}">
									<input type="hidden" name="detailModal_crtPage" id="detailModal_crtPage">
								
									<div class="form-floating">
										<div class="workTitle" id="workTitle">일정 상세</div>
									</div>
									
									<!-- 제목, 내용 입력 -->
									<div class="mainWriteOutForm" style="margin-top:10px;">
										<div class="form-floating">													
											<input type="text" name="detailModal_subject" id="detailModal_subject"
												class="form-control" placeholder="제목" readonly>
											<label for="detailModal_subject">제목</label>
										</div>
										
										<div style="margin-top:5px;">
											<textarea name="detailModal_content" id="detailModal_content"
												class="form-control" placeholder="내용을 입력하세요." style="height: 100px" readonly></textarea>
										</div>
									</div>
									
									<!-- 날짜 선택 -->
									<div class="form-floating mainWriteOutForm" style="margin-top:10px;">
										<div class="form-floating dFlex">													
											<input type="text" name="detailModal_eventDate" id="detailModal_eventDate"
												class="form-control" placeholder="날짜" readonly>
											<input type="hidden" id="detailModal_oldFileDelName">
											<label for="detailModal_eventDate" id="detailModal_eventDateLabel">날짜</label>
										</div>												
									</div>
									
									<!-- 라벨 선택 -->
									<div class="form-floating mainWriteOutForm" style="margin-top:5px;" id = "detailModalLabelGp">
										<button class="mainWriteLabelIconBox" value="none" >
											<i class="bi bi-tag-fill" style="color:#aaaaaa;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="cherry">
											<i class="bi bi-tag-fill" style="color:#cc0000;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="orange">
											<i class="bi bi-tag-fill" style="color:#e69138;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="mango">
											<i class="bi bi-tag-fill" style="color:#f1c232;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="lime">
											<i class="bi bi-tag-fill" style="color:#6aa84f;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="watermelon">
											<i class="bi bi-tag-fill" style="color:#45818e;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="blueberry">
											<i class="bi bi-tag-fill" style="color:#3d85c6;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="grapes">
											<i class="bi bi-tag-fill" style="color:#674ea7;font-size:20px;"></i>
										</button>
										<button class="mainWriteLabelIconBox" value="plum">
											<i class="bi bi-tag-fill" style="color:#a64d79;font-size:20px;"></i>
										</button>
									</div>
									
									<!-- 링크 시작 : https:// -->
									<div class="form-floating mainWriteOutForm" style="margin-top:10px;">
										<div class="form-floating dFlex">
											<input type="text" name="detaiModal_oldlink" id="detaiModal_oldlink"
												class="form-control" placeholder="링크" readonly value="">
											<label for="detaiModall_link">링크</label>
										</div>
										<div class="form-floating dFlex hide"  style="margin-top:5px;" id="detailEditModal_divlink">													
											<input type="text" name="detaiModal_newlink" id="detaiModal_newlink"
												class="form-control" placeholder="변경할 링크를 입력하세요." value="http://">
											<label for="detaiModall_link">변경할 링크를 입력하세요.</label>
										</div>
										<input type="hidden" id="detaiModal_reslink" name="detaiModal_reslink">
									</div>
									
									<!-- 파일첨부 시작 -->
									<div class="form-floating mainWriteOutForm" style="margin-top:5px;">
										<a id="detailModalFile_Down">
											<div>													
												<div class="form-floating dFlex"> <!-- 여기부터 시작 다운로드 걸어야함 -->
													<input class="form-control" type="text" value="" id="detailModal_oldFileName"
														name="detailModal_oldFileName" readonly>
													<label for="detaiModall_link">첨부 파일</label>	
												</div>
												<input class="form-control hide" type="file" id="detailModal_FileName"
													name="detailModal_FileName" style="margin-top:5px;">
											</div>
										</a>	
									</div>

								</div>
								<div style="margin-top:10px;text-align: center">
									<button class="btn btn-purple w-25 hide" id="detailEditConfirmModalBtn">확인</button>	
									<button class="btn btn-purple w-25 hide" id="detailShowEditModalBtn">수정</button>	
									<button type="button" class="btn btn-secondary w-25"
										style="margin-left:5px;" id="detailModalDelBtn">삭제</button>
										
									<button type="button" class="btn btn-secondary w-25 hide"
										style="margin-left:5px;" id="detailModalEditCCBtn">취소</button>
										
									<button type="button" data-bs-dismiss="modal" class="btn btn-secondary w-25"
										style="margin-left:5px;" id="detailModalCloseBtn">닫기</button>
										
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
			<!-- detail 모달 끝-->
					
					
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
			<script src="${path}/resources/script/script_Main.js?no=7"></script>
			<script src="${path}/resources/script/script_Search.js"></script>
			
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