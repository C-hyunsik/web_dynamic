<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.dao.MemberDAO" %>
<%@ page import = "member.bean.MemberDTO" %>
<%
	//Java
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.userInfo(id);
	
	String gender = memberDTO.getGender();
	String email1 = memberDTO.getEmail1();
	String email2 = memberDTO.getEmail2();
	String tel1 = memberDTO.getTel1();
	String tel2 = memberDTO.getTel2();
	String tel3 = memberDTO.getTel3();
	String zipcode = memberDTO.getZipcode();
	String addr1 = memberDTO.getAddr1();
	String addr2 = memberDTO.getAddr2();
	
	boolean result = false;
	if(name != null){
		result = true;
	}

%>
<%=name%>|<%=id%>|<%=gender%>|<%=email1%>|<%=email2%>|<%=tel1%>|<%=tel2%>|<%=tel3%>|<%=zipcode%>|<%=addr1%>|<%=addr2%>