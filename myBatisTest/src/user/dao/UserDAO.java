package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private static UserDAO userDAO = new UserDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public static UserDAO getInstance(){
		return userDAO;
	}
	
	public UserDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");	//문자단위
			
			//InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");	//바이트단위
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insert(UserDTO userDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		su = sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	public List<UserDTO> getAllList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<UserDTO> list = sqlSession.selectList("userSQL.getAllList");
		sqlSession.close();
		
		return list;
	}
	public int update(UserDTO userDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		su = sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	public int delete(UserDTO userDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		su = sqlSession.delete("userSQL.delete", userDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}

	public List<UserDTO> getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUser", id);
		
		sqlSession.close();
		
		return list;
	}

	public List<UserDTO> search(String num, String str) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("str", str);
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		
		sqlSession.close();
		return list;
	}
}
