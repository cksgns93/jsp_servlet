<%@page contentType=" text/html; charset=UTF-8" %> <!-- directive -->
<!-- page directive -->
<h1>ex01.jsp</h1>
<!-- 1.HTML주석 : html영역에는 html주석을 달 수 있다. -->

<%
//scriptlet태그 : 이 안에는 자바 코드를 기술할 수 있다.
/*2.자바 주석 스크립트렛 태그 안에서는 자바 주석을 달 수 있다.*/
	for(int i =0;i<5;i++){		
%>
<h2 style='color:blue'>Hello JSP~~</h2>
<% 
	}
%>	
<hr color='red'>
<%
	for(int i=0;i<3;i++){
		out.println("<h1>안녕 JSP</h1>");//out : 내장객체 JspWriter타입의 스트림
	}
%>