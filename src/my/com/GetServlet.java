package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServlet
 */
@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		//input.html���� ����ڰ� �Է��� ���� �޾ƺ���.
		//String getParameter("�Ķ�����̸�");
		
		String id = req.getParameter("userid");
		String pwd=req.getParameter("userPwd");
		
		//��ȿ�� üũ�ϱ�(null�̰ų� ���ڿ��� ��� üũ)
		if(id==null||pwd==null) {
			out.println("<script>");
			out.println("alert('�߸� ���� ���');");
			out.println("location.href='input.html';");
			out.println("</script>");
		}
		if(id.trim().isEmpty()||pwd.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('���̵�� ��й�ȣ�� �Է��ؾ� �ؿ�');");
			out.println("history.back()");
			out.println("</script>");
			return;
		}
		out.println("<h1>���̵�:"+id+"</h1>");
		out.println("<h1>�н�����:"+pwd+"</h1>");
		out.close();
	}
}
