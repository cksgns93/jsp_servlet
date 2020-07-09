<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="width:90%;margin:auto">
<h1>구구단 전체를 테이블 형태로 만들기</h1>
<table>

<% 
	for(int i=1;i<=9;i++){
		out.println("<tr>");
		for(int j=1;j<=9;j++){
			out.println("<td>");
			out.println(j+"x"+i+"="+i*j);
			out.println("</td>");
		}
		out.println("</tr>");
	}
%>


</table>
</div>
