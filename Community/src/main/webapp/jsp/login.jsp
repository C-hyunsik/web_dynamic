<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String user_id = request.getParameter("user_id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT뉴스</title>
<style type="text/css">
body{
	margin:0;
	padding:0;
}
/* 뉴스 섹션 스타일 */
#container {
    background-color: #eaf3fc; /* 연한 파란색 배경 */
    padding: 20px;
    border-radius: 10px;
}

#container th {
    background-color: #007bff; /* 진한 파란색 배경 */
    color: #ffffff; /* 흰색 텍스트 */
    padding: 10px;
    text-align: left;
}

#container td {
    padding: 10px;
}

#news {
    list-style-type: none;
    padding: 0;
}

#news li {
    margin-bottom: 10px;
}

#news a {
    color: #007bff; /* 링크 색상 */
    text-decoration: none;
}

#news a:hover {
    text-decoration: underline;
}

/* 최신 게시글 섹션 스타일 */
#container .th_post {
    background-color: #007bff; /* 진한 파란색 배경 */
    color: #ffffff; /* 흰색 텍스트 */
    padding: 10px;
    text-align: left;
}

#container .td_post {
    padding: 10px;
}

#post_list {
    list-style-type: none;
    padding: 0;
}

#post_list li {
    margin-bottom: 10px;
}

#post_list a {
    color: #007bff; /* 링크 색상 */
    text-decoration: none;
}

#post_list a:hover {
    text-decoration: underline;
}
#post_title{
	color:white;
}
#post_title:hover{
	text-decoration: underline;
}
</style>
<link rel = stylesheet href = ../css/style.css>
</head>
<body>
	<div id = wrap>
		<div id = title>
			<h1>IT인들을 위한 포스트IT</h1>
		</div>
		<div id = menu>
		<ul class = menu>
		<li>
			<a href = #>뉴스</a>
			<ul class = sub>
				<li>
					<a href = #container>모바일</a>
				</li>
				<li>
					<a href = #container>인터넷/SNS</a>
				</li>
				<li>
					<a href = #container>보안/해킹</a>
				</li>
				<li>
					<a href = #container>컴퓨터</a>
				</li>
				<li>
					<a href = #container>통신</a>
				</li>
			</ul>
		</li>
		<li>
			<a href = #>게시판</a>
			<ul class = sub id = board>
				<li>
					<a href = #>핸드폰</a>
				</li>
				<li>
					<a href = #>노트북</a>
				</li>
				<li>
					<a href = #>컴퓨터</a>
				</li>
				<li>
					<a href = #>게임</a>
				</li>
			</ul>
		</li>
		<li>
			<a href = #>설정</a>
			<ul class = sub>
				<li id = mypage>
					<a href = #>마이페이지</a>
				</li>
				<li id = user_info>
					<a href = #>회원정보</a>
				</li>
				<li id = logout>
					<a href = #>로그아웃</a>
				</li>
			</ul>
		</li>
	</ul>
	</div>
	<div class="slider">
    	<div class="slides">
        	<div class="slide">
        		<figure>
        			<figcaption>오픈AI “챗GPT 주간 사용자 수 2억명…1년도 안 돼 두 배 늘어”</figcaption>
		        	<a href = "https://n.news.naver.com/mnews/article/030/0003235922">
		        		<img src="../image/chat_gpt.jpg" alt="news 3">
		        	</a>
	        	</figure>
        	</div>
        	<div class="slide">
        		<figure>
        			<figcaption>다음달 9일 '아이폰 16' 나온다…자체 AI 탑재는 10월로 밀릴듯</figcaption>
		        	<a href = "https://n.news.naver.com/article/015/0005026080?sid=105">
		        		<img src="../image/apple_news.jpg" alt="news 2">
		        	</a>
	        	</figure>
        	</div>
        	<div class="slide">
        		<figure>
        			<figcaption>메이플스토리, AI 합성 소재된 디렉터…이유는?</figcaption>
	        		<a href = "https://daily.hankooki.com/news/articleView.html?idxno=1112322">
	        			<img src="../image/do_anything.jpg" alt="news 1">
	        		</a>
	        	</figure>
        	</div>
        	<div class="slide">
        		<figure>
        		<figcaption>갤Z폴드6, 전작보다 안 팔려...AI 힘 안 됐다</figcaption>
	        		<a href = "https://n.news.naver.com/mnews/article/092/0002343844">
	        			<img src="../image/z-fold.png" alt="news 4">
	        		</a>
	        	</figure>
        	</div>
    	</div>
	</div>
		<form id = login action = ./write.jsp method = post>
			<fieldset>
				<input type="hidden" name="user_id" value="<%=user_id %>" />
				<div class = id><%=user_id %>님</div><br/><br/>
				<div class = post>게시글 수 : <span id = post_qty></span>개</div>
				<br/><br/>
				<div class = write>
					<input type = button value = 글쓰기 id = write onclick="openPopup()" />
				</div>
			</fieldset>
		</form>
	</div>
	<div id = container>
			<table>
				<tbody>
					<tr>
						<th>뉴스</th>
					</tr>
					<tr>
					<td>
						<ul id = news>
							<li><a href = https://n.news.naver.com/mnews/article/030/0003235922>
							오픈AI “챗GPT 주간 사용자 수 2억명…1년도 안 돼 두 배 늘어”</a></li>
							<li><a href = https://n.news.naver.com/article/015/0005026080?sid=105>
							다음달 9일 '아이폰 16' 나온다…자체 AI 탑재는 10월로 밀릴듯</a></li>
							<li><a href = https://daily.hankooki.com/news/articleView.html?idxno=1112322>
							메이플스토리, AI 합성 소재된 디렉터…이유는?</a></li>
							<li><a href = https://n.news.naver.com/mnews/article/092/0002343844>
							"갤Z폴드6, 전작보다 안 팔려...AI 힘 안 됐다"</a></li>
							<li><a href = https://n.news.naver.com/mnews/article/138/0002181200>
							KT클라우드, ‘백석 AI데이터센터’ 개관…차세대 냉각기술 도입</a></li>
							<li><a href = https://n.news.naver.com/mnews/article/015/0005027744>
							카톡에 "파이팅" 했더니 화면이 '깜짝'…패럴림픽 분위기 띄운다</a></li>
							<li><a href = https://n.news.naver.com/mnews/article/001/0014903215>
							양천구 "카톡채널 추가하면 '볼빵빵 해우리' 이모티콘 드려요"</a></li>
							<li><a href = https://www.fnnews.com/news/202408292315206504>
							"딥페이크? 호들갑 떤다"던 뻑가, 유튜브 수익 창출 정지 [1일IT템]</a></li>
							<li><a href = https://n.news.naver.com/article/092/0002343922?sid=105>
							KGDCon2024 개막…게임 개발자 위한 노하우 전한다</a></li>
							<li><a href = https://n.news.naver.com/article/092/0002343860?sid=105>
							삼성전자 AI 가전, '스마트 포워드'로 다양한 신기능 추가</a></li>
						</ul>
					</td>
					</tr>
					<tr>
						<th class = th_post><a id = post_title href = #>최신 게시글</a></th>
					</tr>
					<tr>
					<td class = td_post>
						<ul id = post_list>
						</ul>
					</td>
					</tr>
				</tbody>
			</table>
		</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('ul.menu > li > .sub').hide();
	
	$('ul.menu >').hover(function(){
		$(this).find('.sub').slideDown(300);
	}, function(){
		$(this).find('.sub').slideUp(300);
	});
	
	let user_id = '<%=user_id%>';
	$.post('../jsp/post_qty.jsp',{'user_id':user_id},function(data){
		XMLdata = $.parseXML(data)
		qty = eval($(XMLdata).find('qty').text());
		console.log(qty);
		$('#post_qty').html(qty)
	});
	
	$(document).ready(function(){
	    let slideIndex = 0;
	    const totalSlides = $('.slide').length;

	    function showNextSlide() {
	        slideIndex = (slideIndex + 1) % totalSlides;
	        $('.slides').css('transform', 'translateX(' + (-slideIndex * 960) + 'px)');
	    }

	    setInterval(showNextSlide, 3000); // 3초마다 슬라이드 이동 (2초 표시, 1초 전환)
	});
	
	$.get('../jsp/post_list.jsp', {}, function(data){
	    var items = $(data).find('item');

	    items.each(function() {
	        var no = $(this).find('no').text();
	        var title = $(this).find('title').text();
	        var logtime = $(this).find('logtime').text();
	        
	        var row = '<li><div style = "display:inline-block; width: 70px;">' + no + 
	       			  '</div><div style = "display:inline-block; width:300px;">' + 
	       			'<a href="javascript:void(0);" onclick="openPostViewPopup(' + no + ');">' + title + '</a></div>' + 
	       			  '<span style = "float:right;">' + logtime + '</span>' + '</li><hr/>';
	       			  
	        $('ul#post_list').append(row); // ul#post_list가 존재하는지 확인
	    });
	}).fail(function(e){
	    console.log("Error:", e);  // 실패 시 에러 출력
	});
	$('#write').click(function(){
		
	});
	
	 $('ul#board>li>a, #post_title').click(function(){
		 let user_id = '<%=user_id%>';
	     let url = './list.jsp?user_id=' + encodeURIComponent(user_id);
	     window.open(url); // 새 창에서 list.jsp 열기
	    });
	 
	$('#logout').click(function(){
		window.location.href = '../mainhtml/index.html';
	});
	$('#mypage, #user_info').click(function(){
		alert('준비 중인 서비스입니다.');
	});
});
function openPopup() {
    // 팝업창의 옵션 설정
    var width = 550;
    var height = 700;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    
    // 팝업창 열기
    var popup = window.open('', 'popupWindow', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);

    // 폼 객체 가져오기
    var form = document.getElementById('login');

    // 폼의 target을 팝업창으로 설정하고 제출
    form.target = 'popupWindow';
    form.submit();
}
function openPostViewPopup(post_no) {
    var width = 900;  // 팝업 창의 너비
    var height = 700; // 팝업 창의 높이
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var url = '../jsp/post_view_popup.jsp?post_no=' + post_no;

    window.open(url, 'postViewPopup', 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',scrollbars=yes');
}
</script>
</body>
</html>