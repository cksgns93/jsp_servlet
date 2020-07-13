<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberEditEnd.jsp -->
<%--
1. post방식일 때 한글 처리
2. UserVO빈을 생성해서, html에서 입력한 값을 자동으로 setting 하기
3. 유효성체크 (아이디, 이름, 비번)
4. UserDAO빈 생성해서 updateUser(UserVO객체)
5. 실행 결과 메시지 보여주고 페이지 이동
--%>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.domain.UserVO" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%
	if(user.getUserid()==null||user.getName()==null||user.getPwd()==null){
		out.println("<script>");
		out.println("alert('다시 확인')");
		out.println("</script>");
		response.sendRedirect("../index.jsp");
		return;
	}
%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<%
	int n =userDao.updateUser(user);
	String msg =(n>0)? "성공":"실패";
	String loc=(n>0)?"members.jsp":"javascript:history.back()";
%>
<%@ include file="/include/function.jsp" %>
<% 
	goUrl(msg,loc,out);
%>