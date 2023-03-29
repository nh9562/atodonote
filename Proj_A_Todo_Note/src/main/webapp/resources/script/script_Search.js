/**
 * 
 */
 $(function(){
 
 	//검색에서 삭제버튼 클릭 - 여기부터 시작 ★ 22.12.22
	$(".searchListLine").each(function(){	
		//파라미터 가져오기
		let mNum = $(this).find("#searchLineMNum").val();
		let returnKeyWord = $(this).find("#returnKeyWord").val();
		//클릭하면 발생할 이벤트
		$(this).find("#searchListLineCloseIcon").click(function(){
			let chkSbmTF = confirm("삭제하시겠습니까?");
			if (chkSbmTF) {
		 		let url="/searchDel?returnKeyWord="+returnKeyWord + "&mNum=" + mNum;
 				location.href=url;  
			}
			event.stopPropagation();
		});
	});
	
 	//라벨 컬러링
	$('.searchListLine').each(function(){
		let searchLabelColor = $(this).find('#searchLabelColor').val();
		$(this).find('#searchLabel').addClass(searchLabelColor);
		
	});
	
 	$(".detailUp2").click(function(){
 		$("#detailModal").modal("show");
 		$("#detailShowEditModalBtn").removeClass("hide");

 		//변수가져오기
 		let detail_mNum = $(this).find("#detail_mNum").val();
 		let detail_uId = $(this).find("#detail_uId").val();
 		let detail_subject = $(this).find("#detail_subject").val();
 		let detail_content = $(this).find("#detail_content").val();
 		let detail_eventDate = $(this).find("#detail_eventDate").val();
 		let detail_link = $(this).find("#detail_link").val();
 		let detail_detail_labelName = $(this).find("#detail_labelName").val();
 		let crtPage = $(this).find("#crtPage").val();
 		
 		if(crtPage==""||crtPage==null||crtPage==undefined){
 			crtPage = "1";
 		}
 		
 		//파일이름 리셋
 		let detail_fileName = "";
 		detail_fileName = $(this).find("#detail_fileName").val();
 		
 		let detail_originalFileName = $(this).find("#detail_originalFileName").val();
 		let detail_regTM = $(this).find("#detail_regTM").val();
 		let detail_labelName = $(this).find("#detail_labelName").val(); 		

 		//변수집어넣기
 		$("#detailModal_mNum").val(detail_mNum);
 		$("#detailModal_uId").val(detail_uId);
 		$("#detailModal_subject").val(detail_subject); 		
 		$("#detailModal_content").val(detail_content);
 		$("#detailModal_eventDate").val(detail_eventDate);
 		$("#detailModal_labelName").val(detail_detail_labelName);
 		$("#detailModal_crtPage").val(crtPage);
 		
 		if(detail_link=="" || detail_link==null || detail_link==undefined ){
 			$("#detaiModal_oldlink").val("저장된 링크가 없습니다."); 		 		
 		}else {
 			$("#detaiModal_oldlink").val("https://"+detail_link);
		}
 	 		
 		if(detail_originalFileName=="" || detail_originalFileName==null || detail_originalFileName==undefined ){
 			$("#detailModal_oldFileName").val("저장된 파일이 없습니다."); 		
 		}else {
 			$("#detailModal_oldFileName").val(detail_originalFileName);
 			$("#detailModal_oldFileDelName").val(detail_fileName);
		}		
		
 		if(detail_fileName==""){
 			$("#detailModalFile_Down").removeAttr('href');
 		}
		
		if(detail_fileName!=""){
	 		$("#detailModalFile_Down").attr("href", "/resources/fileUpload/"+detail_fileName);		
	 		$("#detailModalFile_Down").attr("download", detail_originalFileName);
 		}

 	});
 	
 	// 데이트피커 - 디테일
 	$("#detailModal_eventDate").datepicker({
 	    beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    }
 	});
 	
 	
  	// 디테일 - 라벨 선택값 가져오기
 	$("#detailModalLabelGp").each(function(){
 		$(this).find(".mainWriteLabelIconBox").click(function(){
 			let labelValue=$(this).val();
 			$("#detailModal_labelName").val(labelValue);
 			event.preventDefault();
 		});
 	});

 	//링크 이동 기능
 	$("#detaiModal_oldlink").click(function(){
 		if($("#detaiModal_oldlink").val()!="저장된 링크가 없습니다."){
			let chkSbmTF = confirm("해당 페이지로 이동하시겠습니까?");
			if (chkSbmTF) {
			location.href = $("#detaiModal_oldlink").val();
			}
		} 		
 	});	

 	//링크 디테일
 	$(".linkUp").each(function(){
 		let goLink = $(this).find("#detail_link").val();
	 	$(this).find("#linkA").click(function(){
 			let chkSbmTF = confirm("해당 페이지로 이동하시겠습니까?");
			if (chkSbmTF) {
				location.href = "http://" + goLink;
				event.stopPropagation();
			};
			event.stopPropagation();
 		});
 	});
 	
 	//파일 디테일
 	$(".fileUp").each(function(){
		let goFile = $(this).find("#goFile").val();
		$(this).find("#goFileA").click(function(){
			$(this).attr("href", goFile);
			event.stopPropagation();
		});
 	});

 	
 	// [일정 상세]에서 수정 버튼 눌러서 [일정 수정]으로 스왑
 	$("#detailShowEditModalBtn").click(function(){
 		$(this).addClass("hide");
 		$("#detailEditConfirmModalBtn").removeClass("hide");
 		$("#detailModal_FileName").removeClass("hide");
 		$("#detailEditModal_divlink").removeClass("hide");
 		$("#detailModal_subject").attr("readonly", false);
 		$("#detailModal_content").attr("readonly", false);
 		$("#detailModal_eventDate").attr("placeholder", "클릭하여 날짜를 변경하세요.");
 		$("#detailModal_eventDateLabel").text("클릭하여 날짜를 변경하세요.");
 		$("#workTitle").text("일정 수정");
 		$("#detailModalDelBtn").addClass("hide");
 		$("#detailModalEditCCBtn").removeClass("hide");
 		$("#detailModalCloseBtn").addClass("hide");
 		event.preventDefault();
 	});
 	
 	// [일정 상세] 수정에서 취소 버튼 눌러서 원래대로 돌아옴
 	$("#detailModalEditCCBtn").click(function(){
 		$("#detailShowEditModalBtn").removeClass("hide");
 		$("#detailEditConfirmModalBtn").addClass("hide");
 		$("#detailModal_FileName").addClass("hide");
 		$("#detailEditModal_divlink").addClass("hide");
 		$("#detailModal_subject").attr("readonly", true);
 		$("#detailModal_content").attr("readonly", true);
 		$("#detailModal_eventDate").attr("placeholder", "날짜");
 		$("#detailModal_eventDateLabel").text("날짜");
 		$("#workTitle").text("일정 상세");
 		$("#detailModalDelBtn").removeClass("hide");
 		$("#detailModalEditCCBtn").addClass("hide");
 		$("#detailModalCloseBtn").removeClass("hide");
 		event.preventDefault();
 	});
 	
 	// 수정 - 확인 버튼을 눌렀을 시 기능
 	$("#detailEditConfirmModalBtn").click(function(){
 		
 		//링크 값 정리
 		let chkNewLink = $("#detaiModal_newlink").val();
 		let chkNewLinkStr = chkNewLink.substring(0,8);
 		let chkNewLinkStr2 = chkNewLink.substring(0,7);
 		
 		if(chkNewLinkStr == "https://"){
 			chkNewLink=chkNewLink.substr(8);
 		}else if(chkNewLinkStr2 == "http://"){
 			chkNewLink=chkNewLink.substr(7);
 		}
 		
 		chkNewLink = chkNewLink.trim();
 		
		//옛날 링크값 세팅
		let chkOldLink = $("#detaiModal_oldlink").val();
		if(chkOldLink=="저장된 링크가 없습니다."){
			chkOldLink="";
		}
		
 		let chkOldLinkStr = chkOldLink.substring(0,8);
 		let chkOldLinkStr2 = chkOldLink.substring(0,7);
 		
 		if(chkOldLinkStr == "https://"){
 			chkOldLink=chkOldLink.substr(8);
 		}else if(chkOldLinkStr2 == "http://"){
 			chkOldLink=chkOldLink.substr(7);
 		}
 		
		chkOldLink = chkOldLink.trim();
 		
 		//링크값 세팅 체크링크가 비어 있다면 
 		if(chkNewLink=="" || chkNewLink==null || chkNewLink==undefined ){

 			//옛날 링크도 비어있다면
 			if(chkOldLink=="" || chkOldLink==null || chkOldLink==undefined){
	 			$("#detaiModal_reslink").val("");
 			}else {
 				$("#detaiModal_reslink").val(chkOldLink);
			}		 		
 		}else {
 			$("#detaiModal_reslink").val(chkNewLink);
		}		
		
		$("#detailModalFrm").attr("action", "/detailEdit");
		$("#detailModalFrm").attr("method", "post");		
		$("#detailModalFrm").submit(); 
 	});
 
 	// detailModalDelBtn
 	
 	$("#detailModalDelBtn").click(function(){
 		let detailModalDel_mNum = $("#detailModal_mNum").val();
 		let returnPageDate = $("#detailModal_eventDate").val();

		let chkSbmTF = confirm("삭제하시겠습니까?");
		if (chkSbmTF) {
	 		let url="/todoDel?returnPageDate="+returnPageDate + "&mNum=" + detailModalDel_mNum;
			location.href=url;  
		}
 		
 	});
 	
	// 캘린더 검색버튼 클릭
 	$("#mainSearchBtn").click(function(){
 		fnSearchKeyWord();
 	});
 	
 	
 	// 캘린더 검색 기능 함수
 	function fnSearchKeyWord(){
 		let keyWord = $("#mainSearch").val().trim();
 		if(keyWord==""){
 			alert("검색 키워드를 입력하세요.");
 			$("#mainSearch").focus();
 			return false;
 		}
 		let url="/search?keyWord="+keyWord;
		location.href=url;  
 	};
 	
	// 캘린더 검색기능 시작 엔터키
	$("#mainSearch").keydown(function(){
		let code = event.keyCode;
		if (code == 13) {
			fnSearchKeyWord();
		}
	}); 	
});
