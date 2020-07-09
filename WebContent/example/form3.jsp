<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<div class="text-left p-5">
   <h1>페이지 이동방식</h1>
   
   <form name="f" action="ex10_forward.jsp">
      <label for="id">아이디</label>
      <input type="text" name="id" id="id" placeholder="ID" class="form-control">
      <label for="pwd">비밀번호</label>
      <input type="password" name="pwd" id="pwd" placeholder="Password" class="form-control">
      <button class="btn btn-success" style="margin:10px">로그인</button>
   </form>
</div>

<jsp:include page="/foot.jsp" />