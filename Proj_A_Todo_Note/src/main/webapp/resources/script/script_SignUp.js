/**
 * 
 */
 
 $(function(){
 
	/* 툴팁 활성화 */ 	
 	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
 	
 	/* signUp 버튼을 누름 */
 	$("#signUp").click(function(){
 		let url="/signUp";
 		location.href=url;
 	});
 	
 	
	/* 패스워드 보기 */ 
	$("#pwView").click(function(){
		let chkTF = $(this).prop("checked");
		if (chkTF) {
			$("#uPw").attr("type", "text");
		} else {
			$("#uPw").attr("type", "password");
		}
	});
	
	
	/* 필수입력 영역 배경색 적용 */
	$("#signUpFrmTbl td.req").parent("tr").css({
		"background-color": "#d9d2e9"
	});
	
	
	/* 선택입력 영역 배경색 적용 */
	$("#signUpFrmTbl td.unReq").parent("tr").css({
		"background-color": "#ede9f7"
	});
	
	/* 필수입력 영역 배경색 적용 - 회원정보 변경 */
	$("#memEditFrmTbl td.req").parent("tr").css({
		"background-color": "#d9d2e9"
	});
	
	
	/* 선택입력 영역 배경색 적용 - 회원정보 변경 */
	$("#memEditFrmTbl td.unReq").parent("tr").css({
		"background-color": "#ede9f7"
	});
	
	
	/* 선택된 이메일 뒷자리 입력 */
	$("#emailSelect").change(function(){
		let emailSelect = $(this).val().trim();
		$("input#uEmail_02").val(emailSelect);
		if (emailSelect == "") {
			$("input#uEmail_02").focus();
		} else {
			$("input#uEmail_01").focus();
		}
	});
	
	/* 아이디 중복 체크 알림 */
	$("#idChkBtn").click(function(){
		
		let uId = $("#uId").val().trim();
		$("#uId").val(uId);
		
		// 정규표현식
		let regExp = /[^a-z|A-Z|0-9]/g;
		let rExpRes = regExp.test(uId);
		
		if(uId==""){							// 공백 체크
			alert("아이디를 입력해주세요");
			$("#uId").focus();
		}else if(rExpRes){					// 정규표현식 체크
			alert("영어 대/소문자, 숫자 조합만 가능합니다.");
			$("#uId").val("").focus();
		}else{
			let url = "/idCheck?uId="+uId;
			let nickName = "아이디 중복확인 결과";
			
			let w = screen.width;
			let popWidth = 520;
			let leftPos = (w - popWidth) / 2;
	
			let h = screen.height;
			let popHeight = 360;
			let topPos = (h - popHeight) / 2; 		
			
			let prop = "width="+ popWidth +", height="+ popHeight;
				  prop += ", left=" + leftPos + ", top=" + topPos; 
			window.open(url, nickName, prop);
		}	
	});
	
	/* 아이디 변경시 인증 초기화 */
	$("#uId").change(function(){
		$("#useIdChk").val("false");
	});	
	
	/* 아이디 중복검사 팝업창 닫기 */
	$("#idBtn").click(function(){
		let idUseable = $("#idUse").val();
		
		if (idUseable=="true") {
			opener.signUpFrm.useIdChk.value="true";
			opener.signUpFrm.uPw.focus(); 
		} else if(idUseable=="false") {
			opener.signUpFrm.useIdChk.value="false";
			opener.signUpFrm.uId.value="";
			opener.signUpFrm.uId.focus(); 
		}
		window.close();
	});
	
	
	/* 비밀번호 체크 검사 */
	$("#uPw_Re").keyup(function(){ 
		let uPw = $("#uPw").val();
		let uPw_Re = $("#uPw_Re").val();
		
		if (uPw != uPw_Re) {
			$("span#pwChk").text("비밀번호가 일치하지 않습니다.");
		} else {
			$("span#pwChk").text("");
		}
	});
	
	$("#uPw").keyup(function(){ 
		let uPw = $("#uPw").val();
		let uPw_Re = $("#uPw_Re").val();
		
		if (uPw != uPw_Re) {
			$("span#pwChk").text("비밀번호가 일치하지 않습니다.");
		} else {
			$("span#pwChk").text("");
		}
	});
	
	
	/* 이름 유효성 검사 */
	$("#uName").keyup(function(){ 
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
	
		// 정규표현식
		let regExp = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,4}/g;
		let rExpRes = regExp.test(uName);
		
		if(uName==""){							// 공백 체크
			alert("이름을 입력해주세요");
			$("#uName").focus();
		}else if(rExpRes){						// 정규표현식 체크
			alert("한글만 입력 가능합니다.");
			$("#uName").val("");
		}	
		$("#uName").focus();
	});
	
	/* 생년월일 유효성 검사*/
	let cnt=0;
	$("#uBirthday").keyup(function(){
		if (cnt!=0){
			let uBirthday = $("#uBirthday").val().trim();
			$("#uBirthday").val(uBirthday);
			
			// 정규표현식
			let regExp = /[^0-9]/g;
			let rExpRes = regExp.test(uBirthday);
		 	
			if(uBirthday=="" && cnt!=1){							// 공백 체크
				alert("생년월일을 입력하세요");
				$("#uBirthday").focus();
			}else if(rExpRes){							// 정규표현식 체크
				alert("숫자만 입력 가능합니다.");
				$("#uBirthday").val("");
			}	
			$("#uBirthday").focus();
		}
		cnt++;
	});
	
	$("#uBirthday").focusout(function(){
		cnt=0;
	});

	/* 연락처 유효성 검사*/
	$("#tel2").keyup(function(){
		let tel2 = $("#tel2").val().trim();
		$("#tel2").val(tel2);
		
		// 정규표현식
		let regExp = /[^0-9]/g;
		let rExpRes = regExp.test(tel2);
	 	
		if(rExpRes){									// 정규표현식 체크
			alert("숫자만 입력 가능합니다.");
			$("#tel2").val("");
		}	
		$("#tel2").focus();
	});
	
	/* 연락처 변경시 인증 초기화 */
	
	$("#tel1").change(function(){
		$("#useTelChk").val("false");
	});
	
	$("#tel2").change(function(){
		$("#useTelChk").val("false");
	});
	
	$("#tel3").change(function(){
		$("#useTelChk").val("false");
	});
	
	/* 연락처 중복 체크 알림 */
	$("#telChkBtn").click(function(){
		
		let tel1 = $("#tel1").val().trim();
		let tel2 = $("#tel2").val().trim();
		let tel3 = $("#tel3").val().trim();
		
		if(tel2==""){							// 공백 체크
			alert("연락처를 입력해주세요");
			$("#tel2").focus();
			event.preventDefault();
		}else if(tel3==""){
			alert("연락처를 입력해주세요");
			$("#tel3").focus();
			event.preventDefault();
		}else{
			let uTel = tel1+"-"+tel2+"-"+tel3;
			let url = "/telCheck?uTel="+uTel;
			let nickName = "연락처 중복확인 결과";
			
			let w = screen.width;
			let popWidth = 520;
			let leftPos = (w - popWidth) / 2;
	
			let h = screen.height;
			let popHeight = 360;
			let topPos = (h - popHeight) / 2; 		
			
			let prop = "width="+ popWidth +", height="+ popHeight;
				  prop += ", left=" + leftPos + ", top=" + topPos; 
			window.open(url, nickName, prop);
		}
	});	
	
	/* 연락처 중복확인 팝업창 닫기 */
	$("#telBtn").click(function(){
		let telUseable = $("#telUse").val();
		let uTel = $("#uTel").val();
				
		if (telUseable=="true") {
			opener.document.getElementById("useTelChk").value="true";
			opener.document.getElementById("uTel").value=uTel;
			opener.document.getElementById("uEmail_01").focus();
		} else {
			opener.document.getElementById("tel2").value="";
			opener.document.getElementById("tel3").value="";
			opener.document.getElementById("tel2").focus();
		}
		window.close();
	});
	
	/* 연락처 유효성 검사 */
	$("#tel3").keyup(function(){
		let tel3 = $("#tel3").val().trim();
		$("#tel3").val(tel3);
		
		// 정규표현식
		let regExp = /[^0-9]/g;
		let rExpRes = regExp.test(tel3);
	 	
		 if(rExpRes){									// 정규표현식 체크
			alert("숫자만 입력 가능합니다.");
			$("#tel3").val("");
		}	
		$("#tel3").focus();
	});	
	
	/* 우편번호 찾기 팝업 */
	$("#findZipBtn").click(function(){
		let url = "/zipCheck";
		let nickName = "zipChkPop";

		let w = screen.width;     // 1920
		let popWidth = 660;
		let leftPos = (w - popWidth) / 2; // left Position 팝업창 왼쪽 시작위치

		let h = screen.height;    // 1080
		let popHeight = 660;
		let topPos = (h - popHeight) / 2; 		
		
		let prop = "width="+ popWidth +", height="+ popHeight;
			  prop += ", left=" + leftPos + ", top=" + topPos; 
		window.open(url, nickName, prop);
	});

	/* 주소 클릭시 닫으면서  값넣기 */
	$("#zupCodeUse").click(function(){		
		let zipCode = $("#zipCode").val().trim();
		$("#zipCode").val(zipCode);
		let address = $("#address").val().trim();
		$("#address").val(address);
		
		opener.document.getElementById("uZipcode").value=zipCode;
		opener.document.getElementById("uZipcode").readOnly=true;
		opener.document.getElementById("uAddr").value=address;

		window.close();
	});
	
	/* 폼실행 엔터키 이벤트 처리 */
	$(window).keyup(function(){		
		let code = event.keyCode;
		//alert("code : " + code);
		if (code == 13) fnSignUpSbm();
    });
    
    /* 회원가입 기능 실행 */
	$("#signUpBtn").click(function(){
		fnSignUpSbm();
	});
	
	/* 회원가입 fnSignUpSbm 코드 */
	function fnSignUpSbm() {
		
		//아이디	
		let uId = $("#uId").val().trim();
		
		//아이디 중복결과
		let useIdChk = $("#useIdChk").val();
		
		//비밀번호
		let uPw = $("#uPw").val().trim();		
		$("#uPw").val(uPw);
		
		//비밀번호 확인		
		let uPw_Re = $("#uPw_Re").val().trim();	
		
		//이름
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
		
		//생년월일
		let uBirthday = $("#uBirthday").val().trim();
		
		//연락처
		let uTel = $("#uTel").val().trim();
		
		//연락처 중복 결과
		let useTelChk = $("#useTelChk").val();
		
		//이메일
		let uEmail_01 = $("#uEmail_01").val().trim();
		let uEmail_02 = $("#uEmail_02").val().trim();
		
		if(uEmail_01=="" || uEmail_02==""){
			$("#uEmail").val("");
		}else{		
			$("#uEmail").val(uEmail_01+"@"+uEmail_02);
		}
		
		//취미
		let uHobbyArr = new Array();
		uHobbyArr[0] ="0";
		uHobbyArr[1] ="0";
		uHobbyArr[2] ="0";
		uHobbyArr[3] ="0";
		uHobbyArr[4] ="0";
		
		$("input:checkbox[name='uHobby']:checked").each(function(){
			var tmpHobby = $(this).val();
			if(tmpHobby=="인터넷"){
				uHobbyArr[0] ="1";
			}else	if(tmpHobby=="여행"){
				uHobbyArr[1] ="1";
			}else if(tmpHobby=="게임"){
				uHobbyArr[2] ="1";
			}else if(tmpHobby=="영화"){
				uHobbyArr[3] ="1";
			}else if(tmpHobby=="운동"){
				uHobbyArr[4] ="1";
			}
		});
		
		let uHobbyRes
			 = uHobbyArr[0]+uHobbyArr[1]
			 +uHobbyArr[2]+uHobbyArr[3]+uHobbyArr[4];
			 
		$("#uHobbyRes").val(uHobbyRes);		


		// 폼 전체 유효성검사				
		if (uId == "") {
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			return;
		} else if (useIdChk=="false"){
			alert("아이디 중복확인을 해주세요.");
			$("#idChkBtn").focus();
			return;
		} else if (uPw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#uPw").focus();
			return;
		} else if (uPw_Re == "" || uPw != uPw_Re) {
			alert("비밀번호 일치여부를 확인해주세요.");
			$("#uPw_Re").focus();
			return;
		} else if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
			return;
		} else if (uBirthday == "") {
			alert("생년월일을 입력해주세요.");
			$("#uBirthday").focus();
			return;
		} else if (tel2 == "") {	
			alert("연락처를 입력해주세요.");
			$("#tel2").focus();
			return;
		} else if (tel3 == "") {	
			alert("연락처를 입력해주세요.");
			$("#tel3").focus();
			return;
		} else if ( useTelChk=="false"){
			alert("연락처 중복확인을 해주세요.");
			$("#useTelChk").focus();
			return;
		} else {
			let chkSbmTF = confirm("회원가입하시겠습니까?");
			if (chkSbmTF) {
				$("#signUpFrm").attr("action", "/signUp");
				$("#signUpFrm").attr("method", "post");		
				$("#signUpFrm").submit();
			}
		}
	}
	
	/* 아이디 찾기 */
	$("#findIdBtn").click(function(){
		fnFindId();
	});
	
	function fnFindId(){
		//이름
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
		
		//생년월일
		let uBirthday = $("#uBirthday").val().trim();
		
		//연락처
		let uTel = $("#uTel").val().trim();
		
		if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
			return;
		} else if (uBirthday == "") {
			alert("생년월일을 입력해주세요.");
			$("#uBirthday").focus();
			return;
		} else if (uTel == "") {	
			alert("연락처를 입력해주세요.");
			$("#uTel").focus();
			return;
		} else {
			$("#findIdFrm").submit();
		}
	}		
	
	/* 비밀번호 찾기 */
	$("#findPwBtn").click(function(){
		findPwBtn();
	});
	
	function findPwBtn(){
		//아이디
		let uId = $("#uId").val().trim();
		$("uId").val(uId);
	
		//이름
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
		
		//생년월일
		let uBirthday = $("#uBirthday").val().trim();
		
		//연락처
		let uTel = $("#uTel").val().trim();
		
		if(uId == ""){
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			return;
		}else if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
			return;
		} else if (uBirthday == "") {
			alert("생년월일을 입력해주세요.");
			$("#uBirthday").focus();
			return;
		} else if (uTel == "") {	
			alert("연락처를 입력해주세요.");
			$("#uTel").focus();
			return;
		} else {
			$("#findPwFrm").submit();
		}
	}		
	
	/* 비밀번호 변경 버튼 */
	$("#editPwBtn").click(function(){
	
		//변경할 비밀번호
		let new_uPw = $("#new_uPw").val().trim();
		$("#new_uPw").val(new_uPw);
		
		//변경할 비밀번호 확인
		let new_uPwChk = $("#new_uPwChk").val().trim();
		$("#new_uPwChk").val(new_uPwChk);
		
		//유효성검사
		if (new_uPw == "") {
			alert("변경할 비밀번호를 입력해주세요.");
			$("#new_uPw").focus();
			return;
		} else if (new_uPwChk == "" || new_uPw != new_uPwChk) {
			alert("비밀번호 일치여부를 확인해주세요.");
			$("#new_uPwChk").focus();
			return;
		} else {
			$("#editPwFrm").submit();
		}	
		
	});
		
});


/* 우편번호 api */
$(function() { 
	$("#postcodify").postcodify({
        insertPostcode5 : "#zipCode",
        insertAddress : "#address"
	});
});