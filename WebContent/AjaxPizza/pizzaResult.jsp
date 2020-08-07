<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, jdbc.util.*"%>

<% 
	//메모리에 캐시 사용하지 않도록
	response.setHeader("Cache-Control", "no-cache");
	//1.사용자 연락처 받기
	String phone=request.getParameter("phone");
	System.out.println(phone);
	
	Connection con =DBUtil.getCon();
	String sql = "select * from pizza_user where phone=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, phone);
	ResultSet rs = ps.executeQuery();
	String idx="0", name="", addr="";
	while(rs.next()){
		idx = rs.getInt("idx")+"";
		name=rs.getString("name");
		addr=rs.getString("addr");
	}
	rs.close();ps.close();con.close();
%>
<%=idx %>|<%=name %>|<%=addr %>
