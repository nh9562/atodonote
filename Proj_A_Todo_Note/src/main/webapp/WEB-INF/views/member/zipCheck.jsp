<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>우편번호 검색</title>
    
		<!-- bootstrap css 사용 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
			crossorigin="anonymous">
		<!-- bootstarp icon 사용  -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	    <link rel="stylesheet" href="${path}/resources/style/style_Main.css?no=73">
	    <!-- 검색 css -->
	    <link rel="stylesheet" type="text/css" href="https://cdn.poesis.kr/post/search.css" media="all" />
	    			
	</head>

	<body class="popBody">
		<div id="wrap_zipPopup">
			<div id="postcodify" class="findZipcode"></div>			        
		</div>
		
		<div id="wrap_zipPopup2">
			<table style="width: 100%" id="zipTb">
				<tr>
					<td style="width: 15%;text-align: left;">우편번호</td>
					<td>
						<input type="text" name="zipCode" id="zipCode" value="" class="form-control zipCodeInputBox" readonly>
					</td>
				</tr>
				<tr>
					<td style="width: 15%;text-align: left;">주소</td>
					<td style="width: 85%">
						<input type="text" name="address" id="address" value="" class="form-control" readonly>
					</td>
				</tr>						
			</table>
	    </div>
	    
	    <div style="width:600px;margin: 0 auto;">
			<button type="button" id="zupCodeUse" class="btn btn-purple" style="width:600px">사용하기</button>				
	    </div>
		<!--  jQuert js 사용 -->
		<script src="${path}/resources/script/jquery-3.6.0.min.js"></script>
		<script src="${path}/resources/script/script_SignUp.js?no=20"></script>
	 	
	 	<!-- bootstrap js 사용 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
			
		<!-- 우편번호 api -->	
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>	
			
	</body>
</html>