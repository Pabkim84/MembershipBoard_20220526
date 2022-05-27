<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login-failed</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>로그인실패</h2></div>
    로그인에 실패하였습니다.
    아이디와 비밀번호를 다시 확인하세요.
</div>
<button class="btn btn-primary" type="button" onblur="returnLogin()">로그인</button>
</body>
<script>
    const returnLogin = () => {
        location.href = "/member/login";

    }
</script>
</html>
