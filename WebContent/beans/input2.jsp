<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- input.jsp -->
<jsp:include page="/top.jsp" />
<div align="center">
	<hr color="green" width="400">
	<h1>CountBean Test2 [request scope테스트 전용]</h1>
	<hr color="green" width="400">
	<form action="scope2.jsp">
		<b>Count</b> : 
		<input type="text" name="count" class="box">
		<button>전송</button>
	</form>
</div>

<jsp:include page="/foot.jsp" />
	
