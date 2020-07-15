<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.domain.*"%>

<!-- 예외 발생시 예외 처리함 -->
<%@ page errorPage="/error/errorAlert.jsp" %>
<%@ include file="/include/function.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	if(userid==null||pwd==null||userid.trim().isEmpty()||pwd.trim().isEmpty()){
		goUrl("잘못 들어온 경로 입니다.","../index.jsp",out);
		return;
	}
	//out.println(userid+"/"+pwd);
%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<%
	UserVO loginUser=userDao.loginCheck(userid,pwd);
	/*
		1) 아이디와 비밀번호가 일치하면 해당 회원정보를 DB에서 가져와서 UserVO에 담아서 반환해줌
		2) 불일치 하면 사용자 정의 예외 (NotUserException)를 발생시킴
	*/
	if(loginUser!=null){
		//out.println("<h1>로그인 성공</h1>");
		//회원 인증을 받았다면 인증받은 회원정보를 session에 저장한다.
		
		session.setAttribute("loginUser", loginUser);
		
		response.sendRedirect("../index.jsp");
		return;
	}
%>