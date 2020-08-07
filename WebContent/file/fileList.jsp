<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.util.*,java.text.*"%>
<jsp:include page="/top.jsp"/>
<%
	String upDir=application.getRealPath("/upload");
	File dir= new File(upDir);
	//해당 디렉토리의 파일 목록 배열 얻어오기
%>
<div class="text-left p-5">
	<h1 class="text-center">업로드한 파일 목록</h1>
	<table class="table table-stiped">
		<tr class="bg-warning mt-3">
			<th>FILE/DIR</th>
			<th>파일명</th>
			<th>파일크기</th>
			<th>마지막수정일</th>
			<th>다운로드</th>
		</tr>
		<!-- 반복분 -->
		<%
		File [] flist = dir.listFiles();
		if(flist==null||flist.length==0){
			out.println("<tr><td colspan='5'>");
			out.println("데이터가 없습니다.</td></tr>");
		}else{
			for(int i=0;i<flist.length;i++) {
				String str=(flist[i].isDirectory())? "dir":"file";
				String fname=flist[i].getName();
				String size=flist[i].length()+"";
	//			System.out.print(flist[i].getAbsolutePath()+" ");
				long s =flist[i].lastModified();
				Date ls = new Date(s);
				SimpleDateFormat sdf
				=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String time = sdf.format(ls);
		%>
		<tr>
			<td><img src="../images/<%=str %>.jpg"></td>
			<td><%=fname %></td>
			<td><%=size %></td>
			<td><%=time %></td>
			<td><button class="btn btn-outline-info" onclick="fileDown('<%=fname%>')">다운로드</button></td>
		</tr>
		<%				
			}
		}
		%>
		<!-- ---- -->
	</table>
</div>
<!-- 파일 다운로드를 위한 폼 -->
<form action="../FileDown" id="df" name="df">
	<input type="text" name="fname" id="fname">
</form>
<script>
	function fileDown(fname){
		//alert(fname);
		$("#fname").val(fname);
		$("#df").submit();
	}
</script>
<jsp:include page="/foot.jsp"/>