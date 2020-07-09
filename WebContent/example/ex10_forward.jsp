<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	out.println(id+"/"+pwd);
	
	//1) id가 redirect이면 redirect방식으로 페이지 이동 ex10_result.jsp
	//2) id가 forward이면 forward방시으로 페이지 이동 ex10_result.jsp
	if(id.equals("redirect")){
		request.setAttribute("msg", "hello jsp");
		response.sendRedirect("ex10_result.jsp");
		return;
	}else if(id.equals("forward")){
		//forward이동은 jsp에서는 forward액션을 이용
		request.setAttribute("msg", "hello jsp");
		%>
		<jsp:forward page="ex10_result.jsp"/>
		<%
	}else{
		out.println("<h1>"+id+"님 환영합니다.</h1>");
	}
%>