<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookNaver" class="ajax.book.BookNaverProxy" scope="session"/>
<%
	String query=request.getParameter("query");
	if(query==null){
		query="Ajax";//기본 검색어
	}
	//시작 페이지
	String start=request.getParameter("start");
	if(start==null||start.trim().isEmpty()){
		start="1";//시작 페이지를 1페이지로 지정
	}
	String display="10"; //한 페이지당 보여줄 도서 갯수
	String sort="sim";//정렬방식 (sim또는 date)
	String data=bookNaver.getData(query,start,display,sort);
%>
<%=data%>