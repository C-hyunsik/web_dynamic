package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "c##java";
	private String password = "1234";

	private Connection con;				//인터페이스
	private PreparedStatement pstmt;	//인터페이스
	private ResultSet rs;				//인터페이스
	
	//private static userDAO instance;	//싱글톤
	private static GuestbookDAO instance = new GuestbookDAO();
	
	public static GuestbookDAO getInstance() {
		return instance;
	}
	
	public GuestbookDAO() {
		try {
			Class.forName(driver);		//생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean guestbookWrite(GuestbookDTO guestbookDTO) {
		boolean result = false;
		getConnection();
		String sql = "insert into guestbook values(seq_guestbook.nextval, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,guestbookDTO.getName());
			pstmt.setString(2,guestbookDTO.getEmail());
			pstmt.setString(3,guestbookDTO.getHomepage());
			pstmt.setString(4,guestbookDTO.getSubject());
			pstmt.setString(5,guestbookDTO.getContent());
			
			int su = pstmt.executeUpdate();
			
			result = (su > 0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List<String> guestbookList(int s_num, int e_num) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		List<String> list = new ArrayList<>();
		getConnection();
		String sql = "select * from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from guestbook order by seq desc) tt)"
				+ "where rn >= ? and rn <= ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,s_num);
			pstmt.setInt(2,e_num);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String row = rs.getInt("seq") + "\t" + 
							 rs.getString("name") + "\t" +
							 rs.getString("email") + "\t" +
							 rs.getString("homepage") + "\t" +
							 rs.getString("subject") + "\t" +
							 rs.getString("content") + "\t" +
							 sdf.format((rs.getDate("logtime")));
				list.add(row);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getTotal() {
		int totalA = 0;
		getConnection();
		String sql = "select count(*) from guestbook";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
			
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				totalA = rs.getInt("count(*)");
			}
			System.out.println(totalA);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalA;
	}
}