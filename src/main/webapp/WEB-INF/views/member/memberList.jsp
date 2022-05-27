<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>회원목록</h2></div>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope='col'>회원 번호</th>
        <th scope='col'>회원 아이디</th>
        <th scope='col'>회원 이름</th>
        <th scope='col'>회원 이메일</th>
        <th scope='col'>회원 전화번호</th>
        <th scope='col'>회원 프로필사진</th>
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
<div id="detail"></div>
</body>
<script>
    const findById = (id) => {
        console.log(id);
        const detail = document.getElementById("detail");
        $.ajax({
            type: "get",
            url: "/member/findById",
            data: {"id": id},
            dataType: "json",
            success: function (result) {
                let output = "<table class='table table-hover'>";
                output += "<thead>";
                output += "<tr>" + 
                    "<th scope='col'>회원 번호</th>" +
                    "<th scope='col'>회원 아이디</th>" +
                    "<th scope='col'>회원 이름</th>" +
                    "<th scope='col'>회원 이메일</th>" +
                    "<th scope='col'>회원 전화번호</th>" +
                    "<th scope='col'>회원 프로필사진</th>" +
                    "</tr>";
                output += "<tr>";
                output += "<td>" + result.id                     + "</td>";
                output += "<td>" + result.memberId               + "</td>";
                output += "<td>" + result.memberName             + "</td>";
                output += "<td>" + result.memberEmail            + "</td>";
                output += "<td>" + result.memberMobile           + "</td>";
                output += "<td>" + result.memberProfileName      + "</td>";
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
