<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>request의 주요 메소드</h1>
<%
	String server=request.getServerName();
	int port=request.getServerPort();
	String url=request.getRequestURL().toString();
	String uri=request.getRequestURI();
	String query = request.getQueryString();
	//?name=a&userid=b 쿼리스트림
	String myctx=request.getContextPath(); //컨택스트명을 반환
	String cip=request.getRemoteAddr(); //클라이언트의 ip주소
	String protocol=request.getProtocol();
%>
	<h3>서버 도메인명 : <%=server %></h3>
	<h3>서버 포트번호 : <%=port %></h3>
	<h3>서버 url : <%=url %></h3>
	<h3>서버 uri : <%=uri %></h3>
	<h3>query : <%=query %></h3>
	<h3>myctx : <%=myctx %></h3>
	<h3>cip : <%=cip%></h3>
	<h3>protocol : <%=protocol %></h3>
<%
	//문제1 요청 URI 중에 MyWeb/eample/ex08_request.jsp
	//"/example/ex08_request.jsp"문자열만 추출
	String p1 = uri.substring(myctx.length());
	//문제2 /example/ex08_request문자열만 추출
	String p2=p1.replace(".jsp","");
%>
	<h3>p1 : <%=p1 %></h3>
	<h3>p2 : <%=p2 %></h3>
	<hr>
	<h1>request의 Header정보를 추출</h1>
<%
	java.util.Enumeration<String> en=request.getHeaderNames();
	while(en.hasMoreElements()){
		String headerName = en.nextElement();//헤더 이름
		String headerVal = request.getHeader(headerName);
		out.println("<h3>"+headerName+"/"+headerVal+"</h3>");
	}
		
	
%>
</div>
<jsp:include page="/foot.jsp"/>