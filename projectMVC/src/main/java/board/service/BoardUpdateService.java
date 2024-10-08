package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDAO.update(seq,subject,content);
		return "none";
	}
}