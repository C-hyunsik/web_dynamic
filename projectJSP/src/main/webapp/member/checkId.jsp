<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.dao.MemberDAO" %>
<% 
	//데이터
	String id = request.getParameter("id"); 
	
	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	boolean exist = memberDAO.idExistId(id);
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
<%if(exist){ %>
<div id = NO><%=id %>는 사용불가능</div>
<br/><br/>
<form action= "checkId.jsp">
	아이디<input type = text name = id required />
	<input type = submit value = 중복체크 />
</form>
<%}else{ %>
<div id = OK><%=id %>는 사용가능</div>
<br/><br/>
<input type = button value = 사용하기 onclick = "checkIdClose('<%=id %>')"/>
<%} %>
<script type="text/javascript">
function checkIdClose(id){
	opener.document.getElementById('id').value = id;
	opener.document.getElementById('check').value = id;
	window.close();
	opener.document.getElementById('pwd').focus();
}
</script>
</body>
</html>