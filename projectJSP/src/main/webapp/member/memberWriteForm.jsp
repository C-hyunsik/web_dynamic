<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border-collapse: collapse;
}
td, th{
	padding: 5px;
}
#id{
	width: 200px;
}
#pwd, #checkpwd{
	width:250px;
}
#email{
	width: 170px;
}
#telsel{
	width:60px;
}
#tel2, #tel3{
	width:50px;
}
#addr1, #addr2{
	width:400px;
}
input[value = "회원가입"], input[value = "다시입력"]{
	margin: 2px 0;
}
div{
	font-size:8pt;
	font-weight:bold;
	color:red;
}
</style>
</head>
<body>
<h3>
	<img src = "../image/chrome.jpg" width = 50 height = 50 alt = 홈 
	onclick = "location.href = '../index.jsp'" style = "cursor:pointer;" /><br/>회원가입
</h3>
<form name = memberWriteForm method = post action = "./memberWrite.jsp">
	<table border = 1>
		<tr>
			<th width = 100>이름</th>
			<td>
				<input id = name type = text name = name placeholder = "이름 입력" />
				<div id = nameDiv></div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input id = id type = text name = id placeholder = "아이디 입력" />
				<input type = button value = 중복체크 onclick = "checkId()"/>
				<input type = hidden name = check id = check value = "" />
				<div id = idDiv></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input id = pwd type = password name = pwd placeholder = "비밀번호 입력" />
				<div id = pwdDiv></div>
			</td>
		</tr>
		<tr>
			<th>재확인</th>
			<td>
				<input id = checkpwd type = password name = repwd placeholder = "비밀번호 입력" />
				<div id = checkpwdDiv></div>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type = radio name = gender value = "M" checked />남자
				<input type = radio name = gender value = "F" />여자
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type = email name = email1 /> @ 
				<input id = email2 type = email name = email2 />
				<input id = email3 type = email name = email3 list = email3_list oninput = "change()" />
				<datalist id = email3_list>
					<option value = 직접입력 />
					<option value = hanmail.net />
					<option value = naver.com />
					<option value = gmail.com />
				</datalist>
			</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>
			<select id = telsel name = tel1>
				<option value = 010>010</option>
				<option value = 011>011</option>
				<option value = 019>019</option>
			</select> - 
			<input id = tel2 type = text name = tel2 maxlength = 4 /> - 
			<input id = tel3 type = text name = tel3 maxlength = 4 />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type = text name = zipcode id = zipcode readonly placeholder = "우편번호" />
				<button type = button onclick = "checkPost()">우편번호 검색</button><br/>
				<input id = addr1 type = text name = addr1 placeholder = 주소 /><br/>
				<input id = addr2 type = text name = addr2 placeholder = 상세주소 />
			</td>
		</tr>
		<tr>
			<td colspan = 2 align = center>
				<input type = button value = 회원가입 onclick = "memberWrite()" />
				<input type = reset value = 다시입력 />
			</td>
		</tr>
	</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "../js/member.js"></script>
</body>
</html>