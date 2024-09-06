$(function (){
	$('#join').submit(function(){
		let user_id = $('input[name = "user_id"]').val();
		let user_pw = $('input[name = "user_pw"]').val();
		let email = $('input[name = "email"]').val();
		let url = $('input[name = "url"]').val();
		let phone = $('input[name = "phone"]').val();
		//if(!user_id){
		if(user_id == ''){
			alert("아이디를 입력하세요.");
			$('input[name = user_id]').focus();
			return false;
		}
		if(!user_pw){
			alert("비밀번호를 입력하세요.");
			$('input[name = user_pw]').focus();
			return false;
		}
		
		if(!$('input[name="gender"]').is(':checked')){
			alert("성별을 선택하세요.");
			
			//focus 불가 기본값 남자 선택
			//radio는 배열로 받는다		남자:gender[0], 여자:gender[1]
			//document.form1.gender[0].checked = true;	//name속성, javascript
			$('input[name = "gender"]:eq(0)').attr('checked', true)	//jQuery, attribute
//									   .prop	//->property
			return false;
		}
		
		if(!email){
			alert("이메일를 입력하세요.");
			$('input[name = email]').focus();
			return false;
		}
		if(!url){
			alert("url를 입력하세요.");
			$('input[name = url]').focus();
			return false;
		}
		if(!phone){
			alert("핸드폰를 입력하세요.");
			$('input[name = phone]').focus();
			return false;
		}
		if(!$('input[name="hobby"]').is(':checked')){
			alert("취미을 선택하세요.");
			$('input[name = "hobby"]:eq(1)').attr('checked', true)
			return false;
		}
		if($('select[name="job"] > option:selected').index() == 0){
			alert("직업을 선택하세요.");
			$('select[name = "job"] > option:eq(1)').attr('selected', true)
			return false;
		}
		//입력한 내용을 화면에 출력
		let gender = $('input[name = "gender"]:checked').val();
		let hobby = $('input[name = "hobby"]:checked')	//여러개
		let hoddy_val = '';
		hobby.each(function(){
			hoddy_val += $(this).val() + ", "
		});
		
		let job = $('select[name = "job"]> option:selected').val();
		
		let result = `<ul>
						<li>아이디 : ${user_id}</li><br/> 
						<li>비밀번호 : ${user_pw}</li><br/>
						<li>성별 : ${gender}</li><br/>
						<li>이메일 : ${email}</li><br/>
						<li>url : ${url}</li><br/>
						<li>핸드폰 : ${phone}</li><br/>
						<li>취미 : ${hoddy_val}</li><br/>
						<li>직업 : ${job}</li>`;
		$('body').html(result);
		return false;	//페이지 이동 막기
	});
});