<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = null;
	String id = null;
	
	name = (String)session.getAttribute("memName");	//자식 = (자식)부모
	id = (String)session.getAttribute("memId");	//자식 = (자식)부모
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
	onclick = "location.href = '../index.jsp'" style = "cursor:pointer;" /><br/>회원정보
</h3>
<form name = memberWriteForm>
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
			<td><input id = id type = text name = id placeholder = "아이디 입력" readonly />
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
				<input type = radio name = gender value = "M" disabled />남자
				<input type = radio name = gender value = "F" disabled />여자
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input id = email1 type = email name = email1 /> @ 
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
				<input id = updateBtn type = button value = 회원정보수정 />
				<input id = resetBtn type = button value = 다시입력 />
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "../js/member2.js"></script>
<script type="text/javascript">
$(function(){
    $.ajax({
        type: 'post',
        url: './userInfo.jsp',
        data: {
            'name': '<%=name%>',
            'id': '<%=id%>'
        },
        dataType: 'text',
        success: function(data) {
            result = data.trim().split("|");
			$('#name').prop('value',result[0]);
			$('#id').prop('value',result[1]);
			if(result[2] == 'M'){
				$('input[value = M]').prop('checked','checked');				
			}
			else{
				$('input[value = F]').prop('checked','checked');
			}
			$('#email1').prop('value',result[3]);
			$('#email2').prop('value',result[4]);
			$('#email3').prop('value',result[4]);
			if(result[5] == '010'){
			    $('option[value="010"]').prop('selected', true);				
			}
			else if(result[5] == '011'){
			    $('option[value="011"]').prop('selected', true);
			}
			else if(result[5] == '019'){
			    $('option[value="019"]').prop('selected', true);
			}
			$('#tel2').prop('value',result[6]);
			$('#tel3').prop('value',result[7]);
			$('#zipcode').prop('value',result[8]);
			$('#addr1').prop('value',result[9]);
			$('#addr2').prop('value',result[10]);
        },
        error: function(e) {
            console.log(e);
        }
    });
    $('#updateBtn').click(function(){
    	let exist = memberWrite();
    	if(exist){
	    	$.ajax({
	    		type:'post',
	    		url:'./memberUpdate.jsp',
	    		data:$("form[name=memberWriteForm]").serialize(),
	    		dataType:'text',
	    		success:function(data){
	    			result = data.trim();
	    			if(result){
	    				location.href = './memberLogout.jsp';
	    			}
	    			else{
	    				alert('정보 수정 실패');
	    			}
	    		},
	    		error:function(e){
	    			console.log(e);
	    		}
	    	});
    	}
    	else{
    		return false;
    	}
    });
    $('#resetBtn').click(function(){
    	location.reload();
    });
});
</script>
</body>
</html>