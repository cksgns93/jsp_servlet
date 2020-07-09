package jdbc.util;

import jdbc.util.*;
import java.sql.*;
import java.util.*;

public class PreparedStatementTest2 {
	public static void main(String[] args) 
	throws Exception{
		Scanner sc = new Scanner(System.in);
		System.out.println("수정할 글번호 입력=>");
		int idx = sc.nextInt();
		System.out.println("작성자=>");
		String name=sc.next();
		sc.skip("\r\n");
		System.out.println("메모 내용=>");
		String msg=sc.nextLine();
		System.out.println(idx+"/"+name+"/"+msg);
		
		Connection con = DBUtil.getCon();
		
		String sql = "UPDATE MEMO SET NAME=?, MSG=? WHERE IDX=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, msg);
		pstmt.setInt(3, idx);
		
		int cnt = pstmt.executeUpdate();
		System.out.println(cnt+" 정상적으로 수정되었습니다.");
		
		pstmt.close();
		con.close();
	}
}
