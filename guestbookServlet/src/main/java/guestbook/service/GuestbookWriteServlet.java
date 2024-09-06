package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/write")
public class GuestbookWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//데이터
		
		request.setCharacterEncoding("UTF-8");//한글처리 - post 방식
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		System.out.println(name);
		//DB
		GuestbookDTO guestbookDTO = new GuestbookDTO();
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		guestbookDTO.setName(name);
		guestbookDTO.setEmail(email);
		guestbookDTO.setHomepage(homepage);
		guestbookDTO.setSubject(subject);
		guestbookDTO.setContent(content);
		
		boolean result = guestbookDAO.guestbookWrite(guestbookDTO);
		//응답
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		if(result) {
			out.println("""
					<html>
					<body>
						<form method = post action = /guestbookServlet/list >
							<h3>작성하신 방명록을 저장하였습니다.</h3>
							<input type = button value = 뒤로 onclick = "history.go(-1)">
							<input id = listBtn type = submit value = 글목록>
						</form>
					<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
					<script type="text/javascript">
					$(function(){
						$('#listBtn').click(function(){
							$.post('/guestbookServlet/list', function(){
							});
						});
					});
					</script>
					</body>
					</html>
					""");
		}
		else {
			out.println("""
					<html>
					<body>
						<form method = post action = /guestbookServlet/list?pg=1 >
							<h3>방명록 작성을 실패했습니다.</h3>
							<input type = button value = 뒤로 onclick = "history.go(-1)">
							<input id = listBtn type = submit value = 글목록>
						</form>
					<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
					<script type="text/javascript">
					$(function(){
						$('#listBtn').click(function(){
							$.post('/guestbookServlet/list', function(){
							});
						});
					});
					</script>
					</body>
					</html>
					""");
		}
	}
}