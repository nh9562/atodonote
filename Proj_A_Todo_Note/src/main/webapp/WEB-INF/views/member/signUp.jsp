<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>    

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
	    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=54">			
	</head>
	
	<body class="loginBody">
	
		<!-- wrap 시작 -->
		<div id="wrap">
		
			<!-- 해더 그룹 시작 -->
			<%@ include file="/resources/ind/headerTmp.jsp" %>			
			<!-- 해더 그룹 끝 -->

			<!-- 회원가입 그룹 시작 -->
			<div class="signUpFrmGp mt-5">
				<form name="signUpFrm" id="signUpFrm" method="post" action="/signUp">
					<table id="signUpFrmTbl" style="margin:0 auto">		
						<caption>회원가입</caption>	
						<tbody>
						
							<tr>
								<td class="req">아이디</td>
								<td>
									<div class="dFlex">
										<input type="text" name="uId" id="uId" class="form-control inputBox" autofocus>
										<button type="button" id="idChkBtn" class="btn btn-light">중복확인</button>
										<input type="hidden" name="useIdChk" id="useIdChk" value="false">
									</div>
								</td>
								<td>
    								<span>영어대소문자, 숫자조합(3~20)</span>
    							</td>
							</tr>
							
							<tr>
								<td class="req">비밀번호</td>
								<td >
									<div class="dFlex checkbox" style="vertical-align: middle;">
	    								<input type="password" name="uPw" id="uPw" class="form-control inputBox" maxlength="20">
	    								<div class="col checkbox">
									      	<label>
									        	<input type="checkbox" id="pwView" name="pwView"
									        		value="pwView" style="margin-top: 10px;">&nbsp;비밀번호 보기
									    	</label>
					    				</div>
    								</div>
    							</td>
    							<td>
    								<span>영어소문자/숫자, _, @, $, 5~20 </span>
    							</td>
							</tr>
							
							<tr>
    							<td class="req">비밀번호 확인</td>
    							<td>
    								<div class="dFlex" style="vertical-align: middle;">
	    								<input type="password" name="uPw_Re" id="uPw_Re" class="form-control inputBox" maxlength="20">
	    								<span id="pwChk" style="color:red;margin: auto 0"></span>
    								</div>
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="req">이름</td>
    							<td>
    								<input type="text" name="uName" id="uName" class="form-control inputBox" maxlength="20">
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="req">생년월일</td>
    							<td>
    								<div class="dFlex"  style="vertical-align: middle;">
    									<input type="text" name="uBirthday" id="uBirthday" class="form-control inputBox" maxlength="6">
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
	    								<input type="text" name="tel2" id="tel2" class="form-control telInputBox" maxlength="4">
	    								<div style="line-height: 32px;width:12.5px;text-align: center;">-</div>
	    								<input type="text" name="tel3" id="tel3" class="form-control telInputBox" maxlength="4">
	    								<button type="button" id="telChkBtn" class="btn btn-light" style="margin-left:10px">중복확인</button>
										<input type="hidden" name="uTel" id="uTel">
										<input type="hidden" name="useTelChk" id="useTelChk" value="false">
    								</div>
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="unReq">이메일</td>
    							<td>
    								<div class="dFlex " style="vertical-align: middle;">
    									<input type="hidden" name="uEmail" id="uEmail">
    									<input type="text" name="uEmail_01" id="uEmail_01" class="form-control emailInputBox" maxlength="20">
    									<div style="line-height: 32px;margin-left:5px;margin-right:5px;text-align: center;">@</div>
    									<input type="text" name="uEmail_02" id="uEmail_02" class="form-control emailInputBox" maxlength="40">
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
    									<div style="width:60px">
		    								<label class="form-check-label">
		    									<input type="radio" name="gender" value="1" class="form-check-input">
		    									남
		    								</label>
	    								</div>
	    								<div style="width:60px">
		    								<label class="form-check-label">
		    									<input type="radio" name="gender" value="2" class="form-check-input">
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
	    								<input type="text" name="uZipcode" id="uZipcode" maxlength="7" class="form-control zipCodeInputBox">
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
    								<input type="text" name="uAddr" id="uAddr" maxlength="100" class="form-control">
    							</td>
    							<td>&nbsp;</td>
    						</tr>
							
							<tr>
    							<td class="unReq">취미</td>
    							<td>    				
    								<div class="dFlex checkbox" style="vertical-align: middle;">
    								
											<input type="hidden" id="uHobbyRes" name="uHobbyRes">
											
									      	<label>
									        	<input type="checkbox" name="uHobby"
									        		value="인터넷" style="margin-top:10px">&nbsp;인터넷
									    	</label>

									      	<label>
									        	<input type="checkbox" name="uHobby"
									        		value="여행" style="margin-top:10px;margin-left:15px;">&nbsp;여행
									    	</label>
									    	
									      	<label>
									        	<input type="checkbox" name="uHobby"
									        		value="게임" style="margin-top:10px;margin-left:15px;">&nbsp;게임
									    	</label>
									    	
									      	<label>
									        	<input type="checkbox" name="uHobby"
									        		value="영화" style="margin-top:10px;margin-left:15px;">&nbsp;영화
									    	</label>
									    	
									      	<label>
									        	<input type="checkbox" name="uHobby"
									        		value="운동" class="chkbox" style="margin-top:10px;margin-left:15px">&nbsp;운동
									    	</label>
									    	
					    			</div>
					    			<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="lastTd" style="border-radius: 0 0 0 5px;border-bottom: 0px solid #fff;">직업</td>
    							<td class="lastTd" style="border-bottom: 0px solid #fff;">	
    								<select name="uJob" id="uJob" class="form-select uJobSelect">
    									<option value=""> - 선택 - </option>
    									<option value="교수">교수</option>
    									<option value="학생">학생</option>
    									<option value="회사원">회사원</option>
    									<option value="공무원">공무원</option>
    									<option value="자영업">자영업</option>
    									<option value="전문직">전문직</option>
    									<option value="주부">주부</option>
    									<option value="무직">무직</option>
    									<option value="기타">기타</option>
    								</select>
    							</td>
    							<td class="lastTd" style="border-radius: 0 0 5px 0;border-bottom: 0px solid #fff;">&nbsp;</td>
    						</tr>
    							
    						<tr class="signUpbtnGp">
    							<td colspan="3" style="text-align: center;border-bottom: 0px solid #fff;">
    								<div class="mt-3">
	    								<button type="button" name="signUpBtn" id="signUpBtn" class="btn btn-purple w-25">회원가입</button>
    									<button type="reset" class="btn btn-light w-25" style="margin-left:5px;">다시쓰기</button>
    									<button type="button" onclick="history.back()" class="btn btn-light w-25" style="margin-left:5px;">돌아가기</button>
   									</div>
    							</td>							
    						</tr>
						</tbody>		
										
					</table>
				</form>
			</div>
			<!-- 회원가입 그룹 끝 -->

			<!-- 푸터 그룹 시작  -->
			<%@ include file="/resources/ind/footerTmp.jsp" %>
			<!-- 푸터 그룹 끝  -->
			
		</div>
		<!-- wrap 끝 -->

		<!--  jQuert js 사용 -->
		<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
		
		<!--  커스텀 js  -->
		<script src="${path}/resources/script/script_SignUp.js?no=31"></script>
		
		<!-- bootstrap js 사용 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>		
			
	</body>
	
</html>