<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.domain.*" %>
<%-- 로그인 여부를 체크하는 모듈. 회원들만 사용하는 페이지에 이 모듈을 include한다.--%>
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
	if(member.getMstate()==1){
		%>
		<script>
			alert("정지 회원입니다. 일반회원으로 전환해야 이용가능.\n회원정보를 수정하세요");
			location.href="<%=ctdx %>/member/mypage.jsp";
		</script>
		<%
	}
%>