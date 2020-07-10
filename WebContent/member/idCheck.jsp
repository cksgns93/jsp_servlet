<%@page import="user.persistence.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<div class="container">
	<%
		//요청방식을 알아내보자
	String method = request.getMethod();
	out.println("method()" + method + "<br>");
	if (method.equalsIgnoreCase("GET")) {
		//get방식의 요청일 경우 => 아이디 입력 폼을 보여준다.
	%>
	<div class="row p-3">
		<div class="col-md-10 offset-md-1">
			<form name="idf" action="idCheck.jsp" method="POST">
				<label>아이디:</label> <input type="text" name="userid"
					class="form-control m-1" placeholder="User ID"
					autofocus="autofocus">
				<button class="btn btn-outline-primary m-1">확인</button>
			</form>
		</div>
	</div>
	<%
		} else {
		//post방식의 요청일 경우 => 아이디 사용 가능 여부를 알려준다.
		String userid = request.getParameter("userid");
		//out.println(userid);
	%>
	<jsp:useBean id="userDAO" class="user.persistence.UserDAO"
		scope="session" />
	<%
	boolean isUse = userDAO.idCheck(userid);
	if (isUse) {
		//아이디 사용
	%>
	<div class="row">
		<div class="col-md-10 offset-md-1">
			<h3>
				ID로 [<span style="font-weight: bold; color: red"><%=userid%></span>]을
				사용할 수 있습니다.
			</h3>
			<button class="btn btn-warning" onclick="setId('<%=userid%>')">닫기</button>
		</div>
	</div>
	<%
		} else {
		//아이디 사용 불가능(이미 있는 아이디)
	%>
	<div class="row">
		<div class="col-md-10 offset-md-1">
			<h3>
				ID로 [<span style="font-weight: bold; color: red"><%=userid%></span>]는
				이미 사용 중.
			</h3>
		</div>
	</div>
	<div class="row p-3">
		<div class="col-md-10 offset-md-1">
			<form name="idf" action="idCheck.jsp" method="POST">
				<label>아이디:</label> <input type="text" name="userid"
					class="form-control m-1" placeholder="User ID"
					autofocus="autofocus">
				<button class="btn btn-outline-primary m-1">확인</button>
			</form>
		</div>
	</div>
	<%
		}
	}
	%>
</div>
<script>
	var setId = function(id) {
		//alert(id);
		//부모창(opener==>window)의 userid텍스트 박스에 id값을 넣어주자
		opener.document.f.userid.value = id;
		opener.document.f.flag.value = true;
		//팝업창 닫기
		self.close();
	}
</script>
