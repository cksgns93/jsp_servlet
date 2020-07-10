<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.domain.*, user.persistence.*"%>
<%
	//0.post방식일 때의 한글 처리
	request.setCharacterEncoding("UTF-8");
	//1.사용자가 입력한 값 받기(이름,아이디,비번,연락처,우편번호,주소..)
	String name = request.getParameter("name");
	String id = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String post = request.getParameter("post");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	//2.유효성 체크(이름,아이디,비번)
	if(name==null||id==null||pwd==null||name.trim().isEmpty()||id.trim().isEmpty()||pwd.trim().isEmpty()){
		response.sendRedirect("signup.jsp");
		return;
	}
	//3.UserVO객체 생성해서 1번 값 넣기
	UserVO user = new UserVO(0,name,id,pwd,hp1,hp2,hp3,post,addr1,addr2,null,1000,0);
	//4.UserDAO객체 생성해서 createUser()호출
	UserDAO dao = new UserDAO();
	int n = dao.createUser(user);
	//5.실행결과 메시지 보여주고 페이지 이동시키기
	String msg=(n>0)? "회원가입 성공":"회원가입 실패";
	String loc=(n>0)? "members.jsp":"javascript:history.back()";
%>
<script>
alert('<%=msg%>');
location.href='<%=loc%>';
</script>