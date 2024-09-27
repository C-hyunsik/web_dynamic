package imageboard.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		String[] check = request.getParameterValues("selectedSeqs");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		int result = 0;
		System.out.println(check);
		for(int i = 0; i < check.length; i++) {
			map.put("seq", Integer.valueOf(check[i]));
			System.out.println(map);
			imageboardDAO.imageboardDelete(map);
			result++;
		}
		
		request.setAttribute("result", result);
		return "/imageboard/imageboardDelete.jsp";
	}
}
