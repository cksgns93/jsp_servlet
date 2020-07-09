<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>ex10_result.jsp</h1>
	<h1 class="text-danger">
		<%=request.getAttribute("msg") %>
	</h1>
</div>
<jsp:include page="/foot.jsp"/>