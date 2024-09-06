<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
th{
	text-align:left;
}
input[type = button]{
	margin: 10px 0;
}
#loginCheck{
	color:red;
	font-size:8pt;
}
</style>
</head>
<body>
<h3>
	<img src = "../image/chrome.jpg" width = 50 height = 50 alt = 홈
	onclick = "location.href = '../index.jsp'" style = "cursor:pointer;" /><br/>로그인
</h3>
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input id = loginId type = text name = loginId size = 15 />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input id = loginPwd type = password name = loginPwd />
				</td>
			</tr>
			<tr>
				<td colspan = 2>
					<div id = loginCheck></div>
				</td>
			</tr>
			<tr>
				<td colspan = 2 align = center>
					<input type = button value = 로그인 id = loginBtn />
					<input type = button value = 회원가입 onclick = "location.href = './memberWriteForm.jsp'" />
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$('#loginCheck').empty()
		
		if($('#loginId').val()=='')
			$('#loginCheck').html('아이디 입력')
		else if($('#loginPwd').val()=='')
			$('#loginCheck').html('비밀번호 입력')
		else
			$.ajax({
				type:'post',
				url:'memberLogin.jsp',
				//data:'loginId=' + $('#loginId').val() + '&loginPwd=' + $('#loginPwd').val(),
				data:{
					'loginId':$('#loginId').val(),
					'loginPwd':$('#loginPwd').val()
				},
				dataType:'text',	//서버로부터 받는 타입
				success: function(data){
					result = data.trim().split("|");
					if(result == 'fail'){
						$('#loginCheck').html('아이디 또는 비밀번호가 틀렸습니다.');
					}
					else{
						//cookies = document.cookie.split(";");
						alert("로그인 성공(≧∇≦)ﾉ \n" + result[0] +"님 로그인\n" + "id : " + result[1]);
						location.href = result[2];
					}
				},
				error:function(e){
					console.log(e);
				}
			});
	});
});
</script>
<!-- <script type="text/javascript">
function memberLogin(){
	let loginId = document.getElementById('loginId').value;
	let loginPwd = document.getElementById('loginPwd').value;
	document.getElementById('loginCheck').innerHTML = "";
	if(!loginId || !loginPwd){
		document.getElementById('loginCheck').innerHTML = "아이디 또는 비밀번호를 입력해주세요.";
		return false;
	}
	document.querySelector("form").submit();
}
</script> -->
</body>
</html>