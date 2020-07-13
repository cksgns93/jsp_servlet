package user.persistence;

import common.base.DAOBase;
import jdbc.util.DBUtil;
import user.domain.UserVO;
import java.sql.*;
import java.util.*;
public class UserDAO extends DAOBase{
	
	public UserDAO() {
		System.out.println("UserDAO 생성");
	}
	public int createUser(UserVO user) throws SQLException{
		try {
			con=DBUtil.getCon();
			//String => 불변성(immutable) 문자열을 조작하면 원본을 그대로두고 새로운 객체를 만든다.
			//문자열 조작이나 편집을 하려면 StringBuffer나 StringBuilder를 이용
			//이 클래스들은 무자열을 버퍼에 보관하여 버퍼내에서 삽입, 수정, 삭제 등의 편집을 수행한다. 
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
		
	/*회원탈퇴 처리를 하는 메소드*/
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
			//아이디는 unique제약조건을 주었기 때문에 있으면 1개의 결과를 반환, 없으면 반환x
			boolean bool = rs.next(); //==true를 반환하면 해당 아이디가 존재
			return !bool;
		}finally {
			close();
		}
	}	
	/*회원번호(PK)로 회원정보 가져오는 메소드*/
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
