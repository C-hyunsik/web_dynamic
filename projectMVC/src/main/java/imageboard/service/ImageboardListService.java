package imageboard.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;
import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));

		//1페이지당 3개씩
		//오라클
		//int endNum = pg * 3;
		//int startNum = endNum - 2;
		
		//MySQL
		int endNum = 3;		//개수
		int startNum = (pg * endNum) - endNum;	//시작위치, 0부터 시작

		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		list = imageboardDAO.imageboardList(startNum, endNum);

		//페이징 처리
		int totalA = imageboardDAO.getTotalA();
		ImageboardPaging imageboardPaging = new ImageboardPaging();
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("pagingHTML", imageboardPaging.getPagingHTML().toString());
		
		return "/imageboard/imageboardList.jsp";
	}

}