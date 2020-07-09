package user.persistence;

import common.base.DAOBase;
import jdbc.util.DBUtil;
import user.domain.UserVO;
import java.sql.*;

public class UserDAO extends DAOBase{
	public int createUser(UserVO user) throws SQLException{
		try {
			con=DBUtil.getCon();
			//String => �Һ���(immutable) ���ڿ��� �����ϸ� ������ �״�εΰ� ���ο� ��ü�� �����.
			//���ڿ� �����̳� ������ �Ϸ��� StringBuffer�� StringBuilder�� �̿�
			//�� Ŭ�������� ���ڿ��� ���ۿ� �����Ͽ� ���۳����� ����, ����, ���� ���� ������ �����Ѵ�. 
			String sql="insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,1000,0)";
//			StringBuffer buf
//			= new StringBuffer("insert into member values(member_seq.nextval")
//			.append(",?,?,?,?,?,?,?,?,?,sysdate,").append("DEFAULT,DEFAULT)");
//			String sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getHp1());
			ps.setString(5, user.getHp2());
			ps.setString(6, user.getHp3());
			ps.setString(7, user.getPost());
			ps.setString(8, user.getAddr1());
			ps.setString(9, user.getAddr2());
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}
}
