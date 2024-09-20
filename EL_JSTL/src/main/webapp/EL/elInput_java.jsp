<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0 auto;
	padding:0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	font-size:3em;
	font-family: 'LeeSeoyun'; 
}
@font-face {
    font-family: 'LeeSeoyun';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
td{
	padding: 5px 10px;
	width:400px;
}
th{
	width:150px;
}
input{
	font-size:1em;
	font-family: 'LeeSeoyun';
	width:150px;
}
input[type = text]{
	width:400px;
	font-family: 'LeeSeoyun';
	height: 70px;
}
#tableWrap{
	border: 1px solid black;
	border-radius: 20px;
	padding:100px;
}
#btn>input{
	padding: 10px 20px;
	background: black;
	color:white;
}
#btn>input:hover{
	background: white;
	color:black;
}
</style>
</head>
<body>
	<form method = get action = ./elResult_java.jsp>
		<div id = tableWrap>
		<h3>자바 클래스의 메소드 이용</h3>
			<table>
				<tr>
					<th>X</th>
					<td><input id = x type = text name = x placeholder = "x값 입력" ></td>
				</tr>
				<tr>
					<th>Y</th>
					<td><input id = y type = text name = y placeholder = "y값 입력" ></td>
				</tr>
				<tr>
					<td colspan = 2 align = center>
						<div id = btn>
							<input type = submit value = 계산 />
							<input type = reset value = 취소 />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>