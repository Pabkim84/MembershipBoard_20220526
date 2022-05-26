<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="bd-callout bd-callout-info" style="margin: 100px auto auto 20px"><h2>회원가입</h2></div>
<form class="row g-3" style="margin: 20px auto auto 20px" action="/member/save" method="post">
    <div class="col-md-7">
        <label for="memberId" class="form-label">아이디</label><span id="duplicate-idResult" style="margin-left: 20px"></span>
        <input type="text" class="form-control" onblur="duplicateCheck()" id="memberId" placeholder="아이디를 입력하세요" name="memberId" required>
    </div>
    <div class="col-md-7">
        <label for="inputPassword1" class="form-label">비밀번호</label><span id="passwordResult" style="margin-left: 20px"></span>
        <input type="password" class="form-control" onblur="passwordCheck()" id="inputPassword1" name="memberPassword" required>
    </div>
    <div class="col-md-7">
        <label for="inputPassword2" class="form-label">비밀번호 확인</label><span id="confirmResult" style="margin-left: 20px"></span>
        <input type="password" class="form-control" onblur="passwordConfirm()" id="inputPassword2" name="memberPassword2" required>
    </div>
    <div class="col-md-7">
        <label for="memberName" class="form-label">이름</label>
        <input type="text" class="form-control" id="memberName" placeholder="이름을 입력하세요" name="memberName" required>
    </div>
    <div class="col-md-7">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="text" class="form-control" id="inputEmail4" placeholder="이메일을 입력하세요" name="memberEmail" required>
    </div>
    <div class="col-md-7">
        <label for="memberMobile" class="form-label">전화번호</label><span id="mobileResult" style="margin-left: 20px"></span>
        <input type="text" class="form-control" onblur="mobileCheck()" id="memberMobile"placeholder="전화번호를 입력하세요" name="memberMobile" required>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary" value="회원가입">회원가입</button>
    </div>
</form>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const duplicateResult = document.getElementById("duplicate-idResult");
        console.log(memberId);
        $.ajax({
            type: "post",
            url: "/member/duplicate-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (result){
                if(result=="ok"){
                    duplicateResult.innerHTML = "(사용가능한 아이디입니다)";
                    duplicateResult.style.color = "green";
                } else {
                    duplicateResult.innerHTML = "(이미 사용중인 아이디입니다)";
                    duplicateResult.style.color = "red";
                }
            },
            error: function (){

            }
        })
    }
    const passwordCheck = () => {
      const id = document.getElementById("inputPassword1").value;
      const passwordResult = document.getElementById("passwordResult");
      const exp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-_!#$*])[A-Za-z\d-_!#$*]{8,12}$/
        if(id.match(exp)){
            passwordResult.innerHTML = "(조건에 적합한 비밀번호입니다)";
            passwordResult.style.color = "green";
        } else {
            passwordResult.innerHTML = "(조건에 맞지않는 비밀번호입니다)";
            passwordResult.style.color = "red";
        }
    }
		function mobileCheck() {
        const id = document.getElementById("memberMobile").value;
        const mobileResult = document.getElementById("mobileResult");
        const exp = /^\d{3}-\d{4}-\d{4}$/

        if(id.match(exp)){
            mobileResult.innerHTML = "(조건에 적합한 전화번호입니다)";
            mobileResult.style.color = "green";
        } else {
            mobileResult.innerHTML = "(조건에 맞지않는 전화번호입니다)";
            mobileResult.style.color = "red";
        }
    }
    const passwordConfirm = () => {
      const pw1 = document.getElementById("inputPassword1").value;
      const pw2 = document.getElementById("inputPassword2").value;
      const confirmResult = document.getElementById("confirmResult");
        if(pw1.match(pw2)){
            confirmResult.innerHTML = "(비밀번호가 일치합니다)";
            confirmResult.style.color = "green";
        } else {
            confirmResult.innerHTML = "(비밀번호가 일치하지 않습니다)";
            confirmResult.style.color = "red";
        }
    }

</script>
</html>
