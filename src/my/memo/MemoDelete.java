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
		//1.삭제할 글번호 받기
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out= res.getWriter();
		String idx = req.getParameter("idx");
		//2.유효성 체크(null,빈문자열) MemoList돌려보내기
		if(idx==null||idx.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		System.out.println(idx);
		//3.MemoDAO 생성해서 deleteMemo(idx) 호출하기
		try {
			int n=dao.deleteMemo(Integer.parseInt(idx));
			String str=(n>0) ? "삭제 성공":"삭제 실패";
			String loc="MemoList";
			out.println("<script>");
			out.println("alert('"+str+"');");
			out.println("location.href='"+loc+"'");
			out.println("</script>");
		} catch (Exception e) {
			out.println("<h3 style='color:red'>서버 에러:");
			out.println(e.getMessage()+"</h3>");
		}
		out.close();
		//4.실행 결과 메시지 처리 후 MemoList로 페이지 이동
		
	}


}
