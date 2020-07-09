package jdbc.util;

import jdbc.util.*;
import java.sql.*;
import java.util.*;


public class EmpSelect {
	public static void main(String[] args) 
			throws Exception
	{
		Scanner sc = new Scanner(System.in);
		System.out.println("�˻��� ������� �Է��ϼ���=>");
		String name = sc.next();
		
		Connection con = DBUtil.getCon();
		String sql="select e.empno, e.ename, e.job, e.sal, e.comm, d.dname, d.loc\r\n" + 
				"from emp e left join dept d \r\n" + 
				"on e.deptno=d.deptno where e.ename=upper(?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		
		ResultSet rs = pstmt.executeQuery();
		System.out.println("���\t�����\t����\t�޿�\t���ʽ�\t����\t�ٹ���");
		while(rs.next()) {
			for(int i=1;i<=7;i++) {
				System.out.print(rs.getString(i)+"\t");
			}
			System.out.println();
		}
		
		rs.close();
		pstmt.close();
		con.close();
		System.out.println("����");
	}
}
