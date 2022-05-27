<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>게시글 작성</h2></div>

<form action="board/save">
        <input class="form-control" type="text" value="작성자: ${sessionScope.loginMemberId}" aria-label="boardWriter" readonly>
    <div class="mb-3">
        <label for="boardTitle" class="form-label">작성할 글제목</label>
        <input type="text" class="form-control" id="boardTitle" placeholder="글제목">
    </div>
    <div class="mb-3">
        <label for="boardContents" class="form-label">작성할 내용</label>
        <textarea class="form-control" id="boardContents" rows="3"></textarea>
    </div>
        <div class="mb-3">
            <input type="submit" class="form-control" value="글게시요청">
        </div>
</form>
</body>

</html>