<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.*, com.oreilly.servlet.*"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>MultipartRequest를 이용한 파일 업로드</h1>
<%
	//String upDir="C:\\myjava\\workspace\\MyWeb\\WebContent\\upload";
	// /MyWeb/upload/==> 절대경로를 얻어오자. application 내장객체를 이용 ServletContext 타입
	// ServletContext application = request.getServletContext();
	// session.getServletContext()
	String upDir=application.getRealPath("/upload");
	//컨텍스트를 기준으로 /upload디렉토리의 절대경로를 반환한다.
	// upDir ==> /MyWeb/upload
	System.out.println(upDir);
	//이클립스의 경우 다음과 같이 나온다.
	//C:\\myjava\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MyWeb\\upload
	MultipartRequest mr=null;
	try{
		DefaultFileRenamePolicy df= new DefaultFileRenamePolicy();
		mr= new MultipartRequest(request,upDir,10*1024*1024,"UTF-8",df);
		//최대 업로드 용량 : 10M => 이를 초과하면 IOException이 발생함
		out.println("<h2 class='text-success'>업로드 성공<h2>");
		out.println(upDir+"<br>");
		//1.파라미터값 얻기
		//String name=request.getParameter("name")[X]
		String name=mr.getParameter("name");
		
		//2.업로드한 파일면 얻어오기
		//String filename=mr.getParameter("filename");[X]
		String filename = mr.getFilesystemName("filename");
		//원본파일명
		String originfilename = mr.getOriginalFileName("filename");
		//첨부파일 크기
		java.io.File f= mr.getFile("filename");
		long fsize=0;
		if(f!=null){
			fsize=f.length();
		}
		//첨부파일의 컨텐트 타입
		String ctype = mr.getContentType("filename");
		
		out.println("<h2>올린이: "+name+"</h2>");
		out.println("<h2>첨부파일명: "+filename+"</h2>");
		out.println("<h2>원본파일명: "+originfilename+"</h2>");
		out.println("<h2>파일크기: "+fsize+"bytes</h2>");
		out.println("<h2>파일 컨텐트 타입: "+ctype+"</h2>");
		
		if(ctype.equals("image/png")||ctype.equals("images/jpg")||ctype.equals("image/gif")||ctype.equals("image/jpeg")){
			%>
			<img src="<%=request.getContextPath()%>/upload/<%=filename%>">
			<%
		}
		%>
		<h1><a href="fileList.jsp">파일 목록 보러가기</a></h1>		
		<%
	}catch(java.io.IOException e){
		out.println("<h2 class='text-danger'>파일 업로드 실패</h2>");
		//파일 용량 초과 or enctype이 multipart/form-data가 아닐 때 예외 발생함
		e.printStackTrace();
	}
%>
	
</div>
<jsp:include page="/foot.jsp"/>