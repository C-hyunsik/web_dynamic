package board.dao;

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

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO boardDAO = new BoardDAO();
	private SqlSessionFactory sessionFactory;

	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sessionFactory.openSession();
		//Oracle
		//sqlSession.insert("boardSQL.boardWrite", map);
		
		//MySQL
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.update("boardSQL.refUpdate", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("boardSQL.boardList", map); 
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		int totalA = 0;
		
		SqlSession sqlSession = sessionFactory.openSession();
		totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		
		return totalA;
	}
	public List<BoardDTO> boardView(int seq){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		SqlSession sqlSession = sessionFactory.openSession();
		System.out.println(seq);
		list = sqlSession.selectList("boardSQL.boardView", seq); 
		sqlSession.close();
		return list;
	}

	public void delete(int seq) {
		SqlSession sqlSession = sessionFactory.openSession();
		System.out.println(seq);
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public void update(int seq, String subject, String content) {
		SqlSession sqlSession = sessionFactory.openSession();
		Map<String, Object> map = new HashMap<>();
		map.put("seq", Integer.valueOf(seq));
		map.put("subject", subject);
		map.put("content", content);
		sqlSession.update("boardSQL.boardUpdate", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardHitUpdate(int seq) {
		SqlSession sqlSession = sessionFactory.openSession();
		System.out.println(seq);
		sqlSession.update("boardSQL.boardHitUpdate", seq);
		sqlSession.commit();
		sqlSession.close();
	}
}