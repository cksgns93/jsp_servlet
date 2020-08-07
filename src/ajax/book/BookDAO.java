package ajax.book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jdbc.util.DBUtil;


public class BookDAO {
	DataSource ds;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public BookDAO() throws Exception{
		//Context ctx=new InitialContext();
		//ds=(DataSource)ctx.lookup("java:comp/env/myoracle/javadb");
	}
	
	public List<BookDTO> getPublishList() throws SQLException{
		try{
			con=DBUtil.getCon();
			String sql="select distinct publish from book order by publish asc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			List<BookDTO> arr=new ArrayList<BookDTO>();
			while(rs.next()){
				String publish=rs.getString("publish");
				BookDTO b=new BookDTO();
				b.setPublish(publish);
				arr.add(b);
			}//while----
			return arr;
		}finally{
			close();
		}
	}//-------------------------------------------------
	
	public List<BookDTO> getTitleList(String pub) throws SQLException{
		try{
			con=DBUtil.getCon();
	String sql="select title from book where publish=? order by title";
			ps=con.prepareStatement(sql);
			ps.setString(1,pub);
			rs=ps.executeQuery();
			List<BookDTO> arr=new ArrayList<BookDTO>();
			while(rs.next()){
				String title=rs.getString("title");
				BookDTO b=new BookDTO(); 
				b.setTitle(title);
				arr.add(b);
			}//while----
			return arr;
		}finally{
			close();
		}
	}//-------------------------------------------------
	
	public List<BookDTO> getFindBook(String title) throws SQLException{
		try{
			con=DBUtil.getCon();
			String sql="select * from book where title like upper(?)";
			ps=con.prepareStatement(sql);			
			ps.setString(1,"%"+title+"%");
			rs=ps.executeQuery();
			List<BookDTO> arr=new ArrayList<BookDTO>();
			while(rs.next()){
				String isbn=rs.getString("isbn");
				String title2=rs.getString("title");
				String publish=rs.getString("publish");
				int price=rs.getInt("price");
				java.sql.Timestamp pubDate
						=rs.getTimestamp("published");
				String bimage=rs.getString("bimage");
				BookDTO book
				=new BookDTO(isbn,title2,publish,price,pubDate,bimage);
				arr.add(book);
			}
			return arr;
			
		}finally{
			close();
		}
	}//--------------------------------------
	
	public BookDTO getBookInfo(String isbn) throws SQLException{
		try{
			con=DBUtil.getCon();
		String sql="select * from book where isbn=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, isbn);
			rs=ps.executeQuery();
			List<BookDTO> arr=new ArrayList<BookDTO>();
			while(rs.next()){
				String isbn2=rs.getString("isbn");
				String title=rs.getString("title");
				String publish=rs.getString("publish");
				int price=rs.getInt("price");
				java.sql.Timestamp pubDate
						=rs.getTimestamp("published");
				String bimage=rs.getString("bimage");
				BookDTO book
				=new BookDTO(isbn2,title,publish,price,pubDate,bimage);
				arr.add(book);
			}
			if(arr!=null && arr.size()==1){
				BookDTO book=arr.get(0);
				return book;
			}
			return null;
			
		}finally{
			close();
		}
	} //---------------------------------------
	
	public List<BookDTO> getAllBook() throws SQLException{
		try{
			con=DBUtil.getCon();
			String sql="select * from book order by isbn asc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			List<BookDTO> arr=new ArrayList<BookDTO>();
			while(rs.next()){
				String isbn=rs.getString("isbn");
				String title=rs.getString("title");
				String publish=rs.getString("publish");
				int price=rs.getInt("price");
				java.sql.Timestamp pubDate
						=rs.getTimestamp("published");
				String bimage=rs.getString("bimage");
				BookDTO book
				=new BookDTO(isbn,title,publish,price,pubDate,bimage);
				arr.add(book);
			}
			return arr;
		}finally{
			close();
		}
	}//------------------------------------
	
	public int updateBook(BookDTO b) throws SQLException{
		try{
			con=DBUtil.getCon();
			String sql
			="update book set title=?, publish=?, price=? where isbn=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, b.getTitle());
			ps.setString(2, b.getPublish());
			ps.setInt(3, b.getPrice());
			ps.setString(4,b.getIsbn());
			System.out.println("isbn="+b.getIsbn());
			int n=ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}//------------------------------------
	
	public int deleteBook(String isbn) throws SQLException{
		try{
			con=DBUtil.getCon();
			String sql
			="delete from book where isbn=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, isbn);
			int n=ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}
	
	private void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}//////////////////////////










