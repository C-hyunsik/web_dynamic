<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 97vh;
}
#wrap {
	height: center;
	border: 2px solid black;
	border-radius: 15px;
	padding: 5em;
}
h1 {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	margin-bottom: -0.5em;
}
span {
	display: flex;
	font-size: 15px;
	color: black;
	text-align: center;
	justify-content: center;
	margin-bottom: 1em;
	font-size: 24px;
}
table {
    border-collapse: collapse;
}
th, td{
    padding: 5px;
	color: black;
	font-size: 14px;
}
div{
    color: red;
    font-size: 8pt;
    font-weight: bold;
}
input[type="text"], input[type="password"] {
	border-style: none;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 0.4em;
	width: 250px;
}
input[type="button"], input[type="reset"] {
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 30px;
	border-style: none;
	border: 2px solid black;
}
input[type="button"]:hover, input[type="reset"]:hover {
	background: black;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="wrap">
<h1>
	<img src="../image/4.jpg" width="100" height="100" alt="홈" 
		 onclick="location.href='/memberMVC/index.do'" style="cursor: pointer;"> 
</h1>
<span>로그인</span>
<form id="loginForm">
	<table border="1">
		<tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
	        	<div id="idDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>비밀번호</th>
	        <td>
	        	<input type="password" name="pwd" id="pwd" size="40" placeholder="비밀번호 입력">
	        	<div id="pwdDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	    	<td colspan="2" align="center">
	    		<input type="button" value="로그인" id="loginBtn"/>
	    		<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'" />      
	    	</td>
	    </tr>
	</table>
</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#id').val() == '')
			$('#idDiv').html('아이디 입력');
		else if($('#pwd').val() == '')
			$('#pwdDiv').html('비밀번호 입력');
		else
			$.ajax({
				type: 'post',
				url: '/memberMVC/member/login.do',
				
				//data: 'id=' + $('#id').val() + '&pwd=' + $('#pwd').val(),
				data: {
					'id': $('#id').val(),
					'pwd': $('#pwd').val()
				},
				dataType: 'text', //서버로부터 받는 타입, 'text' or 'xml' or 'json'
				success: function(data){
					//alert(data.trim());
					
					if(data.trim() == 'fail')
						alert("아이디 또는 비밀번호가 틀렸습니다.")
					else {
						alert(data.trim()+"님 로그인");
						location.href = "/memberMVC/index.do";
					}
				},
				error: function(e){
					console.log(e);
				}
			});
	});
});
</script>
</body>
</html>