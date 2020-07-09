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
 * Servlet implementation class MemoInsertServlet
 */
@WebServlet("/MemoInsert")
public class MemoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		//0.post����� ��� �ѱ� ó��
		req.setCharacterEncoding("UTF-8");
		
		//1.����ڰ� �Է��� ��(name, msg)�ޱ�
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		//2.��ȿ�� üũ(null,���ڿ�)
		if(name==null||msg==null) {
			res.sendRedirect("Memo/memo.html");
			return;
		}
		if(msg.trim().isEmpty()||name.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('�߸� ���� ���');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		//3.MemoVO��ü �����ؼ� 1������ ���� �� ����ֱ�
		MemoVO memo = new MemoVO(0,name,msg,null);
		//4.MemoDAO�����ؼ� insertMemo()ȣ���ϱ�
		MemoDAO md = new MemoDAO();
		try {
			//5.�� ���� �����(int) �޾Ƽ� �������� ���
			int n =md.insertMemo(memo);
			String result = (n>0) ? "�޸� ��� ����" : "�޸� ��� ����";
			String loc=(n>0) ? "MemoList" : "Memo/memo.html";
			out.println("<script>");
			out.println("alert('"+result+"')");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		out.close();
	}
}
