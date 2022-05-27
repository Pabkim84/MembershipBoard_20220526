<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <c:forEach var="boardList" items="${boardDTOList}">
            <tr>
                <td>${boardList.id}</td>
                <td>${boardList.boardWriter}</td>
                <td>${boardList.boardTitle}</td>
                <td>${boardList.boardContents}</td>
                <td>${boardList.boardHits}</td>
                <td>${boardList.boardCreatedDate}</td>
                <td><a href="#" onclick="findById('${boardList.id}')">조회</a></td>
                <td><a href="/member/delete?id=${boardList.id}">회원삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<div id="detail"></div>

</body>
<script>
    const newContents = () => {
      location.href = "/board/save";
    }
    const findById = (id) => {
        console.log(id);
        const detail = document.getElementById("detail");
        $.ajax({
            type: "get",
            url: "/board/findById",
            data: {"id": id},
            dataType: "json",
            success: function (result) {
                let output = "<table class='table table-hover'>";
                output += "<thead>";
                output += "<tr>" +
                    "<th scope='col'>글번호</th>" +
                    "<th scope='col'>작성자</th>" +
                    "<th scope='col'>글제목</th>" +
                    "<th scope='col'>글내용</th>" +
                    "<th scope='col'>조회수</th>" +
                    "<th scope='col'>작성일자</th>" +
                    "<th scope='col'>파일첨부</th>" +
                    "</tr>";

                output += "<tr>";
                output += "<td>" + result.id                     + "</td>";
                output += "<td>" + result.boardWriter             + "</td>";
                output += "<td>" + result.boardTitle             + "</td>";
                output += "<td>" + result.boardContents           + "</td>";
                output += "<td>" + result.boardHits           + "</td>";
                output += "<td>" + result.boardFileName      + "</td>";
                output += "</tr>";
                output += "</thead>";
                output += "</table>";
                detail.innerHTML = output;
            },
            error: function () {
                alert("잘못된 값입니다")
            }
        })
    }
</script>
</html>
