//회원가입 버튼을 클릭 했을 때 -> 중복체크 버튼 클릭 여부
/*document.getElementById("id").addEventListener("input", function() {
	isCheckId = false;	//중복체크 했던거 초기화
	document.getElementById("idDiv").innerHTML = "";
});*/
//중복체크 버튼을 안 누르면 alert('중복체크를 해주세요');
//중복체크 버튼을 눌렀는데 - 아이디 변경 후 회원가입 버튼 -> alert('중복체크를 해주세요');
function memberWrite() {
	exist = true;
	let name = document.getElementById("name").value;
	let id = document.getElementById("id").value;
	let pwd = document.getElementById("pwd").value;
	let checkpwd = document.getElementById("checkpwd").value;
	
	document.getElementById("nameDiv").innerHTML = "";
	document.getElementById("idDiv").innerHTML = "";
	document.getElementById("pwdDiv").innerHTML = "";
	document.getElementById("checkpwdDiv").innerHTML = "";
	if(!name){
		document.getElementById("nameDiv").innerHTML = "이름을 입력하세요.";
		exist = false;
	}
	if(!id){
		document.getElementById("idDiv").innerHTML = "아이디를 입력하세요.";
		exist = false;
	}
	if(!pwd){
		document.getElementById("pwdDiv").innerHTML = "비밀번호를 입력하세요.";
		exist = false;
	}
	//비밀번호 재확인 체크
	if(pwd != checkpwd){
		document.getElementById("checkpwdDiv").innerHTML = "비밀번호가 일치하지않습니다.";
		exist = false;
	}
	return exist;
}
//이메일 선택하면 @ 뒤에 자동입력
function change(){
	document.getElementById("email2").value = document.getElementById("email3").value;
}
//우편번호 - Daum API
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}