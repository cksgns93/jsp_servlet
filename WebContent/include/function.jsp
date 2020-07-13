<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	사용자 정의 메소드 모아두는 페이지
	- 사용자 정의 메소드는 선언문 <%! %>dptj rngusgksek.
	- 선언문에서는 내장객체 (ex, out, request, response, session등)를 사용할 수 없다.	
	   내장객체들은 스크립트렛(<%%>) 태그 안에서 선언된 지역변수 이므로 사용 불가
--%>
<%!
	//선언문(declaration)
	public void goUrl(String msg, String loc, JspWriter jw) throws Exception{
		jw.println("<script>");
		jw.println("alert('"+msg+"')");
		jw.println("location.href='"+loc+"'");
		jw.println("</script>");
	}
	public void goBack(String msg, JspWriter jw) throws Exception{
		jw.println("<script>");
		jw.println("alert('"+msg+"')");
		jw.println("history.back()");
		jw.println("</script>");
	}
%>