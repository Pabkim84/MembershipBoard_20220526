<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px">
    <div class="container"><h2>글수정</h2>
<form action="/board/update" method="post" name="updateForm">
    글번호: <input type="text" name="id" value="${boardUpdate.id}" style="width: 330px" readonly><br>
    글제목: <input type="text" name="boardTitle" value="${boardUpdate.boardTitle}" style="width: 330px"><br>
    작성자: <input type="text" name="boardWriter" value="${boardUpdate.boardWriter}" style="width: 330px" readonly><br>
    글내용:<br><textarea name="boardContents" rows="10" cols="50">${boardUpdate.boardContents}</textarea><br>
    <input type="submit" class="btn btn-primary" value="정보수정" onclick="boardUpdate()">
</form>
</div></div>
</body>
</html>
