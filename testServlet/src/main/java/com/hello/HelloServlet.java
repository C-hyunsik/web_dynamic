package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/HelloServlet")
//web.xml에 servlet에 대한 선언을 대신함
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) {
		System.out.println("init...");
	}

	public void destroy() {
		System.out.println("destroy...");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGetaa...");
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out  = response.getWriter();//웹
		out.println("<html>");
		out.println("<body>");
		out.println("Hello Servlet!!<br/>");
		out.println("안녕하세요 서블릿!!<br/>");
		out.println("</body>");
		out.println("</html>");
		
		/*
		//1.콘솔
		System.out.println("<html>");
		
		//2.파일
		PrintWriter out = new PrintWriter(new FileWriter("result.txt"));
		out.println("<html>");
		
		//3.네트워크
		ObjectOutputStream oos = new ObjectOutputStream(소켓.getOutputStream());
		oos.println("<html>");
		*/
	}

}
