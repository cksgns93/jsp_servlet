<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1>파일 업로드 결과</h1>
	<h2>전송되는 데이터 형태를 브라우저 화면에 그대로 출력</h2>
<%
	String ctype=request.getContentType();
	int len = request.getContentLength();//첨부파일 크기
	//long len=request.getContentlongLength()
%>
	<h3>ContentType : <%=ctype %></h3>
	<h3>ContentLength: <%=len %></h3>
	<hr>
<%
	//request body에 포함되어 오는 파일 데이터를 스트림을 연결해 읽어들인 후 브라우저에 출력해보자.
	ServletInputStream in = request.getInputStream();
	byte[] data=new byte[1024];
	int n=0, count=0;
	out.println("<xmp>");
	while((n=in.read(data))!=-1){
		String str = new String(data,0,n);
		out.println(str);
		count+=n;
	}
	out.println("</xmp>");
	System.out.println("count="+count);
	in.close();
%>
</div>
<jsp:include page="/foot.jsp"/>