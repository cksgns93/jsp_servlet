<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,ajax.book.*,net.sf.json.*"%>
<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	List<BookDTO> arr = bDao.getAllBook();
	JSONArray jsonArr = JSONArray.fromObject(arr);
	String str = jsonArr.toString();
%>
<%=str %>