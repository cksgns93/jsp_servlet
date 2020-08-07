<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="book" class="ajax.book.BookDTO" scope="page"/>
<jsp:setProperty property="*" name="book"/>
<jsp:useBean id="dao" class="ajax.book.BookDAO" scope="session"/>
<%
	int n = dao.updateBook(book);
%>
<result>
	<%=n %>
</result>