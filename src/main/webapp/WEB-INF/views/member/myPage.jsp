<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>myPage</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>마이페이지</h2></div>
<div class="container">
<table class="table table-hover">
    <tr>
        <th>아이디</th>
        <th>작성자</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>첨부파일</th>
    </tr>
        <tr>
            <td>${memberDTO.memberId}</td>
            <td>${memberDTO.memberName}</td>
            <td>${memberDTO.memberEmail}</td>
            <td>${memberDTO.memberMobile}</td>
            <td>
                <img src="${pageContext.request.contextPath}/upload/${memberDTO.memberProfileName}"
                     alt="" height="50" width="50">
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><button class="btn btn-primary" onclick="memberUpdate()">수정</button>
                <button class="btn btn-primary" onclick="memberDelete()">회원탈퇴</button></td>

        </tr>
</table>
</div>
</body>
<script>
    const memberUpdate = () => {
        location.href = "/member/update?id=${memberDTO.id}";
    }
    const memberDelete = () => {
        location.href = "/member/delete?id=${memberDTO.id}";
    }
</script>
</html>
