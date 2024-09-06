package guestbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.GuestbookDAO;

@WebServlet("/list")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		hamsu(request, response);
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		hamsu(request, response);
	}
	protected void hamsu(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//1페이지당 3개
		int pagesize = 3;
		
		int e_num = pg * 3;
		int s_num = e_num - 2;
		
		//DB
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		List<String> list = guestbookDAO.guestbookList(s_num, e_num);
		
		int totalA = guestbookDAO.getTotal();
		int page = (totalA + pagesize - 1) / pagesize;
		String[] parts = null;
		
		//응답
		out.println("""
				<html>
				<head>
				<meta charset="UTF-8">
				<title>글목록</title>
				<style type="text/css">
				#wrap{
					display:flex;
					align-item:center;
					justify-content: center;
				}
				table{
					align-item:center;
					border-collapse: collapse;
				}
				th{
					padding: 5px;
					width: 100px;
				}
				td{
					padding: 5px;
					width:200px;
				}
				input[type = button]{
					padding: 0.3em 1.5em;
					font-size:1.4em;
					background:gray;
					color:white;
					border:none;
				}
				input[type = button]:hover{
					background:#212121;
					color:white;
					border:none;
				}
				#content{
					white-space:pre-wrap;
				}
				#awrap{
					display:flex;
					align-item:center;
					justify-content: center;
					margin: 20px 0;
				}
				#paging{
					padding:5px 10px;
					font-size:1.2em;
					border:1px solid #d4d4d4;
					margin-left:5px;
					margin-right:5px;
				}
				#currentpg{
					border: 2px solid black;
					color: red;
					margin-left:5px;
					margin-right:5px;
					padding:5px 10px;
					font-size:1.2em;
				}
				a:link{color: black; text-decoration:none;}
				a:visited{color : gray; text-decoration:none;}
				a:hover{color : red; text-decoration:underline; font-weight:bold;}
				a:active{color : purple; text-decoration:none;}
				</style>
				</head>
				<body>
				""");
				for(String item : list) {
					parts = item.split("\t");
					out.println("""
					<div id = wrap>
					<table border = 1>
					<tr>
						<th>작성자</th>
						<td>""" + parts[1] + """
						</td>
						<th>작성일</th>
						<td>""" + parts[6] + """
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan = 3>""" + parts[2] + """
						</td>	
					</tr>
					<tr>
						<th>홈페이지</th>
						<td colspan = 3>""" + parts[3] + """
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan = 3>""" + parts[4] + """
						</td>
					</tr>
					<tr>
						<td id = content colspan = 4>""" + parts[5] + """
						</pre></td>
					</tr>
				</table>
				</div>
				<div><hr/></div>
					""");
				}
				out.println("<div id = awrap>");
				out.println("<div id = pagenum >");
				for(int i = 1; i <=page; i++){
					if(i == pg)
						out.println("<span><a id = currentpg href = '/guestbookServlet/list?pg=" + i + "'>" + i + "</a></span>");
					else
						out.println("<span><a id = paging href = '/guestbookServlet/list?pg=" + i + "'>" + i + "</a></span>");
					}
				out.println("</div>");
				out.println("</div>");
				out.println("<div id = wrap>");
				out.println("<input type='button' value='뒤로' onclick = history.go(-1) />");
				out.println("&emsp;<input type='button' value='글쓰기' onclick='location.href=\"/guestbookServlet/guestbook/guestbookWrite.html\"'/>");
				out.println("</div>");
				out.println("</body>");
				out.println("</html>");
	}
}