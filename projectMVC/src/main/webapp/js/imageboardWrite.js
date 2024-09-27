$(function(){
	$('#showImg').hide();
})
$('#camera').click(function(){
	$('#image1').trigger('click');	//강제 이벤트 발생 -> image1 아이디에 해당하는 곳이 클릭되는 이벤트
});
$('#image1').on('change',function(){
	let fileUrl = $(this)[0].files[0];
	if(fileUrl != null){
		$('#imageUrl').html(fileUrl.name);
		readURL(this);
		$('#showImg').show();
	}
	else{
		$('#imageUrl').html('선택된 파일 없음');
		$('#showImg').hide();
	}
});
function readURL(input){
	var reader = new FileReader();
	reader.onload = function(e){
		$('#showImg').attr('src',e.target.result);	//e.targetr - 이벤트가 발생하는 요소를 반환해준다
	}
	reader.readAsDataURL(input.files[0]);
}

$('#imageboardWriteBtn').click(function(){
	let formdata = new FormData($('#imageboardWriteForm')[0]);
	
	$.ajax({
		type:'post',
		enctype:'multipart/form-data',
		processData:false,
		contentType: false,
		url:'/projectMVC/imageboard/imageboardWriteAJax.do',
		data: formdata,
		success:function(){
			alert('이미지 등록 완료');
			location.href = "/projectMVC/imageboard/imageboardList.do?pg=1";
		},
		error:function(e){
			console.log(e);
		}
	});
});
