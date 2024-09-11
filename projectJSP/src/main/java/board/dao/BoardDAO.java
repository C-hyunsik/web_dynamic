package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private DataSource ds; 

	private Connection con;				//인터페이스
	private PreparedStatement pstmt;	//인터페이스
	private ResultSet rs;				//인터페이스
	
	//private static userDAO instance;	//싱글톤
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	public BoardDAO() {
		Context ctx;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");	//Tomcat의 경우
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean boardWrite(BoardDTO boardDTO) {
		boolean result = false;

		String sql = "insert into board(seq, id, name, email, subject, content, ref) values(seq_board.nextval, ?, ?, ?, ?, ?, seq_board.nextval)";

		try {
			con = ds.getConnection();	//접속
			pstmt = con.prepareStatement(sql);	//생성

			//매핑
			pstmt.setString(1,boardDTO.getId());
			pstmt.setString(2,boardDTO.getName());
			pstmt.setString(3,boardDTO.getEmail());
			pstmt.setString(4,boardDTO.getSubject());
			pstmt.setString(5,boardDTO.getContent());

			int su = pstmt.executeUpdate();	//실행
			result = (su > 0);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	public List<String> boardList(int s_num, int e_num) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY.MM.dd HH:mm:ss");
		List<String> list = new ArrayList<>();
		String sql = """
					select * from
							(select rownum rn, tt.* from
							(select seq, subject, id, hit, logtime from board order by ref desc, step asc) tt)
					where rn >= ? and rn <= ?	
					""";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, s_num);
			pstmt.setInt(2, e_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String row = rs.getInt("seq") + "|" + 
						 rs.getString("subject") + "|" +
						 rs.getString("id") + "|" +
						 rs.getInt("hit") + "|" +
						 sdf.format((rs.getDate("logtime")));
			list.add(row);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public int boardCount() {
		int su = 0;
		
		String sql = "select count(*) from board";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				su = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return su;
	}
}
