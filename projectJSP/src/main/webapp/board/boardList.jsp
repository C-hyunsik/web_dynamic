<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.dao.BoardDAO" %>
<%@ page import = "board.bean.BoardDTO" %>
<%@ page import = "java.util.List" %>

<%
    int pg = Integer.parseInt(request.getParameter("pg"));
    int pagesize = 5;
    
    int e_num = pg * pagesize;
    int s_num = e_num - (pagesize - 1);
    
    BoardDAO boardDAO = BoardDAO.getInstance();
    List<String> arr = boardDAO.boardList(s_num, e_num);
    int count = boardDAO.boardCount();
    int listpage = (count + pagesize - 1) / pagesize;
    
    session.setAttribute("boardPage", listpage);	//페이지번호 세션

    for (String row : arr) {
        out.print(row + "\n");
    }
%>