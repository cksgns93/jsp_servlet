package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 1)
 * Servlet�� web.xml�� ����ؾ� ���񽺵ȴ�.
 * web.xml�� ����ϴ� ��ſ� ������̼��� �̿��ϸ� �� �� �����ϰ� ������ �̿��� �� �ִ�.
 * 2)
 * @WebServlet("/url-pattern")
 */
@WebServlet({ "/helloServlet", "/bbb" })
public class helloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<h1>Hello MyWeb Context</h1>");
		out.println("<h1>�ȳ� MyWeb</h1>");
		out.close();
	}

}
