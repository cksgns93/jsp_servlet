<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.count.*" %>
<!-- scope.jsp -->
<%--빈의 scope를 page, session, application으로
변경하며 테스트 해보자. --%>
<jsp:useBean id="cbean" class="beans.count.CountBean"
 scope="application"/>
 <%-- 
	CountBean cbean=new CountBean();  과 동일
--%>
<jsp:setProperty name="cbean"
 			property="count" param="count"  />
 <%--
 	cbean.setCount(request.getParameter("count"));
 	
 	param속성에는 html의 input name을
 	property속성에는 빈즈의 프로퍼티명을 지정
 	둘다 동일하게 줬다면 property="*" 로 지정할 수 있다.
  --%>
<h1>scope.jsp</h1>
<h2 style="color:maroon">
<jsp:getProperty property="count" name="cbean"/>
<%-- <%=cbean.getCount()%>  과 동일 --%>
</h2> 
 <a href="javascript:history.back()">이전 페이지</a>|
 <a href="result.jsp">result.jsp로 가기</a>
 
 
 
 
 
 
 
 
 