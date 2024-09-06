<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//Java
	String result = "";
	for(int i = 1; i <= 9; i++){
		for(int j = 2; j <= 9; j++){
			result += j + " * " + i + " = " + (i * j) + "\t";
		}
		result += "\n";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#gugudan{
	white-space: pre;
}
td{
	padding:0 5px;
	width:100px;
}
</style>
</head>
<body>
<div id = gugudan>
<%=result %><%-- white-space 속성으로 출력 --%>
</div>
<table>
<% for(int i = 1; i <= 9; i++){ %>
	<tr>
	<% for(int dan = 2; dan <= 9; dan++){ %>
		<td><%=dan %> * <%=i %> = <%=dan*i %></td>
	
	<%}//for dan %>
	</tr>
<%}//for i %>
</table>
</body>
</html>