<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ajax.book.*,java.util.*,java.text.*" %>
<table class="table table-condensed table-striped">
<%
	String title=request.getParameter("title");
	List<BookDTO> arr=null;
	BookDAO dao = new BookDAO();
	if(title==null){
		arr =dao.getAllBook();//모든 도서정보 가져오기		
	}else{
		//검색한 도서정보 가져오기
		arr=dao.getFindBook(title);
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df =new DecimalFormat("###,###");
	if(arr!=null){
		for(BookDTO b:arr){
		%>
			<tr>
				<td width="20%"><%=b.getTitle() %></td>
				<td width="20%"><%=b.getPublish() %></td>
				<td width="20%"><%=df.format(b.getPrice())%></td>
				<td width="20%"><%=sdf.format(b.getPublished()) %></td>
				<td width="20%"><a href="#book_info" onclick="goEdit('<%=b.getIsbn()%>')">수정</a>|<a href="#book_data" onclick="goDel('<%=b.getIsbn()%>')">삭제</a></td>
			</tr>
		<%
		}
	}else{
		out.println("<tr><td colspan='5'>");
		out.println("데이터가 없습니다.</td></tr>");
	}
%>
</table>