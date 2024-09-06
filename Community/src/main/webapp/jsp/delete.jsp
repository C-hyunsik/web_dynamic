<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.dao.UserDAO" %>
<%@ page import="post.dto.PostDTO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page trimDirectiveWhitespaces="true" %><%-- XML태그 시작 전의 공백 제거 --%>

<%
	//Java
	String writer = request.getParameter("writer");
	String postNoStr = request.getParameter("post_no");
	
	int postNo = -1;
	boolean su = false;
	
	if (writer != null && postNoStr != null) {
	    try {
	        postNo = Integer.parseInt(postNoStr);
	
	        UserDAO userDAO = UserDAO.getInstance();
	
	        // 게시글 삭제
	        su = userDAO.deletePost(writer, postNo);
	        
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
%>
<?xml version="1.0" encoding="UTF-8"?>
<su><%=su%></su>