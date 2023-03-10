/**
 * 
 */
$(function(){
	/* topLogo를 누름 */
  	$("#topLogo").click(function(){
 		goToday();		
 	});		
 	
 	/* mainPage 버튼을 누름 */
  	$("#mainPage").click(function(){
 		goToday();		
 	});	
 	
 	
	/* uInfoEdit 버튼을 누름 */
 	$("#uInfoEdit").click(function(){
		$("#uInfoEditModal").modal("show");
 	}); 	
 	
 	
	/* uPwEdit 버튼을 누름 */
 	$("#uPwEdit").click(function(){
		$("#uPwEditModal").modal("show");
 	}); 
 		
 		
 	/* uPwEditBtn 기능 실행 */
 	$("#uPwEditBtn").click(function(){
 		fnUPwEdit();
 	});
 		
 	/*	fnUPwEdit 기능 코드 */
 	function fnUPwEdit(){
 		let old_uPw = $("#old_uPw").val().trim();
 		let new_uPw = $("#new_uPw").val().trim();
 		let new_uPwChk = $("#new_uPwChk").val().trim();
 		
 		//폼 전체 유효성검사
 		if (old_uPw == "") {
			alert("현재 비밀번호를 입력해주세요.");
			$("#old_uPw").focus();
			event.preventDefault();
		} else if (new_uPw == "") {
			alert("변경할 비밀번호를 입력해주세요.");
			$("#new_uPw").focus();
			event.preventDefault();
		} else if (new_uPwChk == "" || new_uPw != new_uPwChk) {
			alert("변경할 비밀번호의 일치여부를 확인해주세요.");
			$("#new_uPwChk").focus();
			event.preventDefault();
		} else {
			let chkSbmTF = confirm("비밀번호를 변경하시겠습니까?");
			if (chkSbmTF) {
				$("#uPwEditFrm").attr("action", "/uPwEdit");
				$("#uPwEditFrm").attr("method", "post");		
				$("#uPwEditFrm").submit();
			}
		}
 	
 	};
 		
	/* memOut 버튼을 누름 */
 	$("#memOut").click(function(){
		$("#memOutModal").modal("show"); 		
 	}); 	
 	
 	
 	/* 회원 탈퇴 기능 실행 */
	$("#memOutBtn").click(function(){
		let memOutCode = $("#memOutCode").val().trim();
		let memOutCodeIn =  $("#memOutCodeIn").val().trim();
		let memOutUPw =  $("#memOutUPw").val().trim();

		if(memOutCodeIn==""){
			alert("자동 탈퇴 방지 코드를 입력해주세요.");
			$("#memOutCodeIn").focus();
			event.preventDefault();
		} else if(memOutCode!=memOutCodeIn){
			alert("자동 탈퇴 방지 코드를 확인해주세요.");
			$("#memOutCodeIn").focus();
			event.preventDefault();
		} else if (memOutUPw==""){
			alert("비밀번호를 입력하세요.");
			$("#memOutUPw").focus();
			event.preventDefault();
		} else {
			let chkSbmTF = confirm("회원탈퇴를 진행하시겠습니까?");
			if (chkSbmTF) {
				$("#memOutFrm").attr("action", "/memOut");
				$("#memOutFrm").attr("method", "post");		
				$("#memOutFrm").submit();
			}
		}
	}); 	
 	
 	/* 회원정보 수정 - 성별 */
	let sessionGender = $("#sessionGender").val();
	if(sessionGender=="1"){
		$("#genderM").attr("checked", true);
	}else if(sessionGender=="2"){
		$("#genderW").attr("checked", true);
	}  	
	
	/* 회원정보 수정 - 취미 */
	let sessionUHobby = $("#sessionUHobby").val();
	
	if(sessionUHobby.substr(0, 1)=="1"){
		$("#uHobby1").attr("checked", true);
	}
	
	if(sessionUHobby.substr(1, 1)=="1"){
		$("#uHobby2").attr("checked", true);
	}
	
	if(sessionUHobby.substr(2, 1)=="1"){
		$("#uHobby3").attr("checked", true);
	}
	
	if(sessionUHobby.substr(3, 1)=="1"){
		$("#uHobby4").attr("checked", true);
	}
	
	if(sessionUHobby.substr(4, 1)=="1"){
		$("#uHobby5").attr("checked", true);
	}
	
	/* 회원정보 수정 - 직업 */
	let sessionUJob = $("#sessionUJob").val();
	
	if(sessionUJob=="교수"){
		$("#uJob1").attr("selected", true);
	}
	
	if(sessionUJob=="학생"){
		$("#uJob2").attr("selected", true);
	}
	
	if(sessionUJob=="회사원"){
		$("#uJob3").attr("selected", true);
	}
	
	if(sessionUJob=="공무원"){
		$("#uJob4").attr("selected", true);
	}
	
	if(sessionUJob=="자영업"){
		$("#uJob5").attr("selected", true);
	}
	
	if(sessionUJob=="전문직"){
		$("#uJob6").attr("selected", true);
	}
	
	if(sessionUJob=="주부"){
		$("#uJob7").attr("selected", true);
	}
	
	if(sessionUJob=="무직"){
		$("#uJob8").attr("selected", true);
	}
	
	if(sessionUJob=="기타"){
		$("#uJob9").attr("selected", true);
	}
 	
	/* logout 버튼을 누름 */
 	$("#logout").click(function(){
 		if(confirm("로그아웃 하시겠습니까?")){
	 		let url="/logout";
 			location.href=url; 		
 		}
 	}); 	
 	
 	/* 회원정보 변경 기능 실행 */
 	$("#memEditBtn").click(function(){
 		fnMemEditSbm();
 	});
 	
 	/* 회원정보 변경 fnMemEditSbm 코드 */
 	function fnMemEditSbm(){
 	
 		//아이디	
		let uId = $("#uId").val().trim();
		
		//비밀번호
		let uPw = $("#uPw").val().trim();		
		$("#uPw").val(uPw);
		
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
		if (uPw == "") {
			alert("현재 비밀번호를 입력해주세요.");
			$("#uPw").focus();
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
			let chkSbmTF = confirm("회원정보를 변경하시겠습니까?");
			if (chkSbmTF) {
				$("#memEditFrm").attr("action", "/memEdit");
				$("#memEditFrm").attr("method", "post");		
				$("#memEditFrm").submit();
			}
		}
 	}
 	
 	/* 사이드바 오픈 구현 */ 	 	
 	/* 라벨 버튼을 누른다 */ 
 	$("#mainLabelBtn").click(function(){
 		let url="/main?selectDate=" + $("#savePageDate").val() + "&side=label&color=none"; 
 		location.href=url;  
 	});
 	
 	/* 메모 버튼을 누른다 */ 
 	$("#mainMemoBtn").click(function(){
 		let url="/main?selectDate=" + $("#savePageDate").val() + "&side=memo";
 		location.href=url;  
 	});
 	
 	/* 링크 버튼을 누른다 */ 
 	$("#mainLinkBtn").click(function(){
 		let saveCrtPageDate="";
 		let url="/main?selectDate=" + $("#savePageDate").val() + "&side=link";
 		location.href=url;  
 	});
 	
 	/* 파일 버튼을 누른다 */ 
 	$("#mainFileBtn").click(function(){
 		let saveCrtPageDate="";
 		let url="/main?selectDate=" + $("#savePageDate").val() + "&side=file";
 		location.href=url;  
 	});
 	
 	/* 라벨사이드바 - 분류라벨 구현 */ 	
 	/* 라벨 필터 클릭 */
 	$("#none").click(function(){
 		let url="/main?side=label&color=none";
 		location.href=url;
 	});
 	
 	$("#cherry").click(function(){
 		let url="/main?side=label&color=cherry";
 		location.href=url;
 	});
 	
 	$("#orange").click(function(){
 		let url="/main?side=label&color=orange";
 		location.href=url;
 	});
 	
 	$("#mango").click(function(){
 		let url="/main?side=label&color=mango";
 		location.href=url;
 	});
 	
 	$("#lime").click(function(){
 		let url="/main?side=label&color=lime";
 		location.href=url;
 	});
 	
 	$("#blueberry").click(function(){
 		let url="/main?side=label&color=blueberry";
 		location.href=url;
 	});
 	
 	$("#watermelon").click(function(){
 		let url="/main?side=label&color=watermelon";
 		location.href=url;
 	});
 	
 	$("#grapes").click(function(){
 		let url="/main?side=label&color=grapes";
 		location.href=url;
 	});
 	
 	$("#plum").click(function(){
 		let url="/main?side=label&color=plum";
 		location.href=url;
 	});
 	
 	/*/////////////////////////////////////*/
 	/*///////////// 캘린더 시작//////////// */
 	/*/////////////////////////////////////*/
 	
 	//년-월 세팅
 	let date ="";
 	let currentPageDate="";
 	let returnPageDate="";
 	
 	if($("#currentPageDate").length > 0){
 		currentPageDate = $("#currentPageDate").val();
 	}
 	
 	if(currentPageDate==""){
 		if($("#savePageDate").length > 0){
 			currentPageDate = $("#savePageDate").val();
 		}
 	}
 	
 	if($("#returnPageDate").length > 0){
 		returnPageDate = $("#savePageDate").val();
 	}
 	
 	if(currentPageDate==""){
 		date = new Date();	
 		renderCalendar();
 	}else{
		date = new Date(currentPageDate);
		renderCalendar();
 	} 	
 	
 	//캘린더 함수 정의
 	function renderCalendar(){
	 	let viewYear = date.getFullYear();
	 	let viewMonth = date.getMonth();
	 	let viewDate = date.getDate();
	 	let getDay = date.getDay();
	 	let viewDay ="-";
	 	
	 	if(getDay=="1"){
	 		viewDay = "Monday";
	 	}else if(getDay=="2"){
	 		viewDay = "Tuesday";
	 	}else if(getDay=="3"){
	 		viewDay = "Wednesday";
	 	}else if(getDay=="4"){
	 		viewDay = "Thursday";
	 	}else if(getDay=="5"){
	 		viewDay = "Friday";
	 	}else if(getDay=="6"){
	 		viewDay = "Saturday";
	 	}else {
	 		viewDay = "Sunday";
	 	}
	 	
	 	document.getElementById("nowMonth").innerText 
 			= `${viewYear}-${viewMonth + 1}`;
 			
		document.getElementById("savePageDate").value=`${viewYear}-${viewMonth + 1}-${viewDate}`;	
	 	document.getElementById("saveDate").value=`${viewDate}`;	
	 	
	 	if($("#pageState").val()=="main"){
		 	document.getElementById("mainLeftDay").innerText=`${viewDay}`;	
		 	document.getElementById("mainLeftDate").innerText=`${viewDate}`;	
		 	
	 	}
	 	
	 	//전달의 마지막 날짜, 요일
	 	let prevLast = new Date(viewYear, viewMonth, 0);
		let PLDate = prevLast.getDate();
		let PLDay = prevLast.getDay();
	 	
	 	//이번달의 마지막 날짜, 요일
	 	let thisLast = new Date(viewYear, viewMonth + 1, 0);
	 	let TLDate = thisLast.getDate();
	 	let TLDay = thisLast.getDay();
	 	
	 	//전체 달력에 필요한 날짜 만들기
	 	let prevDates = [];
		let thisDates = [...Array(TLDate + 1).keys()].slice(1);
		let nextDates = [];
		
		//이전 달을 표현할 날짜 생성
		if (PLDay !== 6) {
			  for (let i = 0; i < PLDay + 1; i++) {
			    	prevDates.unshift("");
			  }
		}
		
		//다음 달을 표현할 날짜 생성
		for (let i = 1; i < 7 - TLDay; i++) {
		  	nextDates.push("");
		}
	 	
	 	//값 세팅
	 	let dates = prevDates.concat(thisDates, nextDates);
	 	
	 	let firstDateIndex = dates.indexOf(1);
  		let lastDateIndex = dates.lastIndexOf(TLDate);
	 	
		dates.forEach((date, i) => {
		    let condition = i >= firstDateIndex && i < lastDateIndex + 1
                      ? 'this'
                      : 'other';
		    dates[i] = `<div class="mainDate" id="mainDate"><span class="${condition}">${date}</span></div>`;
		})
		document.querySelector('.mainDates').innerHTML = dates.join('');
		
		
		//오늘 날짜
		let today = date;
		if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
			    for (let date of document.querySelectorAll('.this')) {
				      if (+date.innerText === today.getDate()) {
					        date.classList.add('today');
					        date.parentNode.classList.add('selectDate');
					        break;
				      }
			  }
		 }
 	}
 	
 	// 캘린더 출력한 자리에 일정이 있으면 표시하고싶음
 	
 	
 	/*/////////////////////////////////////*/
 	/*///////////// 캘린더 끝////////////// */
 	/*/////////////////////////////////////*/
 	
 	
 	//전달로 이동
 	function prevMonth(){
 		let selectDate = $("#saveDate").val();
		date.setDate(selectDate);
		date.setMonth(date.getMonth() - 1);
		renderCalendar();
	}
	 	
 	$("#mainBeforeBtn").click(function(){
 		prevMonth();
 		fnMainDateClick();
 		setNowYMD();
 		let selectDate = $("#savePageDate").val(); 	
 		 	
 	 	if($("#mainLeftDate").length > 0){
 			let url="/main?selectDate="+selectDate;
 			location.href=url;
 		}
 	});
 	
 	
 	//다음달로 이동
 	function nextMonth(){
 		let selectDate = $("#saveDate").val();
		date.setDate(selectDate);
		date.setMonth(date.getMonth() + 1);
		renderCalendar();
 	}
 	
 	$("#mainAfterBtn").click(function(){
 		nextMonth();
 		fnMainDateClick();
 		setNowYMD();
 		let selectDate = $("#savePageDate").val();
 		
 		if($("#mainLeftDate").length > 0){
	 		let url="/main?selectDate="+selectDate;
	 		location.href=url;
		}
 	});

 	//오늘로 이동
 	function goToday(){
 		let newDate = new Date();	 	
 		let todayYear = newDate.getFullYear();
 		let todayMonth = newDate.getMonth()+1;
 		let todayDate = newDate.getDate();
 		let todayTMD = todayYear + "-" + todayMonth + "-" + todayDate;
 		let url="/main?selectDate="+todayTMD;
 		location.href=url;  		
 	}
 	
 	$("#mainTodayBtn").click(function(){
 		goToday();
 		fnMainDateClick();
 		setNowYMD();
 	});
 	
 	
	/* 캘린더 클릭 이벤트 구현 */
	fnMainDateClick();
	
	function fnMainDateClick(){
		$("[id='mainDate']").click(function(){
			let nowMonth = $("#nowMonth").text();
			let nowDate = $(this).find("span").text();
			if(nowDate == ""){
				return;
			}		
			let selectDate=nowMonth+"-"+nowDate;
	 		let url="/main?selectDate="+selectDate;
	 		location.href=url;  
		});
	}		
	
	/* 메인 왼쪽에 최초의 날짜값 전달 */
	setNowYMD();
	
	function setNowYMD(){
		let nowMonth = $("#nowMonth").text().trim();
		let mainLeftDate = $("#mainLeftDate").text().trim();
		let selectToday = $(".today").text();
		let nowYMD = nowMonth + "-" + selectToday;
		$("#currentPageDate").val(nowYMD);
		$("#savePageDate").val(nowYMD);
	}
	
	
 	/*//////////////////////////////////////*/
 	/*///////////// 메인 좌측 시작 ///////// */
 	/*/////////////////////////////////////*/
 	
 	/* todo 작성 */
 	$("#todayCntAddInsertBtn").click(function(){
			setNowYMD();
			fnTodoWrite();
 	});
 	
 	function fnTodoWrite(){
 		let todoIns = $("#todayCntAddInsert").val().trim();
		let crtPD = $("#currentPageDate").val().trim();
		let todoWriteUId = $("#todoWriteUId").val().trim();
 		
 		$("#todayCntAddInsert").val(`${todoIns}`);
 		$("#todoWriteUId").val(`${todoWriteUId}`);  		
 		$("#currentPageDate").val(`${crtPD}`);
 		
 		//유효성 검사
 		if(todoIns==""){
 			alert("메모를 작성해주세요.");
 			$("#todayCntAddInsert").focus();
 			return;
 		}
		$("#mainLeft_InsertMemo").attr("action", "/todoWrite");
		$("#mainLeft_InsertMemo").attr("method", "post");		
		$("#mainLeft_InsertMemo").submit(); 	
 	}
 	
 	/* 리스트 css */
 	
 	//라벨 컬러링
	$('.todayCntLine').each(function(){
		let labelColor = $(this).find('#labelColor').val();
		$(this).find('#mainLeft_labelIcon').addClass(labelColor);
		
	});
 	
 	//todo list 메모 제거
 	$(".todayCntLine").each(function(){
 		//파라미터 가져오기
 		let mNum = $(this).find("#cntLineMNum").val();
 		let returnPageDate = $("#savePageDate").val();
 		//클릭하면 발생할 이벤트
 		$(this).find("#closeIcon").click(function(){
			let chkSbmTF = confirm("메모를 삭제하시겠습니까?");
			if (chkSbmTF) {
		 		let url="/todoDel?returnPageDate="+returnPageDate + "&mNum=" + mNum;
 				location.href=url;  
			}
 		});
 	});
 	
 	
	/* left main - todo작성 폼실행 엔터키 이벤트 처리 */
	$("#todayCntAddInsert").keydown(function(){
		let code = event.keyCode;
		if (code == 13) {
			setNowYMD();
			fnTodoWrite();
			event.preventDefault();
		}
	});
	
 	/*//////////////////////////////////////*/
 	/*///////////// 메인 좌측 끝	 / ///////// */
 	/*/////////////////////////////////////*/
 	
 	//sidelabel - icon 눌러 제거
 	$(".labelCntGp").each(function(){
 		//파라미터 가져오기
 		let mNum = $(this).find("#labelMNum").val();
 		let returnPageDate = $("#savePageDate").val();
 		let sideValue = $("#side").val();
 		let colorValue = $("#color").val();
 		
 		//클릭하면 발생할 이벤트
 		$(this).find("#EventDelIcon").click(function(){
			let chkSbmTF = confirm("삭제하시겠습니까?");
			if (chkSbmTF) {
		 		let url="/labelDel?returnPageDate="+returnPageDate + "&side=" + sideValue + "&color=" + colorValue + "&mNum=" + mNum;
 				location.href=url;  
			}
 		});
 	});
 	
 	
	/* 사이드 - 메모 작성 */
 	$("#memoInsertBtn").click(function(){
			fnMemoWrite();
 	});
 	
 	function fnMemoWrite(){
 		let memoInsert = $("#memoInsert").val().trim();
 		
 		$("#memoInsert").val(`${memoInsert}`);
 		
 		//유효성 검사
 		if(memoInsert==""){
 			alert("메모를 작성해주세요.");
 			$("#memoInsert").focus();
 			return;
 		}
		$("#memoWriteFrm").attr("action", "/memoWrite");
		$("#memoWriteFrm").attr("method", "post");		
		$("#memoWriteFrm").submit(); 	
 	}
 	
	/* side - memo작성 폼실행 엔터키 이벤트 처리 */
	$("#memoInsert").keydown(function(){
		let code = event.keyCode;
		if (code == 13) {
			fnMemoWrite();
			event.preventDefault();
		}
	});
 	
 	
});