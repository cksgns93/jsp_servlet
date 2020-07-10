<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,user.domain.*"%>
<jsp:include page="/top.jsp"/>
<!-- UserDAO빈을 useBean액션을 이용해서 생성 -->
<jsp:useBean id="userDAO" class="user.persistence.UserDAO" scope="session"/>

<div class="text-left p-5">
	<h1>User List [Admin Page]</h1>
	<table class="table table-striped mt-5">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>연락처</th>
			<th>회원상태</th>
			<th>수정|삭제</th>
		</tr>
		<!--  -->
		<% 
		List<UserVO> arr=userDAO.listMember();
		if(arr!=null){
			for(UserVO user:arr){
		%>
		<tr>
			<td><%=user.getIdx() %></td>		
			<td><%=user.getName() %></td>		
			<td><%=user.getUserid() %></td>		
			<td><%=user.getAllHp() %></td>		
			<td><%=(user.getMstate()==0)? "일반회원":(user.getMstate()==1) ? "정지회원":"탈퇴회원"%></td>		
			<td><a href="#" onclick="edit('<%=user.getIdx()%>')">수정</a>|<a href="javascript:del('<%=user.getIdx()%>')">삭제</a></td>		
		</tr>
		<!--  -->
		<%
			}	
		}
		%>
	</table>
</div>
<script type="text/javascript">
	var del=function(midx){
		var yn=confirm(midx+"번 회원 정보를 정말 삭제할까요?");
		if(yn){
			location.href="memberDel.jsp?idx="+midx; //get방식
		}
	}
	var edit=function(midx){
		alert(midx);
	}
</script>
<jsp:include page="/foot.jsp"/>