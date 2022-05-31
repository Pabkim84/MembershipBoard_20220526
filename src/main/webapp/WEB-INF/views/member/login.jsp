<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px">
    <div class="container"><h2>로그인</h2></div>
<form class="row g-3" style="margin: 20px auto auto 20px" action="/member/login" method="post">
    <div class="col-md-7">
        <label for="memberId" class="form-label">아이디</label>
        <input type="text" class="form-control" onblur="duplicateCheck()" id="memberId" placeholder="아이디를 입력하세요" name="memberId" required>
    </div>
    <div class="col-md-7">
        <label for="inputPassword1" class="form-label">비밀번호</label>
        <input type="password" class="form-control" onblur="passwordCheck()" id="inputPassword1" name="memberPassword" required>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary" value="로그인">로그인</button>
    </div>
</div>
</form>
</body>
</html>
