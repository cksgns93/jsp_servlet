<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,ajax.book.*"%>

<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	//검색어 받기
	String keyword=request.getParameter("findKeyword");
	if(keyword!=null){
		keyword=keyword.trim();
	}
	List<BookDTO> arr= bDao.getFindBook(keyword);
	if(arr!=null){
		for(BookDTO b:arr){
			%>
			<li><a href="#books" onclick="setting('<%=b.getTitle()%>')"><%=b.getTitle()%></a></li>
			<%
		}
	}
%>