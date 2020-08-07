<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,ajax.book.BookDTO"%>
<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	List<BookDTO> arr= bDao.getPublishList();
	//request.setAttribute("pubList", arr);
%>
<select id="pubSel" name="pubSel" onchange="bookInfoByPub(this.value)">
	<option value="">::출판사 목록::</option>
<% 
	for(BookDTO b:arr){
%>
	<option value="<%=b.getPublish()%>"><%=b.getPublish()%></option>
<% 
	}
%>
</select>