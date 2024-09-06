<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.dao.MemberDAO" %>
<%@ page import = "member.bean.MemberDTO" %>
<%
	//Java
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name"); 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	MemberDTO user_info = new MemberDTO();
	
	user_info.setName(name);
	user_info.setId(id);
	user_info.setPwd(pwd);
	user_info.setGender(gender);
	user_info.setEmail1(email1);
	user_info.setEmail2(email2);
	user_info.setTel1(tel1);
	user_info.setTel2(tel2);
	user_info.setTel3(tel3);
	user_info.setZipcode(zipcode);
	user_info.setAddr1(addr1);
	user_info.setAddr2(addr2);
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean result = memberDAO.memberUpdate(user_info);
	//System.out.println(result);
%>
<%=result %>