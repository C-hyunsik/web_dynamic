<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.dao.MemberDAO" %>
<%@ page import = "member.bean.MemberDTO" %>

<%
	//Java
	//데이터
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
	
	//DB
	MemberDTO memberDTO = new MemberDTO();
	
	memberDTO.setName(name);
	memberDTO.setId(id);
	memberDTO.setPwd(pwd);
	memberDTO.setGender(gender);
	memberDTO.setEmail1(email1);
	memberDTO.setEmail2(email2);
	memberDTO.setTel1(tel1);
	memberDTO.setTel2(tel2);
	memberDTO.setTel3(tel3);
	memberDTO.setZipcode(zipcode);
	memberDTO.setAddr1(addr1);
	memberDTO.setAddr2(addr2);
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean exist = memberDAO.checkIn(memberDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#OK{
	color:blue;
}
#NO{
	color:red;
}
</style>
</head>
<body>
<% if(exist){ %>
<div id = OK>회원가입에 성공하였습니다.</div>
<input type = button value = 메인으로 onclick = "location.href = '../index.jsp'"/>
<input type = button value = 로그인하기 onclick = "location.href = './memberLoginForm.jsp'"/>
<%}else{ %>
<div id = NO>회원가입에 실패하였습니다.</div>
<input type = button value = 다시하기 onclick = "location.href = './memberWriteForm.jsp'"/>
<%} %>
</body>
</html>