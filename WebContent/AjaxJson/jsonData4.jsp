<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, ajax.book.*"%>
<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	List<BookDTO> arr= bDao.getAllBook();
	out.println("[");
	if(arr!=null){
		for(int i=0;i<arr.size();i++){
			BookDTO b= arr.get(i);
			%>
			{
				"isbn":"<%=b.getIsbn()%>",
				"title":"<%=b.getTitle()%>",
				"publish":"<%=b.getPublish()%>",
				"price":"<%=b.getPrice()%>",
				"published":"<%=b.getPublished()%>",
				"bimage":"<%=b.getBimage()%>" 
			}
			<%
			if(i!=arr.size()-1){
				out.println(",");
			}
		}
	}
	out.println("]");
%>