/**
 * 
 */
 
 $(function(){
 
 	/* 쿠키에 저장된 id가 있다면 표시 */
 	fnInit();
 
 	/* 로그인 버튼 */
	$("#loginBtn").click(function(){
		fnLoginSbm();	
	});
	
	function fnLoginSbm() {
	
		//아이디			
		let uId = $("#uId").val().trim(); 
		$("#uId").val(uId);
		
		//비밀번호
		let uPw = $("#uPw").val().trim();
		$("#uPw").val(uPw);
		
		//아이디 저장 여부
		var remember_uId_isChk = $("#remember_uId").is(":checked");

		if(remember_uId_isChk){
			$.cookie("cookie_uId", $("#uId").val(), { expires: 7 });
			cookie_uId = $.cookie("cookie_uId");
		}else{
			$.cookie("cookie_uId", "");
		}
		
		//유효성 검사
		if (uId == "") {
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			event.preventDefault();
		} else if (uPw=="") {
			alert("비밀번호를 입력해주세요.");
			$("#uPw").focus();
			event.preventDefault();
		} else {
			$("#loginFrm").submit();
		}
	}	
	
	/* 쿠키에 저장된 id가 있다면 표시 함수 */
	function fnInit(){
		let cookie_uId = $.cookie("cookie_uId");
		
		if(cookie_uId == "") {
			$("#uId").val("");
			$("#remember_uId").prop("checked", false);
		} else {
			$("#uId").val(cookie_uId);
			$("#remember_uId").prop("checked", true);
		}
	}

 	
 });