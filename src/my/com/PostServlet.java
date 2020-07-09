package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out =res.getWriter();
		
		//0.POST����� ��� �ѱ� ó��
		req.setCharacterEncoding("UTF-8");
		//1.����ڰ� �Է��� ���̵�, ��й�ȣ �ޱ�
		String id = req.getParameter("userid");
		String pwd = req.getParameter("userPwd");
		//2.��ȿ�� üũ
		if(id==null||pwd==null||id.trim().isEmpty()||pwd.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('�߸� ���� ���');");
			out.println("</script>");
			res.sendRedirect("input2.html");
			return;
		}
		//3.���̵�,��й�ȣ �� ����ϱ�
		out.println("<h1>���̵�: "+id+"</h1>");
		out.println("<h1>��й�ȣ: "+pwd+"</h1>");
		out.close();
	}

}
