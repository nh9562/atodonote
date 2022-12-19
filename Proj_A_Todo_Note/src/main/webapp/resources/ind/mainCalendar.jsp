<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

		</body>
	</html>