<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"></div>
<div class="container">
    <h2>상세조회</h2>
    <table class="table table-hover mt-5">
        <tr>
            <th scope='col'>글번호</th>
            <th scope='col'>작성자</th>
            <th scope='col'>조회수</th>
            <th scope='col'>작성일자</th>
            <th scope='col'>파일첨부</th>
        </tr>
        <tr>
            <td>${boardDTO.id}</td>
            <td>${boardDTO.boardWriter}</td>
            <td>${boardDTO.boardHits}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${boardDTO.boardCreatedDate}"></fmt:formatDate></td>
            <td><c:choose>
                <c:when test="${boardDTO.boardFileName != null}">
                <img src="${pageContext.request.contextPath}/upload/${boardDTO.boardFileName}"
                     alt="" height="50" width="50"></td>
                </c:when>
            </c:choose>
            <td><button onclick="boardUpdate()">수정</button></td>
            <td><button onclick="boardDelete()">삭제</button></td>
            <td><button onclick="findAll()">목록</button></td>
        </tr>
        <tr>
            <th scope='col'>글제목</th>
            <td>${boardDTO.boardTitle}</td>
        </tr>
        <tr>
            <th scope='col'>글내용</th>
        </tr>
        <tr>
            <td>${boardDTO.boardContents}</td>
        </tr>
    </table>
</div>
<div class="container">
    <div id="comment-write" class="input-group mb-3">
        <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}" style="width: 30%" readonly>
        <input type="text" id="commentContents" class="form-control" placeholder="내용">
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>
    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>
$("#comment-write-btn").click(function (){
    // 댓글 작성자, 내용을 가져오고
    // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자, 내용, 글번호 이렇게
    // 세개의 값을 보내는 코드를 작성하십시오.
    const commentWriter = document.getElementById("commentWriter").value; //script 방식 id값 가져오기
    const commentContents = $("#commentContents").val(); //jquery 방식 id값 가져오기
    const boardId = '${boardDTO.id}';
    $.ajax({
        type: "post",
        url: "/comment/save",
        data: {"commentWriter": commentWriter,
            "commentContents": commentContents,
            "boardId": boardId
        },
        dataType: "json",
        success: function (result) {
            console.log(result);
            let output = "<table class='table'>";
            output +=   "<tr><th>댓글번호</th> ",
                output +=    "<th>작성자</th> ",
                output +=    "<th>내용</th> ",
                output +=    "<th>작성시간</th></tr>";
            for(let i in result) {
                output += "<tr>";
                output += "<td>" + result[i].id + "</td>";
                output += "<td>" + result[i].commentWriter + "</td>";
                output += "<td>" + result[i].commentContents + "</td>";
                output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                output += "</tr>";
            }
            output += "</table>";
            document.getElementById("comment-list").innerHTML = output;
            // document.getElementById("commentWriter").value='';
            document.getElementById("commentContents").value='';
        },
        error: function () {
            alert("실패");
        }
    })
})


const boardUpdate = () => {
    location.href = "/board/update?id=${boardDTO.id}";
}
const boardDelete = () => {
    location.href = "/board/delete?id=${boardDTO.id}";
}
const findAll = () => {
    location.href = "/board/findAll";
}
const paging = () => {
    location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
}
</script>
</html>
