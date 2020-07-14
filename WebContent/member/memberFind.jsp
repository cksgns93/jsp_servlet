<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,user.domain.*,java.net.*"%>
<jsp:include page="/top.jsp"/>

<% 
	//0. 검색유형과 검색어 받아오기
	String findType=request.getParameter("findType");
	String findKeyword=request.getParameter("findKeyword");
	
	//1.현재 보여줄 페이지 파라미터 값을 받자.
	String cpStr=request.getParameter("cpage");
	if(cpStr==null) cpStr="1"; //기본적으로 보여줄 페이지를 1페이지로 지정
	int cpage = Integer.parseInt(cpStr.trim());
	if(cpage<=0){//음수나 0일 경우는 1페이지로 지정
		cpage=1;
	}
	if(findType==null||findType.trim().isEmpty()){
		response.sendRedirect("members.jsp");
		return;
	}
%>


<!-- UserDAO빈을 useBean액션을 이용해서 생성 -->
<jsp:useBean id="userDAO" class="user.persistence.UserDAO" scope="session"/>

<div class="text-left p-5">
	<div class="row">
		<div class="col-md-12">
			<h1>User 검색 결과 [<%=findKeyword %>]</h1>
		</div>
	</div>
	<!-- 검색 폼 시작 -->
	<form name="sf" id="sf" action="memberFind.jsp">
	<div class="row mt-3">
		<div class="col-md-2">
			<select class="form-control" name="findType">
				<option value="">::검색 유형::</option>
				<option value="1">회원이름</option>
				<option value="2">아이디</option>
				<option value="3">연락처</option>
			</select>
		</div>
		<div class="col-md-7">
			<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" class="form-control">
		</div>
		<div class="col-md-2">
			<button type="button" onclick="search()"class="btn btn-info">검색</button>
		</div>
	</div>
	</form>
	<div class="row">
		<div class="col-md-12">
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
		//검색한 회원 수 가져오기 
		int totalCount = userDAO.getFindTotalUserCount(findType,findKeyword); //총 회원수
		int pageSize = 5; //한 페이지 당 보여줄 목록 갯수
		int pageCount = 1;
		if(totalCount>=0){
			pageCount = (totalCount-1)/pageSize + 1;	
		}
		if(cpage>pageCount){
			cpage=pageCount;
		}
		
		//DB에서 끊어오기 위한 시작값과 끝값을 계산하자.
		int end = cpage*pageSize;
		int start = end-(pageSize-1);
		
		List<UserVO> arr=userDAO.findMember(findType, findKeyword, start, end);
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
		<tr>
			<td colspan="4" class="text-center">
			<ul class="pagination justify-content-center">
			<% for(int i=1;i<=pageCount;i++){
				String str="&findType="+findType+"&findKeyword="+URLEncoder.encode(findKeyword,"UTF-8");
			%>
				<li class="page-item <%=(i==cpage)?"active":"" %>"><a class="page-link"href="memberFind.jsp?cpage=<%=i%><%=str%>"><%=i %></a></li>
			<% }%>
			</ul>
			</td><td colspan="2"><b>총 회원수: <span class="text-danger"><%=totalCount %></span></b></td>
		</tr>
	</table>
		</div>
	</div>
	<!--삭제/수정 관련 폼-->
	<form name="frm" method="POST">
		<input type="hidden" name="idx" id="idx">
	</form>
</div>
<script type="text/javascript">
	var search=function(){
		if(!sf.findType.value){
			alert("검색 유형 선택");
			sf.findType.focus();
			return;
		}
		if(!sf.findKeyword.value){
			alert('검색어를 입력하세요');
			sf.findKeyword.focus();
			return;
		}
		sf.submit();
	}
	
	var del=function(midx){
		var yn=confirm(midx+"번 회원 정보를 정말 삭제할까요?");
		if(yn){
			location.href="memberDel.jsp?idx="+midx; //get방식
			frm.idx.value=midx;
			frm.action="memberDel.jsp";
			frm.metho="POST";
			frm.submit();
		}
	}
	var edit=function(midx){
		$("#idx").val(midx);
		$('form[name="frm"]').prop("method","POST")
							 .prop("action","memberEdit.jsp")
							 .submit();
	}
</script>
<jsp:include page="/foot.jsp"/>