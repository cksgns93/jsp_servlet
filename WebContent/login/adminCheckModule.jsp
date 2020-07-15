<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.domain.*" %>
<%-- 로그인 여부를 체크하는 모듈. 회원들만 사용하는 페이지에 이 모듈을 include한다.--%>
<%-- <%@ include file="/login/loginCheck.jsp" %>--%>
<%
	UserVO member = (UserVO)session.getAttribute("loginUser");
	String ctdx = request.getContextPath(); // -> /MyWeb
	if(member==null){
		%>
		<script>
			alert("로그인해야 이용할 수 있음");
			location.href="<%=ctdx %>/login/signin.jsp";
		</script>
		<%
		return;
	}
	if(member.getMstate()!=2){
		%>
		<script>
			alert("관리자가 아님");
			location.href="<%=ctdx %>/index.jsp";
		</script>
		<%
	}                          
%>
<h1>관리자 페이지</h1>