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
	display:flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	font-size:4em;
	font-family: 'LeeSeoyun'; 
}
@font-face {
    font-family: 'LeeSeoyun';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/LeeSeoyun.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
span{
	color:red;
	font-weight: bold;
}
input{
	font-size:1em;
	font-family: 'LeeSeoyun';
	width:300px;
	padding: 10px 20px;
	background: black;
	color:white;
}
input:hover{
	background: white;
	color:black;
}
</style>
</head>
<body>
	<div>
	결과
	<br/> 
	${param.x} + ${param.y} = <span>${param.x + param.y }</span>
	<br/>
	${param['x']} - ${param['y']} = <span>${param['x'] - param['y'] }</span>
	<br/>
	<input type = button value = 뒤로가기 onclick = 'history.go(-1)'>
	</div>
</body>
</html>