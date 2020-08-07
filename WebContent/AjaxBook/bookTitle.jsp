<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,ajax.book.*"%>
<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	String publish = request.getParameter("publish");
	List<BookDTO> arr= bDao.getTitleList(publish);
%>
<select id="selTitle" name="selTitle" onchange="getBook(this.value)">
	<option value="">::도서목록::</option>
	<% 
		for(BookDTO b:arr){
	%>
		<option value="<%=b.getTitle()%>"><%=b.getTitle()%></option>
	<% 
		}
	%>
</select>