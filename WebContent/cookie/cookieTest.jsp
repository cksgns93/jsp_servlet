<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>Cookie Test</h1>
<%
	//1 쿠키 생성
	Cookie ck1 = new Cookie("visitId","Swan");
	Date d= new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd_hh:mm:ss");
	String time = sdf.format(d);
		//key, value 형태로 저장
	Cookie ck2 = new Cookie("visitTime",time);
	
	//2 속성 설정 (expiry, path, domain)
	//유효시간 설정은 setMaxAge(초);
	//쿠키를 강제로 삭제하고자 한다면 setMaxAge(0)을 준다.
	
	ck1.setMaxAge(60*60*24*3); //3일간 유효
	ck2.setMaxAge(60*60*24*7); //7일간 유효
	
	//3 쿠키 전송
	response.addCookie(ck1);
	response.addCookie(ck2);
%>
	<h2>쿠키 저장 완료</h2>
	<h2><a href="cookieList.jsp">쿠키 목록 보러가기</a></h2>
</div>
<jsp:include page="/foot.jsp"/>