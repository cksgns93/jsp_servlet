<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<h1>form.jsp에서 사용자가 입력한 값을 받아봅시다</h1>
<h2>request내장객체를 이용한다. HttpServletRequest타입</h2>
<%-- 
	1)단일 값
	String getParameter(String paramName) : 사용자가 입력한 값을 반환한다.
	2)다중 값
	String [] getParameterValues(String paramName) : 사용자가 입력한 값을 배열로 반환한다.	
 --%>
<% 
	String name= request.getParameter("uname");
	String id=request.getParameter("userid");
	String pwd=request.getParameter("userpwd");
	
	//직업, 취미, 성별, 자기소개, 사용가능언어, hidden 값을 받아 출력
	String job=request.getParameter("job");
	String gender=request.getParameter("gender");
	String desc=request.getParameter("intro");
	String hidden=request.getParameter("secret");
		
	//언어, 취미
	String []lang=request.getParameterValues("lang");
	String []hobby=request.getParameterValues("hobby");
%>
<ul>
	<li class="list-group-item">이름 : <%=name %></li>
	<li class="list-group-item">아이디 : <%=id %></li>
	<li class="list-group-item">패스워드 : <%=pwd %></li>
	<li class="list-group-item">직업 : <%=job%></li>
	<li class="list-group-item">취미 : 
	<% if(hobby!=null){
			for(String hb:hobby){
				out.println(hb+",");
			}
		}
	%>
	</li>
	<li class="list-group-item">성별 : <%=gender%></li>
	<li class="list-group-item">소개: <%=desc %></li>
	<li class="list-group-item">언어: 
	<% if(lang!=null){
			for(String lan:lang){
				out.println(lan+",");
			}
		}
	%></li>
	<li class="list-group-item">히든 : <%=hidden %></li>
</ul>

<jsp:include page="/foot.jsp"/>