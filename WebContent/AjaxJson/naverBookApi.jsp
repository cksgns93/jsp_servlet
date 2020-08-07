<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="ajax.book.*"%>
<%
	String query= request.getParameter("query");
	if(query==null||query.trim().isEmpty()){
		query="Ajax";
	}
	BookNaverProxy proxy = new BookNaverProxy();
	String jsonData = proxy.getData(query);
%>
<%=jsonData%>