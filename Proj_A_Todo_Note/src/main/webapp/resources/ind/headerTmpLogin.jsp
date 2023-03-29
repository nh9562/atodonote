<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해더템플릿</title>
</head>
<body>
	<!-- 해더 그룹 시작 -->
	<header id="header" class="dFlex header">
   		<div class="headerLogo" style="padding-right:10px;padding-left:10px;width:100vw;max-width:1000px;">
   			<div class="dFlex" style="justify-content: space-between;max-width: 980px;">
   			
   				<div style="cursor:pointer" id="topLogo">
    				<img src="/resources/images/logo/logo_lp.png" alt="로고이미지" class="logoImg">
    				<span class="logoTitle_Login">A Todo Note</span>
    			</div>
							
    			<div class="dFlex">
					<button id="mainPage" name="mainPage" class="btn btn-purple headerIcon" style="margin-right:5px;"
    					data-bs-toggle="tooltip" data-bs-placement="bottom"
    					data-bs-title="캘린더로 이동" data-bs-container="body"
    					data-bs-delay='{"show":0,"hide":0}' data-bs-trigger="hover">
    					<i class="bi bi-calendar-week" style="font-size: 18px; color:#fff"></i>
    				</button>
    				
					<div class="dropdown">
						<button class="btn btn-purple dropdown-toggle headerIconDrop" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-lines-fill" style="font-size: 18px; color: #fff"></i>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" id="uInfoEdit"><span class="dropMenu">회원정보 변경</span></a></li>
							<li><a class="dropdown-item" id="uPwEdit"><span class="dropMenu">비밀번호 변경</span></a></li>
							<li><a class="dropdown-item" id="memOut"><span class="dropMenu">회원 탈퇴</span></a></li>
							<li><a class="dropdown-item" id="logout"><span class="dropMenu">로그아웃</span></a></li>
						</ul>
					</div>
    			</div>
    			
   			</div>
   		</div>
   		
  		</header>	
		<!-- 해더 그룹 끝 -->
		<hr class="hr_Login">
		
	<!-- 모달 그룹 시작 -->
		<!-- 회원정보 변경 모달 시작-->
		<div class="modal fade" tabindex="-1" id="uInfoEditModal" aria-labelledby="uInfoEditModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
				<div class="modal-content" style="min-width:920px;">
					<div class="modal-body">
						<form name="memEditFrm" id="memEditFrm">
							<table id="memEditFrmTbl" style="margin:0 auto">
								<caption>회원정보 변경</caption>
									<tbody>
								
									<tr>
										<td class="req">아이디</td>
										<td>
											<div class="dFlex">
												<input type="text" name="uId" id="uId" class="form-control inputBox" value="${session.uId}" readonly>
											</div>
										</td>
										<td>&nbsp;</td>
									</tr>
									
									<tr>
										<td class="req">비밀번호</td>
										<td >
											<div class="dFlex checkbox" style="vertical-align: middle;">
			    								<input type="password" name="uPw" id="uPw"
			    									class="form-control inputBox" maxlength="20" autofocus>
			    								<div class="col checkbox">
											      	<label>
											        	<input type="checkbox" id="pwView" name="pwView"
											        		value="pwView" style="margin-top: 10px;">&nbsp;비밀번호 보기
											    	</label>
							    				</div>
		    								</div>
		    							</td>
		    							<td>
		    								<span>현재 비밀번호를 입력하세요.</span>
		    							</td>
									</tr>
		    						
		    						<tr>
		    							<td class="req">이름</td>
		    							<td>
		    								<input type="text" name="uName" id="uName" class="form-control inputBox" maxlength="20" value="${session.uName}">
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>
		    						
		    						<tr>
		    							<td class="req">생년월일</td>
		    							<td>
		    								<div class="dFlex"  style="vertical-align: middle;">
		    									<input type="text" name="uBirthday" id="uBirthday" class="form-control inputBox" maxlength="6" value="${session.uBirthday}">
		    									<div style="line-height: 32px;margin-left:10px;">ex. 830815</div>
		    								</div>
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>   
		    						 						
		    						<tr>
		    							<td class="req">연락처</td>
		    							<td>
		    								<div class="dFlex " style="vertical-align: middle;">
			    								<select name="tel1" id="tel1" class="form-select telSelect" required>
			    									<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
			    								</select>
			    								<div style="line-height: 32px;width:12.5px;text-align: center;">-</div>
			    								<input type="text" name="tel2" id="tel2"
			    									class="form-control telInputBox" maxlength="4"
			    									value="${fn:substringBefore(fn:substringAfter(session.uTel,'-'),'-')}">
			    								<div style="line-height: 32px;width:12.5px;text-align: center;">-</div>
			    								<input type="text" name="tel3" id="tel3"
			    									class="form-control telInputBox" maxlength="4"
			    									value="${fn:substringAfter(fn:substringAfter(session.uTel,'-'),'-')}">
			    								<button type="button" id="telChkBtn" class="btn btn-light" style="margin-left:10px">중복확인</button>
												<input type="hidden" name="uTel" id="uTel" value="${session.uTel}">
												<input type="hidden" name="useTelChk" id="useTelChk" value="true">
		    								</div>
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>
		    						
		    						<tr>
		    							<td class="unReq">이메일</td>
		    							<td>
		    								<div class="dFlex " style="vertical-align: middle;">
		    									<input type="hidden" name="uEmail" id="uEmail">
		    									<input type="text" name="uEmail_01" id="uEmail_01"
		    										class="form-control emailInputBox" maxlength="20"
		    										value="${fn:substringBefore(session.uEmail,'@')}">
		    									<div style="line-height: 32px;margin-left:5px;margin-right:5px;text-align: center;">@</div>
		    									<input type="text" name="uEmail_02" id="uEmail_02"
		    										class="form-control emailInputBox" maxlength="40"
		    										value="${fn:substringAfter(session.uEmail,'@')}">
		    									<select name="emailSelect" id="emailSelect" class="form-select uEmailSelect" required>
			    									<option value="">직접입력</option>
													<option>naver.com</option>
													<option>gmail.com</option>
													<option>kakao.com</option>
													<option>daum.net</option>
													<option>hanmail.net</option>
			    								</select>
			    							</div>
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>
		    						
		    						<tr>
		    							<td class="unReq">성별</td>
		    							<td>
		    								<div class="form-check dFlex">
		    									<input type="hidden" value="${session.gender}" id="sessionGender" name="sessionGender">
		    									<div style="width:60px">
				    								<label class="form-check-label">
				    									<input type="radio" name="gender" value="1" class="form-check-input" id="genderM">
				    									남
				    								</label>
			    								</div>
			    								<div style="width:60px">
				    								<label class="form-check-label">
				    									<input type="radio" name="gender" value="2" class="form-check-input" id="genderW">
				    									여
				    								</label>
			    								</div>
		    								</div>
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>
		    						
		    						<tr>	
		    							<td class="unReq">우편번호</td>
		    							<td>
		    								<div class="dFlex">    								
			    								<input type="text" name="uZipcode" id="uZipcode"
			    									maxlength="7" class="form-control zipCodeInputBox"
			    									value="${session.uZipcode}">
			    								<button type="button" id="findZipBtn" class="btn btn-light" style="margin-left:10px;">우편번호찾기</button>
		    								</div>
		    							</td>
		    							<td>
		    								<span>우편번호찾기 버튼을 클릭하세요.</span>
		    							</td>
		    						</tr>
		    						
		    						<tr>
		    							<td class="unReq">주소</td>
		    							<td>    								
		    								<input type="text" name="uAddr" id="uAddr"
		    									maxlength="100" class="form-control"
		    									value="${session.uAddr}">
		    							</td>
		    							<td>&nbsp;</td>
		    						</tr>
									
									<tr>
		    							<td class="unReq">취미</td>
		    							<td>    				
		    								<div class="dFlex checkbox" style="vertical-align: middle;">
		    										<input type="hidden" value="${session.uHobby}" id="sessionUHobby" name="sessionUHobby">
													<input type="hidden" id="uHobbyRes" name="uHobbyRes">
													
											      	<label>
											        	<input type="checkbox" name="uHobby" id="uHobby1"
											        		value="인터넷" style="margin-top:10px">&nbsp;인터넷
											    	</label>
		
											      	<label>
											        	<input type="checkbox" name="uHobby" id="uHobby2"
											        		value="여행" style="margin-top:10px;margin-left:15px;">&nbsp;여행
											    	</label>
											    	
											      	<label>
											        	<input type="checkbox" name="uHobby" id="uHobby3"
											        		value="게임" style="margin-top:10px;margin-left:15px;">&nbsp;게임
											    	</label>
											    	
											      	<label>
											        	<input type="checkbox" name="uHobby" id="uHobby4"
											        		value="영화" style="margin-top:10px;margin-left:15px;">&nbsp;영화
											    	</label>
											    	
											      	<label>
											        	<input type="checkbox" name="uHobby" id="uHobby5"
											        		value="운동" class="chkbox" style="margin-top:10px;margin-left:15px">&nbsp;운동
											    	</label>
											    	
							    			</div>
							    			<td>&nbsp;</td>
		    						</tr>
		    						
		    						<tr>
		    							<td class="lastTd" style="border-radius: 0 0 0 5px;border-bottom: 0px solid #fff;">직업</td>
		    							<td class="lastTd" style="border-bottom: 0px solid #fff;">
		    								<input type="hidden" value="${session.uJob}" id="sessionUJob" name="sessionUJob">	
		    								<select name="uJob" id="uJob" class="form-select uJobSelect">
		    									<option value=""> - 선택 - </option>
		    									<option value="교수" id="uJob1">교수</option>
		    									<option value="학생" id="uJob2">학생</option>
		    									<option value="회사원" id="uJob3">회사원</option>
		    									<option value="공무원" id="uJob4">공무원</option>
		    									<option value="자영업" id="uJob5">자영업</option>
		    									<option value="전문직" id="uJob6">전문직</option>
		    									<option value="주부" id="uJob7">주부</option>
		    									<option value="무직" id="uJob8">무직</option>
		    									<option value="기타" id="uJob9">기타</option>
		    								</select>
		    							</td>
		    							<td class="lastTd" style="border-radius: 0 0 5px 0;border-bottom: 0px solid #fff;">&nbsp;</td>
		    						</tr>
		    						
									<tr class="signUpbtnGp">
		    							<td colspan="3" style="text-align: center;border-bottom: 0px solid #fff;">
		    								<div class="mt-3">
			    								<button type="button" name="memEditBtn" id="memEditBtn" class="btn btn-purple w-25">저장</button>
		    									<button type="button" data-bs-dismiss="modal" class="btn btn-secondary w-25" style="margin-left:5px;">취소</button>
		   									</div>
		    							</td>							
		    						</tr>
								</tbody>		
							</table>
						</form>
					</div>
					
				</div>
			</div>
		</div>
		<!-- 회원정보 변경 모달 끝-->
		
		<!-- 비밀번호 변경 모달 시작-->
		<div class="modal fade" tabindex="-1" id="uPwEditModal" aria-labelledby="uPwEditModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content" style="min-width:350px;width:350px;">
					<div class="modal-body">
					
						<form name="uPwEditFrm" id="uPwEditFrm">
							<div class="uPwEditFrmGp">
								<div class="form-floating">
									<input type="hidden" name="uPwEditUid" id="uPwEditUid" value="${session.uId}">
									<input type="password" name="old_uPw" id="old_uPw"
										class="form-control" placeholder="현재 비밀번호 입력">
									<label for="old_uPw">현재 비밀번호 입력</label>
								</div>
								
								<div class="form-floating" style="margin-top:10px;margin-bottom: -1px;">
									<input type="password" name="new_uPw" id="new_uPw"
										class="form-control" placeholder="변경할 비밀번호 입력"
										style = "border-radius: 5px 5px 0 0;">
									<label for="new_uPw">변경할 비밀번호 입력</label>
								</div>
								
								<div class="form-floating">
										<input type="password" name="new_uPwChk" id="new_uPwChk"
											class="form-control" placeholder="변경할 비밀번호 확인"
											style = "border-radius: 0 0 5px 5px;">
										<label for="new_uPwChk">변경할 비밀번호 확인</label>
								</div>
							</div>
							<div style="margin-top:10px;text-align: center">
								<button class="btn btn-purple w-25" id="uPwEditBtn">확인</button>	
								<button type="button" data-bs-dismiss="modal" class="btn btn-secondary w-25" style="margin-left:5px;">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 비밀번호 변경 모달 끝-->
		
		<!--  회원탈퇴 모달 시작 -->
		<div class="modal fade" tabindex="-1" id="memOutModal" aria-labelledby="memOutModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content" style="min-width:350px;width:350px;">
					<div class="modal-body">
					
						<form name="memOutFrm" id="memOutFrm">
							<div class="memOutFrmGp">
							
								<input type="hidden" name="memOutUid" id="memOutUid" value="${session.uId}">
								
								<div class="dFlex">
									<input type="text" style="width:51%;border-radius: 5px 0 0 0;margin-bottom:-1px;font-size:16px;font-weight:500;border-right: 0px solid gray;text-align: center;"
										class="form-control" value="자동 탈퇴 방지 코드" disabled>
									<input type="text" style="width:50%;border-radius: 0 5px 0 0;margin-left:-1px;margin-bottom:-1px;font-weight: 600;text-align: center;"
										class="form-control" value="1q2w3e" id="memOutCode" readonly></input>
								</div>
								
								<div class="form-floating">
									<input type="text" name="memOutCodeIn" id="memOutCodeIn"
										class="form-control" placeholder="상단의 코드를 입력해주세요."
										style = "border-radius: 0 0 5px 5px;">
									<label for="memOutCodeIn">상단의 코드를 입력해주세요.</label>
								</div>
								
								<div class="form-floating" style="margin-top:10px;">
									<input type="password" name="memOutUPw" id="memOutUPw"
										class="form-control" placeholder="비밀번호 입력">
									<label for="memOutUPw">비밀번호 입력</label>
								</div>

							</div>
							<div style="margin-top:10px;text-align: center">
								<button class="btn btn-purple w-25" id="memOutBtn">확인</button>	
								<button type="button" data-bs-dismiss="modal" class="btn btn-secondary w-25" style="margin-left:5px;">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--  회원탈퇴 모달 끝 -->
		
	<!-- 모달 그룹 끝 -->		

</body>
</html>