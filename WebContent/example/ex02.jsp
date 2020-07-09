<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<h1>구구단</h1>
<%
	Date today= new Date();
	out.println("<h1>"+today.toString()+"</h1>");
%>
<h1 style='color:tomato'><%=today.toString()%></h1>
<%-- <%=%>출력식(expression) 변수나 메소드가 반환하는 값을 출력하고자 할 때 사용 --%>

<%! //선언문 (declaration) : 멤버변수를 선언하거나 사용자 정의 메소드를 만들때 사용
	String global="멤버변수";
	
	public String sum(int a, int b){
		return a+"+"+b+"="+(a+b);
	}
%>

<%
	String local ="지역변수"; //criptlet태그 안에서 변수를 선언하면 지역변수
%>
<h1>global: <%=global %></h1>
<h1>local: <%=local %></h1>

<h1>sum: <%=sum(3,4) %></h1>
<table style="border:1px solid">
<% 
	for(int i=1;i<=9;i++){
		out.println("<tr><td>"+8+"x"+i+"="+8*i+"</td></tr>");
	}
%>
</table>

