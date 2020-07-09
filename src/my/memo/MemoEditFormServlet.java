package my.memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemoEditFormServlet
 */
@WebServlet({ "/MemoEditFormServlet", "/MemoEditForm" })
public class MemoEditFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoDAO dao = new MemoDAO();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		//1.������ �۹�ȣ �ޱ�
		String idx=req.getParameter("idx");
		System.out.println(idx);
		//2.��ȿ�� üũ - MemoList�� ����������
		if(idx==null||idx.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		//3.MemoDao�� selectMemo(idx)==>��ȯŸ�� MemoVO����
		MemoDAO dao= new MemoDAO();
		MemoVO m=null;
		try {
			m = dao.selectMemo(Integer.parseInt(idx));
			if(m==null) {
				out.println("<script>");
				out.println("alert('�������� �ʴ� ���̿���')");
				out.println("history.go(-1)");
				out.println("</script>");
				return;
			}
			
		} catch (Exception e) {
			out.println("<h3 style='color:red'>���� ����: "+e+"</h3>");
			e.printStackTrace();
		}
		//4.input value������ �޾ƿ� �޸𳻿� ���� ����ϱ�
		out.println("<link rel='stylesheet' type='text/css' href='CSS/memo.css'>");
		out.println("<script src='js/memo.js'></script>");
		out.println("<div id='wrap'>");
		out.println("<form name='frm' action='MemoEdit' method='POST'>");
		out.println("<input type='hidden' name='idx' value='"+m.getIdx()+"'>");
		out.println("<table border=\"1\">");
		out.println("<tr><th colspan=\"2\"><h2>::���� �޸��� ����::</h2></th></tr>");
		out.println("<tr><td width=\"20%\"><b>�ۼ���</b></td>");
		out.println("<td width=\"80%\"><input type=\"text\" name=\"name\" value='"+m.getName()+"' placeholder=\"Name\" class=\"writer\"></td></tr>");
		out.println("<tr><td width=\"20%\"><b>�޸𳻿�</b></td><td width=\"80%\">");
		out.println("<input type=\"text\" name=\"msg\" value='"+m.getMsg()+"' placeholder=\"Message\" class=\"msg\"></td></tr>");
		out.println("<tr><td colspan=\"2\" style=\"text-align:center\">");
		out.println("<button type=\"button\" onclick=\"check()\">�ۼ����ϱ�</button>");
		out.println("<button type=\"reset\">�ٽþ���</button></td></tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</div>");
		out.close();
	}

}
