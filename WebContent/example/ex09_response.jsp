<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<div class="text-left p-5">
   <h1>response의 주요 메소드</h1>
   <%
   //1.아이디,비번 받기
      String id=request.getParameter("id");
      String pwd=request.getParameter("pwd");
   out.println(id+"/"+pwd);
   //2. 유효성 체크
   if(id==null||pwd==null){
      //form2.jsp통해서 들어오지 않은 경우
      response.sendRedirect("form2.jsp"); 
      //response.sendRedirect() => form2.jsp로 페이지 강제이동시킴
      return;
   }
   //빈문자열일 경우는 에러 출력(잘못된 요청이라는 에러를 출력한다.)
   if("".equals(id.trim())){
      response.sendError(HttpServletResponse.SC_BAD_REQUEST); //잘못된 요청 400
      return;
   }
   //아이디가 killer라면 에러출력 (접근 금지라는 에러 출력)
   if(id.equalsIgnoreCase("killer")){
      response.sendError(response.SC_FORBIDDEN); //접근금지 403
      return;
   }
   %>
   <h1 class="text-danger"><%=id %>님 환영합니다.</h1>
</div>

<jsp:include page="/foot.jsp" />