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

<h2>update.jsp</h2>
<form action="/board/update" method="post" name="updateForm">
    글번호: <input type="text" name="id" value="${boardUpdate.id}" readonly><br>
    글제목: <input type="text" name="boardTitle" value="${boardUpdate.boardTitle}" style="width: 300px"><br>
    글비번: <input type="text" name="boardPassword" id="passwordConfirm"><br>
    작성자: <input type="text" name="boardWriter" value="${boardUpdate.boardWriter}" readonly><br>
    글내용:<br><textarea name="boardContents" rows="10" cols="50">${boardUpdate.boardContents}</textarea><br>
    <input type="button" value="정보수정" onclick="boardUpdate()">
</form>
</body>
<script>
    const boardUpdate = () => {
        // const passwordConfirm = document.querySelector("#passwordConfirm").value;
        const passwordConfirm = document.getElementById("passwordConfirm").value;
        const passwordDB = '${boardUpdate.boardPassword}';
        if(passwordConfirm == passwordDB){
            updateForm.submit();
        } else {
            alert("비밀번호가 맞지 않습니다.");
        }

    }
</script>
</html>
