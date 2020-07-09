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
		
		//? 인 파라미터 값 셋팅
		pstmt.setString(1, "김개똥");
		pstmt.setString(2, "즐거운 하루");	
		
		//dml문장==> executeUpdate()
		int cnt = pstmt.executeUpdate();
		System.out.println(cnt+"개의 레코드가 삽입되었습니다.");
		pstmt.close();
		con.close();
	}
}
