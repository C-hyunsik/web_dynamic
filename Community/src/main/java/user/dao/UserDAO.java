package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import post.dto.PostDTO;
import user.dto.UserDTO;

public class UserDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "c##java";
	private String password = "1234";

	private Connection con;				//인터페이스
	private PreparedStatement pstmt;	//인터페이스
	private ResultSet rs;				//인터페이스
	
	//private static userDAO instance;	//싱글톤
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	public UserDAO() {
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
	public boolean checkIn(UserDTO userDTO){
		boolean result = false;
		getConnection();	//접속

		String sql = "insert into USER_INFO values(?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);	//생성

			//매핑
			pstmt.setString(1,userDTO.getId());
			pstmt.setString(2,userDTO.getPw());
			pstmt.setString(3,userDTO.getName());
			pstmt.setString(4,userDTO.getGender());
			pstmt.setString(5,userDTO.getEmail());

			pstmt.executeUpdate();	//실행
			result = true;
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
	public boolean isExistId(String user_id) {
		boolean exist = false;
		getConnection();	

		try {
			String sql = "select * from user_info where id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				exist = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return exist;
	}
	public boolean login(String user_id, String user_pw) {
		boolean result = false;
		getConnection();	

		try {
			String sql = "select * from user_info where id = ? and pw = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			pstmt.setString(2,user_pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return result;
	}
	public int post_qty(String user_id) {
		int qty = 0;
		getConnection();
		try {
			String sql = "select count(*) from post where id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt("count(*)"));
				qty = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return qty;
	}
	public List<String> post_list(UserDTO userDTO) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		List<String> list = new ArrayList<>();
		getConnection();
		String sql = "select * from post order by no desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String row = rs.getInt("no") + "\t" + 
							 rs.getString("title") + "\t" +
							 rs.getString("id") + "\t" +
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
	public boolean post_write(String user_id, String title, String content) {
		boolean result = false;
		getConnection();	//접속

		String sql = "insert into post values(POST_NO.NEXTVAL, ?, ?, ?, SYSDATE)";

		try {
			pstmt = con.prepareStatement(sql);	//생성

			//매핑
			pstmt.setString(1,user_id);
			pstmt.setString(2,title);
			pstmt.setString(3,content);

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
	public PostDTO post_view(int post_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		PostDTO post = null;
		getConnection();	//접속

		String sql = "select * from post where no = ?";

		try {
			pstmt = con.prepareStatement(sql);	//생성

			//매핑
			pstmt.setInt(1,post_id);

			rs = pstmt.executeQuery();	//실행
			if (rs.next()) {
	               post = new PostDTO();
	               post.setNo(rs.getInt("no"));
	               post.setId(rs.getString("id"));
	               post.setTitle(rs.getString("title"));
	               post.setContent(rs.getString("post_content"));
	               java.sql.Timestamp logtime = rs.getTimestamp("logtime");
	               post.setLogtime(sdf.format(logtime)); // Assuming logtime is stored as a Timestamp
	           }
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
		return post;
	}
	
	public boolean deletePost(String id, int no) {
		boolean result = false;
		System.out.println(id + no);
		getConnection();
		
		String sql = "delete from post where id = ? and no = ?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setInt(2,no);
			
			int su = pstmt.executeUpdate();
			
			if(su > 0) {
				result = true;
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}