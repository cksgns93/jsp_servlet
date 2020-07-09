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
		//0.post방식일 경우 한글 처리
		req.setCharacterEncoding("UTF-8");
		
		//1.사용자가 입력한 값(name, msg)받기
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		//2.유효성 체크(null,빈문자열)
		if(name==null||msg==null) {
			res.sendRedirect("Memo/memo.html");
			return;
		}
		if(msg.trim().isEmpty()||name.trim().isEmpty()) {
			out.println("<script>");
			out.println("alert('잘못 들어온 경로');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		//3.MemoVO객체 생성해서 1번에서 받은 값 담아주기
		MemoVO memo = new MemoVO(0,name,msg,null);
		//4.MemoDAO생성해서 insertMemo()호출하기
		MemoDAO md = new MemoDAO();
		try {
			//5.그 실행 결과값(int) 받아서 브라우저에 출력
			int n =md.insertMemo(memo);
			String result = (n>0) ? "메모 등록 성공" : "메모 등록 실패";
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
