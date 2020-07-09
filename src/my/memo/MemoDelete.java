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
 * Servlet implementation class MemoDelete
 */
@WebServlet("/MemoDelete")
public class MemoDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    MemoDAO dao = new MemoDAO();
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1.������ �۹�ȣ �ޱ�
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out= res.getWriter();
		String idx = req.getParameter("idx");
		//2.��ȿ�� üũ(null,���ڿ�) MemoList����������
		if(idx==null||idx.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		System.out.println(idx);
		//3.MemoDAO �����ؼ� deleteMemo(idx) ȣ���ϱ�
		try {
			int n=dao.deleteMemo(Integer.parseInt(idx));
			String str=(n>0) ? "���� ����":"���� ����";
			String loc="MemoList";
			out.println("<script>");
			out.println("alert('"+str+"');");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		} catch (Exception e) {
			out.println("<h3 style='color:red'>���� ����:");
			out.println(e.getMessage()+"</h3>");
		}
		out.close();
		//4.���� ��� �޽��� ó�� �� MemoList�� ������ �̵�
		
	}


}
