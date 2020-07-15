<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>session에 저장된 모든 정보를 꺼내봅시다.</h1>
	<h2 class="text-danger">JSESSIONID: <%=session.getId() %></h2>
	<%
		//session : HttpSession타입의 내장객체
		/*서블릿에서 세션을 얻으려면
			HttpSession session = request.getSession();
		*/
		Enumeration <String> en = session.getAttributeNames();
		//세션의 키값들만 반환함
		while(en.hasMoreElements()){
			String key=en.nextElement();
			Object val=session.getAttribute(key);
			%>
			<h2><%=key %> : <%=val %></h2>
			<%
		}
	
	%>
</div>
<jsp:include page="/foot.jsp"/>