<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,ajax.book.*,net.sf.json.*"%>
<%-- <%
	//객체유형
	JSONObject obj = new JSONObject();
	obj.put("isbn","112233");
	obj.put("title","JSON라이브러리 활용");
	obj.put("price","2000");
	obj.put("publish","정보문화사");
	obj.put("published","2020-07-30");
	obj.put("bimage","f.jpg");
	String str=obj.toString();
%> --%>

<%
	//배열유형
	JSONArray arr = new JSONArray();
	/*BookDTO b1 = new BookDTO("1122","책제목1","출판사1",25000,null,"a.jpg");
	BookDTO b2 = new BookDTO("2222","책제목2","출판사2",15000,null,"b.jpg");
	BookDTO b3 = new BookDTO("3322","책제목3","출판사3",35000,null,"c.jpg");
	arr.add(b1);
	arr.add(b2);
	arr.add(b3);*/
	
	
	BookDAO dao = new BookDAO();
	List<BookDTO> list = dao.getAllBook();
	for(BookDTO a : list){
		arr.add(a);
	}
	
	String str = arr.toString();
%>
<%=str %>


