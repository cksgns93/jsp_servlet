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
		
		//0.POST방식일 경우 한글 처리
		req.setCharacterEncoding("UTF-8");
		//1.사용자가 입력한 아이디, 비밀번호 받기
		String id = req.getParameter("userid");
		String pwd = req.getParameter("userPwd");
		//2.유효성 체크
		if(id==null||pwd==null||id.trim().isEmpty()||pwd.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('잘못 들어온 경로');");
			out.println("</script>");
			res.sendRedirect("input2.html");
			return;
		}
		//3.아이디,비밀번호 값 출력하기
		out.println("<h1>아이디: "+id+"</h1>");
		out.println("<h1>비밀번호: "+pwd+"</h1>");
		out.close();
	}

}
