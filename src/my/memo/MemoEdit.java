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
 * Servlet implementation class MemoEdit
 */
@WebServlet("/MemoEdit")
public class MemoEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoDAO dao=new MemoDAO();
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//0. post����϶� �ѱ�ó��
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		//1.�۹�ȣ, �ۼ���, �۳��밪 �ޱ�
		String idx = req.getParameter("idx");//hidden data
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		System.out.println(idx+name+msg);
		//2.��ȿ�� üũ -> MemoList�� ����������
		if(idx==null||name==null||idx.trim().isEmpty()||name.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}

		//3. MemoDAO �����ؼ� updateMemo(MemoVO��ü) ȣ��
		MemoVO memo = new MemoVO(Integer.parseInt(idx),name,msg,null);
		try {
			int n=dao.updateMemo(memo);
			String str =(n>0)? "���� ����" : "���� ����";
			out.println("<script>");
			out.println("alert('"+str+"');");
			out.println("location.href='MemoList'");
			out.println("</script>");
		}catch(SQLException e) {
			
		}
		//4. �� ���� ����� ���� �޽��� �����ְ� ������ �̵�(MemoList)
	
	}

}
