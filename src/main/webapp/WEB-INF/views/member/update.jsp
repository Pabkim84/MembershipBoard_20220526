<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 6:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>회원수정</h2></div>
<form class="row g-3" style="margin: 20px auto auto 20px" action="/member/update" method="post" name="updateForm">
    <input type="hidden" name="id" value="${memberUpdate.id}">
    <div class="col-md-7">
        <label for="memberId" class="form-label">아이디</label><span id="duplicate-idResult" style="margin-left: 20px"></span>
        <input type="text" class="form-control" id="memberId" value="${memberUpdate.memberId}" name="memberId" readonly>
    </div>
    <div class="col-md-7">
        <label for="inputPassword1" class="form-label">비밀번호</label><span id="passwordResult" style="margin-left: 20px"></span>
        <input type="password" class="form-control" id="inputPassword1" name="memberPassword" required>
    </div>
    <div class="col-md-7">
        <label for="memberName" class="form-label">이름</label>
        <input type="text" class="form-control" id="memberName" value="${memberUpdate.memberName}" name="memberName" readonly>
    </div>
    <div class="col-md-7">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="text" class="form-control" id="inputEmail4" value="${memberUpdate.memberEmail}" placeholder="이메일을 입력하세요" name="memberEmail" required>
    </div>
    <div class="col-md-7">
        <label for="memberMobile" class="form-label">전화번호</label><span id="mobileResult" style="margin-left: 20px"></span>
        <input type="text" class="form-control" value="${memberUpdate.memberMobile}" id="memberMobile"placeholder="전화번호를 입력하세요" name="memberMobile" required>
    </div>
    <div class="col-12">
        <input type="button" onclick="updateBtn()" class="btn btn-primary" value="회원수정">
    </div>
</form>
</body>
<script>
    const updateBtn = () => {
        const checkPw = document.getElementById("inputPassword1").value;
        const pw = '${memberUpdate.memberPassword}';
        if (checkPw == pw) {
            updateForm.submit();
        } else {
            alert("비밀번호를 확인하세요.")
        }
    }
</script>
</html>
