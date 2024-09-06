<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.dao.MemberDAO" %>
<%@ page import = "member.bean.MemberDTO" %>
<%
	//Java
	String loginId = request.getParameter("loginId");
	String loginPwd = request.getParameter("loginPwd");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.memberlogin(loginId, loginPwd);
	
	String name = memberDTO.getName();
	String id = memberDTO.getId();
	
	boolean result = false;
	if(name != null){
		result = true;
	}
%>

<%if(result){
	//중요한 데이터를 주소표시줄에 실어서 보내지 말자
	//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name,"UTF-8") + "&id=" + id);
	
	//쿠키에 데이터 실어 보내기
	/*
	Cookie namecookie = new Cookie("memName",name );	//쿠키 생성
	namecookie.setMaxAge(30*60);	//초단위
	namecookie.setPath("/");
	response.addCookie(namecookie);	//클라이언트에 저장

	Cookie idcookie = new Cookie("memId",id );			//쿠키 생성
	idcookie.setMaxAge(30*60);		//초단위
	idcookie.setPath("/");
	response.addCookie(idcookie);	//클라이언트에 저장
	*/
	
	//세션
	//HttpSession session = request.getSession();	//세션 생성
	session.setAttribute("memName", name);	//세션 생성 - 기본 30분
	session.setAttribute("memId", id);	//세션 생성 - 기본 30분
	
	//세션에 데이터 실어 보내기
	response.sendRedirect("loginOk.jsp");
}else{ 
	//페이지 이동
	response.sendRedirect("loginFail.jsp");
} %>