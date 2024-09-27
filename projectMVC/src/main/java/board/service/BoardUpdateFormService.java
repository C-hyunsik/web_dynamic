package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardUpdateFormService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) 
			throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardView(seq);
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		return "/board/boardUpdateForm.jsp";
	}
}
