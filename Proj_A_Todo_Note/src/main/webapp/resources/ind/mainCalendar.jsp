<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
    
<!DOCTYPE html>
	<html lang ="ko">
		<head>
			<meta charset="UTF-8">
			<title>메인캘린더 템플릿</title>
		</head>
		<body>
	
				<!-- 캘린더 영역 시작 -->
				<div id="mainRight" class="flex-fill mainRight">
						<div id="mainRightTop" class="mainRightTop d-flex">
							<input type="hidden" id="savePageDate">
							<input type="hidden" id="saveDate">
							<!-- 오늘 날짜로 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainTodayBtn" style="margin-right:5px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="오늘로 이동" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-calendar-event" style="color:#fff;font-size:20px;line-height: 20px;"></i>
							</button>
						
							<!-- 전달로 이동 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainBeforeBtn" style="width:20px;border-radius: 5px 0 0 5px"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="이전 달로 이동" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-chevron-left" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 현재 년 월 : 입력하고 엔터치면 해당 월로 이동하는것 구현?-->
							<div id="nowMonth" readonly
								style="width:80px;height:40px;font-size:14px;font-weight:500;text-align:center;line-height:40px;
								margin:0 -1px 0 -1px;border-radius: 0;border:1px solid #9400d3;background:#fff">
							</div>							
							
							<!-- 다음달로 이동 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainAfterBtn" style="margin-right:15px;width:20px;border-radius: 0 5px 5px 0"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="다음 달로 이동" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-chevron-right" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 검색 그룹 -->
							<div class="form-floating d-flex">
								<input type="text" class="form-control"
									name="mainSearch" id="mainSearch" placeholder="검색 키워드를 입력하세요."
									style="width:200px;height:40px;font-size:14px;margin-right:-1;border-radius: 5px 0 0 5px;border:1px solid #9400d3;">
								<label for="mainSearch" 
									style="padding-top:6px;padding-left:10px;font-size:14;">
										검색 키워드를 입력하세요.
								</label>
								<button type="button" class="btn btn-purple" id="mainSearchBtn" style="width:40px;height:40px;border-radius: 0 5px 5px 0;padding:0;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="검색" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover"> 
									<i class="bi bi-search" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
								</button>
							</div>
							
							<!-- 라벨 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainLabelBtn" style="margin-left:15px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="라벨" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-tag-fill" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 메모 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainMemoBtn" style="margin-left:5px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="메모" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-list-check" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 링크 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainLinkBtn" style="margin-left:5px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="링크" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-link-45deg" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 파일 아이콘 -->
							<button type="button" class="btn btn-purple headerIcon" id="mainFileBtn" style="margin-left:5px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="파일" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-paperclip" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
							<!-- 일정 추가  -->
							<button type="button" class="btn btn-purple headerIcon" id="mainWriteBtn" style="margin-left:5px;"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
    							data-bs-title="일정 추가" data-bs-container="body"
    							data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
								<i class="bi bi-plus-lg" style="color:#ffff;font-size:20px;line-height: 20px;"></i>
							</button>
							
						</div>
						
						<!-- 달력 출력 시작 -->
						<div id="mainRightBottom" class="mainRightBottom">
						
				            <div class="mainDays">
				                <div class="mainDay" style="color:#fff;">Sun</div>
				                <div class="mainDay" style="color:#fff;">Mon</div>
				                <div class="mainDay" style="color:#fff;">Tue</div>
				                <div class="mainDay" style="color:#fff;">Wed</div>
				                <div class="mainDay" style="color:#fff;">Thu</div>
				                <div class="mainDay" style="color:#fff;">Fri</div>
				                <div class="mainDay" style="color:#fff;">Sat</div>
				            </div>
				            
							<div class="mainDates"></div>
							
							<div class="mainEnds"></div>
							
						</div>					
						<!-- 달력 출력 끝 -->
						
					</div>
					<!-- 캘린더 영역 끝 -->
					
					<!-- mainWrite 모달 시작-->
					<div class="modal fade" tabindex="-1" id="mainWriteModal" aria-labelledby="mainWriteModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content" style="min-width:500px;width:500px;">
								<div class="modal-body">
								
									<!-- 파일전송을 위한 폼 설정 -->
									<form name="mainWriteModalFrm" id="mainWriteModalFrm"
											enctype="multipart/form-data"> 
									
										<div class="mainWriteModalFrmGp">
											<input type="hidden" name="mainWriteUId" id="mainWriteUId" value="${session.uId}">
											<input type="hidden" name="mainWriteLabel" id="mainWriteLabel" value="none" >
										
											<div class="form-floating">
												<div class="workTitle">일정 추가</div>
											</div>
											
											<!-- 제목, 내용 입력 -->
											<div class="mainWriteOutForm" style="margin-top:10px;">
												<div class="form-floating">													
													<input type="text" name="mainWriteSubject" id="mainWriteSubject"
														class="form-control" placeholder="제목을 입력하세요.">
													<label for="mainWriteSubject">제목을 입력하세요.</label>
												</div>
												
												<div style="margin-top:5px;">
													<textarea name="mainWriteContent" id="mainWriteContent"
														class="form-control" placeholder="내용을 입력하세요." style="height: 100px"></textarea>
												</div>
											</div>
											
											<!-- 날짜 선택 -->
											<div class="form-floating mainWriteOutForm" style="margin-top:10px;">
												<div class="form-floating dFlex">													
													<input type="text" name="mainWriteEventDate" id="mainWriteEventDate"
														class="form-control" placeholder="클릭하여 날짜를 선택하세요." readonly>
													<label for="mainWriteSubject">클릭하여 날짜를 선택하세요.</label>
												</div>												
											</div>
											
											<!-- 라벨 선택 -->
											<div class="form-floating mainWriteOutForm" style="margin-top:5px;" id = "mainWriteLabelGp">
												<button class="mainWriteLabelIconBox" value="none">
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
													<input type="text" name="mainWriteLink" id="mainWriteLink"
														class="form-control" placeholder="추가할 링크를 입력하세요." value="https://">
													<label for="mainWriteLink">추가할 링크를 입력하세요.</label>
												</div>
											</div>
											
											<!-- 파일첨부 시작 -->
											<div class="form-floating mainWriteOutForm" style="margin-top:5px;">
												<div>
												  <input class="form-control" type="file" id="mainWriteFile" name="mainWriteFile">
												</div>
											</div>
																						

										</div>
										<div style="margin-top:10px;text-align: center">
											<button class="btn btn-purple w-25" id="mainWriteModalBtn">확인</button>	
											<button type="button" data-bs-dismiss="modal" class="btn btn-secondary w-25" style="margin-left:5px;">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- mainWrite 변경 모달 끝-->
					
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

	</body>
</html>