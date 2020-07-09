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
 * Servlet은 web.xml에 등록해야 서비스된다.
 * web.xml에 등록하는 대신에 어노테이션을 이용하면 좀 더 간편하게 서블릿을 이용할 수 있다.
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
		out.println("<h1>안녕 MyWeb</h1>");
		out.close();
	}

}
