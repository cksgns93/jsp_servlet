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
		//input.html에서 사용자가 입력한 값을 받아보자.
		//String getParameter("파라미터이름");
		
		String id = req.getParameter("userid");
		String pwd=req.getParameter("userPwd");
		
		//유효성 체크하기(null이거나 빈문자열일 경우 체크)
		if(id==null||pwd==null) {
			out.println("<script>");
			out.println("alert('잘못 들어온 경로');");
			out.println("location.href='input.html';");
			out.println("</script>");
		}
		if(id.trim().isEmpty()||pwd.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 입력해야 해요');");
			out.println("history.back()");
			out.println("</script>");
			return;
		}
		out.println("<h1>아이디:"+id+"</h1>");
		out.println("<h1>패스워드:"+pwd+"</h1>");
		out.close();
	}
}
