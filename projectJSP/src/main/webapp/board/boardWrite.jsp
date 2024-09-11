<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.dao.BoardDAO" %>
<%@ page import = "board.bean.BoardDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = null;
	String id = null;
	String email = null;
	
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	id = (String)session.getAttribute("memId");	//자식 = (자식)부모
	name = (String)session.getAttribute("memName");	//자식 = (자식)부모
	email = (String)session.getAttribute("memEmail");	//자식 = (자식)부모
	
	BoardDTO boardDTO = new BoardDTO();
	BoardDAO boardDAO = BoardDAO.getInstance();
	
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	boolean result = boardDAO.boardWrite(boardDTO);
%>
<%=result%>