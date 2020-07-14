package user.persistence;

import common.base.DAOBase;
import jdbc.util.DBUtil;
import user.domain.UserVO;
import java.sql.*;
import java.util.*;
public class UserDAO extends DAOBase{
	
	public UserDAO() {
		System.out.println("UserDAO ����");
	}
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
	/*��� ȸ�� ��� �������� (����¡ ó���ϱ� ��)*/
	public List<UserVO> listMember() throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="select * from member order by idx desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			List<UserVO> arr= makeList(rs);
			return arr;
		}finally {
			close();
		}
	}
	//---
	/*�� ȸ�� �� ��������*/
	public int getTotalUserCount() throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="select count(idx) cnt from member"; 
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			return count;
		}finally {
			close();
		}
	}
	/*�˻��� ȸ���� ��������*/
	public int getFindTotalUserCount(String type, String keyword) throws SQLException{
		try {
			String colName="";
			switch(type) {
			case "1" : colName="name"; break;
			case "2" : colName="userid"; break;
			case "3" : colName="hp1||hp2||hp3"; break;
			}
			con=DBUtil.getCon();
			String sql="select count(idx) cnt from member where "+colName+" like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			int count =0;
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			return count;
		}finally {
			close();
		}
	}
	/*��� ȸ�� ��� �������� (����¡ ó�� ��)*/
	public List<UserVO> listMember(int start, int end) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="";
			StringBuilder buf = new StringBuilder("select * from(")
					.append(" select rownum rn, a.* from")
					.append(" (select * from member order by idx desc) a)")
					.append(" where rn between ? and ?");
			sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			List<UserVO> arr= makeList(rs);
			return arr;
		}finally {
			close();
		}
	}
	
	/*��� �˻� ȸ�� ��� �������� (����¡ ó�� ��)*/
	public List<UserVO> findMember(String type, String keyword,int start, int end) throws SQLException{
		try {
			con=DBUtil.getCon();
			String colName="";
			switch(type) {
			case "1" : colName="name"; break;
			case "2" : colName="userid"; break;
			case "3" : colName="hp1||hp2||hp3"; break;
			}
			String sql=""; //wgho����
			StringBuilder buf = new StringBuilder("select * from(")
					.append(" select rownum rn, a.* from")
					.append(" (select * from member where ")
					.append(colName+" like ?")
					.append(" order by idx desc) a)")
					.append(" where rn between ? and ?");
			sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			List<UserVO> arr= makeList(rs);
			return arr;
		}finally {
			close();
		}
	}
	public List<UserVO> makeList(ResultSet rs) throws SQLException{
		List<UserVO> arr= new ArrayList<>();
		while(rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String pwd = rs.getString("pwd");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			String post = rs.getString("post");
			String addr1 = rs.getString("addr1");
			String addr2 = rs.getString("addr2");
			java.sql.Date indate=rs.getDate("indate");
			int mileage=rs.getInt("mileage");
			int mstate=rs.getInt("mstate");
			UserVO user = new UserVO(idx,name,userid,pwd,hp1,hp2,hp3,post,addr1,addr2,indate,mileage,mstate);
			arr.add(user);
		}
		return arr;
	}
		
	/*ȸ��Ż�� ó���� �ϴ� �޼ҵ�*/
	public int deleteMember(String idx) throws SQLException{
		try {
			con=DBUtil.getCon();
			StringBuilder buf = new StringBuilder("update member set mstate=-1")
					.append(" where idx=?");
			String sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setString(1, idx);
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}
	public boolean idCheck(String userid) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="select * from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			//���̵�� unique���������� �־��� ������ ������ 1���� ����� ��ȯ, ������ ��ȯx
			boolean bool = rs.next(); //==true�� ��ȯ�ϸ� �ش� ���̵� ����
			return !bool;
		}finally {
			close();
		}
	}	
	/*ȸ����ȣ(PK)�� ȸ������ �������� �޼ҵ�*/
	public UserVO selectUserByIdx(String idx) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="select * from member where idx=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, idx);
			rs=ps.executeQuery();
			List<UserVO> arr = makeList(rs);
			if(arr!=null||arr.size()==1) {
				UserVO user = arr.get(0);
				return user;
			}
			return null;
		}finally {
			close();
		}
	}
	
	public int updateUser(UserVO user)throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="update member set name=?,userid=?,pwd=?,hp1=?,hp2=?,hp3=?,post=?,addr1=?,addr2=?,mstate=?,mileage=? where idx=?";
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
			ps.setInt(10, user.getMstate());
			ps.setInt(11, user.getMileage());
			ps.setInt(12, user.getIdx());
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}
	
	
}
