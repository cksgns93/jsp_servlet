package my.memo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.DBUtil;

public class MemoDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public int insertMemo(MemoVO memo) throws SQLException{
		try {
			con=DBUtil.getCon();
			//시퀀스명 : memo_seq
			String sql ="INSERT INTO memo(idx,name,msg,wdate)"
					+" VALUES(memo_seq.nextval, ?,?,sysdate)";
			ps = con.prepareStatement(sql);
			String name=memo.getName();
			String msg=memo.getMsg();
			ps.setString(1, name);
			ps.setString(2, msg);
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}
	//select문 where절
	public MemoVO selectMemo(int idx) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="SELECT * FROM MEMO WHERE IDX=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			List<MemoVO> arr=makeList(rs);
			if(arr!=null||arr.size()==1) {
				return arr.get(0);
			}
			return null;
		}finally {
			close();
		}
	}
	
	//최근 쓴 글 순으로 모든 메모글 가져오기
	public List<MemoVO> listMemo() throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql = "SELECT * FROM MEMO";
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemoVO> arr=makeList(rs);
			return arr;
		}finally {
			close();
		}
	}
	
	public List<MemoVO> makeList(ResultSet rs) throws SQLException{
		List<MemoVO> arr=new ArrayList<>();
		
		//idx,msg,name,date
		while(rs.next()) {
			int idx = rs.getInt("idx");
			String msg = rs.getString("msg");
			String name = rs.getString("name");
			Date date = rs.getDate("wdate");
			MemoVO m = new MemoVO(idx, name, msg, date);
			arr.add(m);
		}
		return arr;
	}
	
	public int deleteMemo(int idx) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="DELETE FROM MEMO WHERE IDX=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);			
			int n=ps.executeUpdate();
			return n;
		}finally {
			close();			
		}
	}
	
	public int updateMemo(MemoVO memo) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="UPDATE MEMO set msg=?,name=? where idx=?";
			ps=con.prepareStatement(sql);
			ps.setInt(3, memo.getIdx());
			ps.setString(2, memo.getName());
			ps.setString(1, memo.getMsg());
			System.out.println(memo.getMsg());
			int n = ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
