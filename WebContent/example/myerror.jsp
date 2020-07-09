<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isErrorPage="true"%>
<%-- 에러를 처리할 페이지에서는 반드시 <%@ page isErrorPage="true"%> 를 주어야한다.--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myerror.jsp</title>
<style>
	.wrap{
		width:90%;
		margin:auto;
	}
	.err{
		width:70%;
		background-color: #efefef;
		color:red;
		height:250px;
		text-aligh:center;
		margin:auto;
		padding:10px;
	}
</style>
<meta name="dummy1" content="에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지"/>
<meta name="dummy2" content="에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지"/>
<meta name="dummy3" content="에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지"/>
<meta name="dummy4" content="에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지 에러페이지"/>

</head>
<body>
	<div class="wrap">
		<div class="err">
			<h1>Server error: <%=exception.getMessage()%></h1>
			<% exception.printStackTrace(); %>
		</div>
	</div>
</body>
</html>