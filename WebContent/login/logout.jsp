<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 처리 방법
	//1) 세션에서 특정 변수를 제거하는 방법
	session.removeAttribute("loginUser");
	//2) 세션에 저장된 모든 세션변수를 제거하는 방법 ==> 권장
	session.invalidate();
	
	response.sendRedirect("../index.jsp");
%>