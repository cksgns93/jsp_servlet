<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page info="Copyright by chan" buffer="4kb" isThreadSafe="false" %>
<%@ page import = "java.util.*, java.text.*" %>
<%@ page errorPage="myerror.jsp" %>

<%
	//IE의 경우 브라우저 자체적으로 에러 처리를 하려고 함. 따라서 아래와 같이 기술
	response.setStatus(200);
%>
<h1>JSP에서 error처리 방법을 살펴봅시다.</h1>
<%
	Date d= new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String str = sdf.format(d);
%>

<h1><%=str%></h1>
<h2><%=this.getServletInfo() %></h2>
<%= 10/0%>