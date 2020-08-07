<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDao" class="ajax.book.BookDAO" scope="session"/>
<%
	String isbn=request.getParameter("isbn");
	ajax.book.BookDTO vo = bDao.getBookInfo(isbn);
	request.setAttribute("book", vo);
%>
<book>
	<isbn>${book.isbn}</isbn>
	<title>${book.title}</title>
	<price>${book.price}</price>
	<publish>${book.publish}</publish>
	<pubDate>${book.published}</pubDate>
	<bimage>${book.bimage}</bimage>
</book>
