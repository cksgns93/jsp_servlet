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
//		out.println("<a href='Memo/memo.html>[�۾���]</a>");
		out.println("<body>");
		out.println("<div id='wrap'>");
		out.println("<table border='1'>");
		out.println("<tr><th colspan='3'>::���� �޸��� �۸��::</th></tr>");
		out.println("<tr><td><b>�۹�ȣ</b></td>");
		out.println("<td width='70%'><b>�۳���</b></td>");
		out.println("<td><b>����/����</b></td>");
		out.println("</tr>");
		//----------------------
		//MemoDAO�����ؼ� listMemo()ȣ���Ͽ� List<MemoVO> �޾ƿͼ� �ݺ��� �����鼭 �޸� ���� ����ϱ�
		MemoDAO memo = new MemoDAO();
		try {
			List<MemoVO> arr = memo.listMemo();
			if(arr==null||arr.size()==0) {
				out.println("<tr><td colspan='3' style='color:red'><b>�����Ͱ� �����ϴ�.</b>");
				out.println("</td></tr>");
			}else {
				for(MemoVO m: arr) {
					out.println("<tr>");
					out.println("<td align='center'>"+m.getIdx()+"</td>");
					out.println("<td>"+m.getMsg()
					+"<br>[�ۼ���: "+m.getName()+"] �ۼ���: "+m.getWdate()+"</td>");
					out.println("<td align='center'><a href='MemoEditForm?idx="+m.getIdx()+"'>����</a>");
					out.println("<a href='MemoDelete?idx="+m.getIdx()+"'>����</a></td>");
					out.println("</tr>");
				}
			}			
		} catch (SQLException e) {
			out.println("<tr><td colspan='3' style='color:red'>");
			out.println("���� ����: "+e.getMessage());
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
