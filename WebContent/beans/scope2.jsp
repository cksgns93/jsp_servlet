<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.count.*" %>
<!-- scope2.jsp -->
<jsp:useBean id="cbean" class="beans.count.CountBean"
 scope="request"/>
<jsp:setProperty name="cbean"
 			property="count" param="count"  />
<h1>scope2.jsp</h1>
<h2 style="color:maroon">
<jsp:getProperty property="count" name="cbean"/>
</h2> 
<!--forward방식으로 result2.jsp로 이동(같은 request사용)
  -->
<jsp:forward page="result2.jsp"/>
 