<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 소스를 포함시키는 방식으로 function.jsp를 포함시킨다. -->
<%@ include file="/include/function.jsp" %>
<%
	//1.삭제할 회원번호 받아오기
	String idx = request.getParameter("idx");
	//2.유효성 체크
	if(idx==null||idx.trim().isEmpty()){
		goUrl("잘못 들어온 경로입니다.","../index.jsp",out);
		%>
		<!--  <script>
			alert("잘못 들어온 경로");
			location.href="../index.jsp"
		</script>
		-->
		<%
		return;
	}
	//3.UserDAO빈 생성해서 deleteMember(회원번호) 호출
	//==> update문 이용해서 mstate를 -1로 변경한다.
	//4.실행결과 메시지 처리 및 페이지 이동
%>
<jsp:useBean id="userDao" class="user.persistence.UserDAO" scope="session"/>
<%
	int n = userDao.deleteMember(idx);
	String msg = (n>0)? "회원정보 삭제 성공":"삭제 실패";
	String loc = "members.jsp";
	goUrl(msg,loc,out);
%>
<%-- <script>
	alert('<%=msg%>');
	location.href="<%=loc%>";
</script> --%>