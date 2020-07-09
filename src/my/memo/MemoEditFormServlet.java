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
 * Servlet implementation class MemoEditFormServlet
 */
@WebServlet({ "/MemoEditFormServlet", "/MemoEditForm" })
public class MemoEditFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoDAO dao = new MemoDAO();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		//1.수정할 글번호 받기
		String idx=req.getParameter("idx");
		System.out.println(idx);
		//2.유효성 체크 - MemoList로 돌려보내기
		if(idx==null||idx.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}
		//3.MemoDao의 selectMemo(idx)==>반환타입 MemoVO유형
		MemoDAO dao= new MemoDAO();
		MemoVO m=null;
		try {
			m = dao.selectMemo(Integer.parseInt(idx));
			if(m==null) {
				out.println("<script>");
				out.println("alert('존재하지 않는 글이에요')");
				out.println("history.go(-1)");
				out.println("</script>");
				return;
			}
			
		} catch (Exception e) {
			out.println("<h3 style='color:red'>서버 에러: "+e+"</h3>");
			e.printStackTrace();
		}
		//4.input value값으로 받아온 메모내용 값을 출력하기
		out.println("<link rel='stylesheet' type='text/css' href='CSS/memo.css'>");
		out.println("<script src='js/memo.js'></script>");
		out.println("<div id='wrap'>");
		out.println("<form name='frm' action='MemoEdit' method='POST'>");
		out.println("<input type='hidden' name='idx' value='"+m.getIdx()+"'>");
		out.println("<table border=\"1\">");
		out.println("<tr><th colspan=\"2\"><h2>::한줄 메모장 수정::</h2></th></tr>");
		out.println("<tr><td width=\"20%\"><b>작성자</b></td>");
		out.println("<td width=\"80%\"><input type=\"text\" name=\"name\" value='"+m.getName()+"' placeholder=\"Name\" class=\"writer\"></td></tr>");
		out.println("<tr><td width=\"20%\"><b>메모내용</b></td><td width=\"80%\">");
		out.println("<input type=\"text\" name=\"msg\" value='"+m.getMsg()+"' placeholder=\"Message\" class=\"msg\"></td></tr>");
		out.println("<tr><td colspan=\"2\" style=\"text-align:center\">");
		out.println("<button type=\"button\" onclick=\"check()\">글수정하기</button>");
		out.println("<button type=\"reset\">다시쓰기</button></td></tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</div>");
		out.close();
	}

}
