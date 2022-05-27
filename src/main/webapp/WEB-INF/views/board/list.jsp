<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>게시판</h2></div>

<c:choose>
    <c:when test="${sessionScope.loginMemberId != null}">
        <button type="button" class="btn btn-secondary btn-sm mt-5" onclick="newContents()">새 게시글작성</button>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>

    <table class="table table-hover mt-5">
        <thead>
        <tr>
            <th scope='col'>글번호</th>
            <th scope='col'>작성자</th>
            <th scope='col'>글제목</th>
            <th scope='col'>글내용</th>
            <th scope='col'>조회수</th>
            <th scope='col'>작성일자</th>
            <th scope='col'>파일첨부</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="memberList" items="${memberDTOList}">
            <tr>
                <td>${memberList.id}</td>
                <td>${memberList.memberId}</td>
                <td>${memberList.memberName}</td>
                <td>${memberList.memberEmail}</td>
                <td>${memberList.memberMobile}</td>
                <td>${memberList.memberProfileName}</td>
                <td><a href="#" onclick="findById('${memberList.id}')">조회</a></td>
                <td><a href="/member/delete?id=${memberList.id}">회원삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
<script>
    const newContents = () => {
      location.href = "/board/save";
    }
</script>
</html>
