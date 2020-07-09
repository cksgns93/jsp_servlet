package my.com;

import java.io.IOException;
import java.util.*;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.memo.MemoDAO;
import my.memo.MemoVO;

/**
 * Servlet implementation class MemoListServlet
 */
@WebServlet("/MemoList")
public class MemoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req,res);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out=res.getWriter();
		out.println("<link rel='stylesheet' type='text/css' href='CSS/memo.css'>");
//		out.println("<a href='Memo/memo.html>[글쓰기]</a>");
		out.println("<body>");
		out.println("<div id='wrap'>");
		out.println("<table border='1'>");
		out.println("<tr><th colspan='3'>::한줄 메모장 글목록::</th></tr>");
		out.println("<tr><td><b>글번호</b></td>");
		out.println("<td width='70%'><b>글내용</b></td>");
		out.println("<td><b>수정/삭제</b></td>");
		out.println("</tr>");
		//----------------------
		//MemoDAO생성해서 listMemo()호출하여 List<MemoVO> 받아와서 반복문 돌리면서 메모 내용 출력하기
		MemoDAO memo = new MemoDAO();
		try {
			List<MemoVO> arr = memo.listMemo();
			if(arr==null||arr.size()==0) {
				out.println("<tr><td colspan='3' style='color:red'><b>데이터가 없습니다.</b>");
				out.println("</td></tr>");
			}else {
				for(MemoVO m: arr) {
					out.println("<tr>");
					out.println("<td align='center'>"+m.getIdx()+"</td>");
					out.println("<td>"+m.getMsg()
					+"<br>[작성자: "+m.getName()+"] 작성일: "+m.getWdate()+"</td>");
					out.println("<td align='center'><a href='MemoEditForm?idx="+m.getIdx()+"'>수정</a>");
					out.println("<a href='MemoDelete?idx="+m.getIdx()+"'>삭제</a></td>");
					out.println("</tr>");
				}
			}			
		} catch (SQLException e) {
			out.println("<tr><td colspan='3' style='color:red'>");
			out.println("서버 에러: "+e.getMessage());
			out.println("</td></tr>");
			e.printStackTrace();
		}
				
		out.println("</table>");
		out.println("</div>");
		out.println("</body>");
		out.close();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		process(req,res);
	}

}
