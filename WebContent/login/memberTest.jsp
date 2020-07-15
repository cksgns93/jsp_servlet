<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 체크 모듈 include (소스를 포함시킴)-->
<%@ include file="/login/loginCheck.jsp" %>
<!--  -->   
 
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>request의 주요 메소드</h1>
	<h2 class="text-info">회원들만 들어올 수 있는 페이지</h2>
	<h2 class="text-primary"><%=member.getName()%>[<%=member.getUserid() %>]님 환연합니다.</h2>
</div>
<jsp:include page="/foot.jsp"/>