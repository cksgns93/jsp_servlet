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
 * Servlet implementation class MemoEdit
 */
@WebServlet("/MemoEdit")
public class MemoEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoDAO dao=new MemoDAO();
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//0. post방식일때 한글처리
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		//1.글번호, 작성자, 글내용값 받기
		String idx = req.getParameter("idx");//hidden data
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		System.out.println(idx+name+msg);
		//2.유효성 체크 -> MemoList로 돌려보내기
		if(idx==null||name==null||idx.trim().isEmpty()||name.trim().isEmpty()) {
			res.sendRedirect("MemoList");
			return;
		}

		//3. MemoDAO 생성해서 updateMemo(MemoVO객체) 호출
		MemoVO memo = new MemoVO(Integer.parseInt(idx),name,msg,null);
		try {
			int n=dao.updateMemo(memo);
			String str =(n>0)? "수정 성공" : "수정 실패";
			out.println("<script>");
			out.println("alert('"+str+"');");
			out.println("location.href='MemoList'");
			out.println("</script>");
		}catch(SQLException e) {
			
		}
		//4. 그 실행 결과에 따라서 메시지 보여주고 페이지 이동(MemoList)
	
	}

}
