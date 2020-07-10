<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/example/myerror.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%--useBean액션을 이요해 객체를 생성--%>
<jsp:useBean id="user" class="user.domain.UserVO" scope="page"/>
<%--UserDAO user=new UserDAO()와 동일. useBean액션으로 객체를 생성할 때는 디폴트생성자를 호출한다.--%>
<jsp:setProperty name="user" property="*"/>
<%--
parameter 이름이 다르면 param="uname"을 추가해야한다.
따라서 input name과 Bean(자바객체)의 property명을 동일하게 주는 것이 좋다.
user.setName(request.getParameter("name")); 과 동일--%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<%
	int n =userDao.createUser(user);
	String msg=(n>0)? "회원가입 성공":"실패";
	String loc=(n>0)? "members.jsp":"javascript:history.back()";
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>