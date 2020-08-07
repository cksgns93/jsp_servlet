<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ajax.book.*" %>
<%
	String isbn =request.getParameter("isbn");
	System.out.println(isbn);
	BookDAO dao= new BookDAO();
	int n = dao.deleteBook(isbn); 
%>
<result>
<%=n %>
</result>