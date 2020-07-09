<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<h1>form 양식</h1>
  <!-- form 태그는 서버쪽으로 데이터를 전송하고자 할 때 사용한다.	
		- form 태그의 속성
			1)action : 폼 데이터를 처리해줄 서버 페이지를 기술하낟.
			2)method : 데이터 전송방식을 기술한다.
						주로 get 아니면 post 기술
						get : 간단한 데이터를 전송할 때
						post : 파일업로드 등 대용량의 데이터를 전송할 때 사용
  -->
  <form name ="frm" action="ex07_request.jsp" method="get">
  	이름 : <input type = "text" name="uname"><br>
  	아이디 : <input type = "text" name="userid">	<span>*아이디는 영문,숫자 4자리이상 8자리 이하</span>
	<br>

  	비밀번호 : <input type = "password" name="userpwd"><br>
	첨부파일: <input type= "file" name="myfile"><br>
	취미 : <input type = "checkbox" name="hobby" value="music">음악감상
	<input type = "checkbox" name="hobby" value="movie" checked="checked">영화감상
	<input type = "checkbox" name="hobby" value="reading">독서
	<br>
	성별 : <input type="radio" name= "gender" value="Male" checked="checked">남자
		<input type="radio" name= "gender" value="Female">여자
	<input>
	<select name="job" size="1">
		<option value = "designer">디자이너</option>
		<option value = "developer">개발자</option>
		<option value = "operator">운영자</option>
	</select>
	<br>
	사용가능 언어
	<select name="lang" multiple size="3">
		<option value = "java">Java</option>
		<option value = "html">HTML</option>
		<option value = "jsp">Jsp</option>
		<option value = "c">C</option>
		<option value = "c++">C++</option>
	</select>
	</br>
  	<textarea name="intro" rows="7" cols="40"></textarea>
	<br>
	히든필드 : 
	<input type = "hidden" name="secret" value="Top Secret">
	<input type = "submit" value="회원가입"><br>
	<input type="reset" value ="다시쓰기"><br>
	<br>
  </form>
<jsp:include page="/foot.jsp"/>