package imageboard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardViewService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		if(request.getParameter("seq") == null)	return "/imageboard/imageboardList.do?pg=1";
		
		else {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
			List<ImageboardDTO> list = imageboardDAO.imageboardView(seq);
			request.setAttribute("pg", pg);
			request.setAttribute("list", list);
			return "/imageboard/imageboardView.jsp";
		}
	}
}
