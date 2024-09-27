package imageboard.dao;

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

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	private static ImageboardDAO instance = new ImageboardDAO();
	private SqlSessionFactory sessionFactory;

	public static ImageboardDAO getInstance() {
		return instance;
	}
	
	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // - 문자 단위
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.insert("imageboardSQL.imageboardWrite", imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<ImageboardDTO> imageboardList(int startNum, int endNum) {
		SqlSession sqlSession = sessionFactory.openSession();
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ImageboardDTO> list = sqlSession.selectList("imageboardSQL.imageboardList",map);
		sqlSession.close();
		return list;
	}

	public int getTotalA() {
		SqlSession sqlSession = sessionFactory.openSession();
		int su = sqlSession.selectOne("imageboardSQL.getTotalA");
		sqlSession.close();
		return su;
	}

	public List<ImageboardDTO> imageboardView(int seq) {
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		SqlSession sqlSession = sessionFactory.openSession();
		list = sqlSession.selectList("imageboardSQL.imageboardView", seq); 
		sqlSession.close();
		return list;
	}

	public void imageboardDelete(Map<String, Integer> map) {
		SqlSession sqlSession = sessionFactory.openSession();
		sqlSession.delete("imageboardSQL.imageboardDelete",map);
		sqlSession.commit();
		sqlSession.close();
	}
}