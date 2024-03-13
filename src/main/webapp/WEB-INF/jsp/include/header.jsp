<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="bg-secondary d-flex align-items-center justify-content-between">
	<div class="display-4 ml-2" style="font-weight:bold">Memo</div>
	<c:if test="${not empty userId }">
		<div class="mr-4">${userName } <a href="/user/logout">로그아웃</a> </div>
	</c:if>
</header>