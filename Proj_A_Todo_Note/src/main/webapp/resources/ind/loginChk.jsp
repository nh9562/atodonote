<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="session" value="${sessionScope.memDto}"/>
<!DOCTYPE html>
<c:if test="${empty session.uId || session.uId==''}">
	<script>
	    alert("잘못된 접근입니다. \n로그인 페이지로 이동합니다.");
	    location.href = "/";
	</script>
</c:if>
