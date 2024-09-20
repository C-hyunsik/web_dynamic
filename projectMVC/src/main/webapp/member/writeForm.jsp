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
	padding: 3em;
	border-radius: 15px;
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
th, td {
	padding: 5px;
	color: black;
	font-size: 14px;
}
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
input[type="text"], input[type="password"], input[type="email"] {
	border-style: none;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 0.4em;
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
		 onclick="location.href='/projectMVC/index.do'" style="cursor: pointer;"> 
</h1>
<span>회원가입</span>
<form id = writeForm name="writeForm" method="post" action="write.jsp">
	<table border="1">
		<tr>
	        <th width="100">이름</th>
	        <td>
	        	<input type="text" name="name" id="name" placeholder="이름 입력">
	        	<div id="nameDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
	        	<input type="hidden" id="check" value="">
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
	        <th>재확인</th>
	        <td>
	        	<input type="password" id="repwd" size="40" placeholder="비밀번호 입력">
	        	<div id="repwdDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>성별</th>
	        <td>
	        	<input type="radio" name="gender" value="M" checked="checked" />남자
	            <input type="radio" name="gender" value="F" />여자
	        </td>
	    </tr>
	    
	    <tr>
	        <th>이메일</th>
	        <td>
	        	<input type="email" name="email1">
	        	@
	        	<input type="text" name="email2" id="email2">
	        	
	        	<input type="email" name="email3" id="email3" list="email3_list" oninput="change()">        
	        	<datalist id="email3_list">
	        		<option value="직접입력"></option>
	                <option value="naver.com"/>
	                <option value="gmail.com"/>
	                <option value="daum.net"/>
	        	</datalist>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>휴대전화</th>
	        <td>
	            <select name="tel1">
	                <optgroup label="hp">
	                    <option value="010">010</option>
	                    <option value="011">011</option>
	                    <option value="019">019</option>
	                </optgroup>
	            </select>
		         -
		         <input type="text" name="tel2" size="4" maxlength="4">
		         -
		         <input type="text" name="tel3" size="4" maxlength="4">
			</td>
	    </tr>
	    
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<input type="text" name="zipcode" id="zipcode" size="6" readonly placeholder="우편번호">
	    		<button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br/>
	    		<input type="text" name="addr1" id="addr1" size="60" readonly placeholder="주소"><br/>
	    		<input type="text" name="addr2" id="addr2" size="60" placeholder="상세주소">
	    	</td>
	    </tr>
	    
	    <tr>
	    	<td colspan="2" align="center">
	    		<input id = writeBtn type="button" value="회원가입"/>
	    		<input type="reset" value="다시작성" />
	    	</td>
	    </tr>
	</table>
</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/member.js"></script>
</body>
</html>