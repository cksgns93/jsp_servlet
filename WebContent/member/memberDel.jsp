<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1.삭제할 회원번호 받아오기
	String idx = request.getParameter("idx");
	//2.유효성 체크
	if(idx==null||idx.trim().isEmpty()){
		%>
		<script>
			alert("잘못 들어온 경로");
			location.href="../index.jsp"
		</script>
		<%
		return;
	}
	//3.UserDAO빈 생성해서 deleteMember(회원번호) 호출
	//==> update문 이용해서 mstate를 -1로 변경한다.

	//4.실행결과 메시지 처리 및 페이지 이동
%>