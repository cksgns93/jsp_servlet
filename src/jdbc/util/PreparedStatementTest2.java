package jdbc.util;

import jdbc.util.*;
import java.sql.*;
import java.util.*;

public class PreparedStatementTest2 {
	public static void main(String[] args) 
	throws Exception{
		Scanner sc = new Scanner(System.in);
		System.out.println("������ �۹�ȣ �Է�=>");
		int idx = sc.nextInt();
		System.out.println("�ۼ���=>");
		String name=sc.next();
		sc.skip("\r\n");
		System.out.println("�޸� ����=>");
		String msg=sc.nextLine();
		System.out.println(idx+"/"+name+"/"+msg);
		
		Connection con = DBUtil.getCon();
		
		String sql = "UPDATE MEMO SET NAME=?, MSG=? WHERE IDX=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, msg);
		pstmt.setInt(3, idx);
		
		int cnt = pstmt.executeUpdate();
		System.out.println(cnt+" ���������� �����Ǿ����ϴ�.");
		
		pstmt.close();
		con.close();
	}
}
