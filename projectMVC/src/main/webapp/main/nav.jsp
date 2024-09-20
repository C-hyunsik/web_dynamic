<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<c:set var = "context" value = "${pageContext.request.contextPath }" />

<style>
/* Container wrapping the nav elements */
#navWrap {
    margin: 0 auto;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    font-family: 'Nanum Gothic', sans-serif;
}

/* General button styling */
#navWrap input[type="button"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 5px;
    border: none;
    background-color: #4b0082; /* Deep indigo */
    color: #ffffff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Hover effect on buttons */
#navWrap input[type="button"]:hover {
    background-color: #ff7f50; /* Coral */
    transform: translateY(-2px); /* Lift effect */
}

/* Heading styling */
#navWrap h3 {
    margin-bottom: 20px;
    font-size: 20px;
    color: black;
}

/* Additional spacing between buttons */
#navWrap input + input {
    margin-top: 10px;
}

/* Responsive adjustments */
@media (max-width: 600px) {
    #navWrap {
        width: 100%;
        padding: 15px;
    }
    
    #navWrap input[type="button"] {
        font-size: 14px;
    }
}
a{text-decoration: none; color:black;}
</style>

<div id="navWrap">
    <c:if test="${memId == null}">
        <input type="button" value="로그인"
               onclick="location.href='${context}/member/loginForm.do'" /><br/><br/>
        <input type="button" value="회원가입"
               onclick="location.href='${context}/member/writeForm.do'" /><br/><br/>
    </c:if>
    <c:if test="${memId != null}">
        <h3><a href = "${context}/member/updateForm.do">${memName}</a>님</h3>
        <input type="button" value="로그아웃" id="logoutBtn" /><br/><br/>
        <input type="button" value="회원정보수정"
               onclick="location.href='${context}/member/updateForm.do'" /><br/><br/>
    </c:if>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    // 로그아웃
    $('#logoutBtn').click(function () {
        $.ajax({
            type: 'post',
            url: './member/logout.do',
            success: function () {
                location.href = "./index.do";
            },
            error: function (e) {
                console.log(e);
            }
        });
    });
</script>
