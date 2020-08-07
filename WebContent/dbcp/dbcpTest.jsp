<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.naming.*,java.sql.*,javax.sql.*"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>DBCP Test</h1>
<%
Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
//톰캣을 찾을 때는 java:comp/env
DataSource ds = (DataSource)envContext.lookup("jdbc/myshop");
Connection conn = ds.getConnection();

out.println("<h1>데이터 소스 룩업 성공: "+ds+"</h1>");
out.println("<h2>con: "+conn+"</h2>");
if(conn!=null) conn.close();
//커넥션 연결을 끊는 것이 아니라 커넥션풀레 반남을 함
%>
</div>
<jsp:include page="/foot.jsp"/>