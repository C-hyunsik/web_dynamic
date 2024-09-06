package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		if(gender.equals("M"))
			gender = "남";
		else
			gender = "여";
		
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<ul><font color = " + color + ">");
		out.println("<li>이름 : " + name + "</li>");
		out.println("<li>성별 : " + gender + "</li>");
		out.println("<li>색상 : " + color + "</li>");
		out.println("<li>취미 : ");
		if(hobby != null) {			
			for(int i = 0; i < hobby.length; i++) {
				out.println(hobby[i] + " ");
			}
		}
		else{
			out.println("선택된 취미가 없습니다.");
		}
		out.println("</li>");
		out.println("<li>과목 : ");
		for(int i = 0; i < subject.length; i++) {
			out.println(subject[i] + "&emsp;");
		}
		out.println("</li>");
		out.println("</font></ul>");
		out.println("</body>");
		out.println("</html>");
	}

}
