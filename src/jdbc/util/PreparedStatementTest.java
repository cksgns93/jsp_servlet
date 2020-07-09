package jdbc.util;

import jdbc.util.*;
import java.sql.*;


public class PreparedStatementTest{
	public static void main(String[] args) throws SQLException{
		Connection con = DBUtil.getCon();
		System.out.println("con :"+con);
		String sql ="INSERT INTO memo(idx,name,msg,wdate)"
				+" VALUES(memo_seq.nextval, ?,?,sysdate)";
		//? : in parameter
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//? �� �Ķ���� �� ����
		pstmt.setString(1, "�谳��");
		pstmt.setString(2, "��ſ� �Ϸ�");	
		
		//dml����==> executeUpdate()
		int cnt = pstmt.executeUpdate();
		System.out.println(cnt+"���� ���ڵ尡 ���ԵǾ����ϴ�.");
		pstmt.close();
		con.close();
	}
}
