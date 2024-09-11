<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    int pg = Integer.parseInt(request.getParameter("pg"));
    Integer listpage = (Integer) session.getAttribute("boardPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style type="text/css">
table{
    border-collapse: collapse;
}
th{
    border-top:2px solid black;
    border-bottom:2px solid black;
}
#title, #hit{
    border-left: 1px solid gray;
    border-right: 1px solid gray;
}
#list td {
    border-bottom: 1px solid gray;
    padding: 5px;
}
#page{
    border-top:2px solid black;
    text-align: center;
    padding-top: 4px;
}
#list a:link{color: black; text-decoration:none;}
#list a:visited{color : gray; text-decoration:none;}
#list a:hover{color : red; text-decoration:underline;}
#list a:active{color : purple; text-decoration:none;}

#page a:link{color: black; text-decoration:none;}
#page a:visited{color : gray; text-decoration:none;}
#page a:hover{color : red; text-decoration:underline;}
#page a:active{color : purple; text-decoration:none;}

span{
	border: 1px solid gray;
	padding: 1px 6px;
	margin: 4px 3px;
}
#select{
	border: 1px solid black;
	font-weight: bold;
}
</style>
</head>
<body>
    <img src = "../image/chrome.jpg" width = 50 height = 50 alt = 홈 
    onclick = "location.href = '../index.jsp'" style = "cursor:pointer;" /><h2>글 목록</h2>
    <form>
        <table>
            <tr>
                <th width = 70>글번호</th>
                <th id = title width = 500>제목</th>
                <th width = 120>작성자</th>
                <th id = hit width = 70>조회수</th>
                <th width = 100>작성일</th>
            </tr>
            <tbody id="list">
            <!-- 글 목록 -->
            </tbody>
            <tr>
                <td colspan = 5 id = "page">
                <!-- 페이지 번호 -->
                </td>
            </tr>
        </table>
    </form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
    $.ajax({
        type: 'post',
        url: './boardList.jsp',
        data: {'pg': '<%=pg%>'},
        dataType:'text',
        success:function(data){
            let list = data.trim().split("\n"); // 각 게시물을 줄 단위로 나눔
            let listHtml = '';
            let pageHtml = '';
			//총 글수
            let totalPage = '<%=listpage%>';
            // 목록 출력
            list.forEach(function(item) {
                let fields = item.split("|");
                if(totalPage != 0){
	                listHtml +='<tr><td align = center>' + fields[0] + 
	                		'</td><td><a href="view.jsp?seq=' + fields[0] + '">' + fields[1] + 
	                		'</a></td><td align = center>' + fields[2] +
	                		'</td><td align = center>' + fields[3] + 
	                	   '</td><td>' + fields[4] + '</td></tr>';
		            $('#list').html(listHtml);
                }
                else{
                	alert('');
                }
	            });

            // 페이지 번호 출력
            for(let i = 1; i <= totalPage; i++){
                if (i == <%=pg%>) {
                    pageHtml += '<span id = select>' + i + '</span>';
                } else {
                    pageHtml += '<a href="boardListForm.jsp?pg=' + i +'"><span>' + i + '</span></a>';
                }
            }
            $('#page').html(pageHtml);
        },
        error:function(e){
            console.log(e);
        }
    });
});
</script>
</body>
</html>