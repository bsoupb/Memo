<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="main">
			<div class="my-5">
				<h2 class="text-center">회원가입</h2>
				<div class="container d-flex justify-content-center">
					<div>
						<input type="text" class="form-control mt-2" placeholder="아이디" id="idInput">
						<input type="password" class="form-control mt-2" placeholder="비밀번호" id="passwordInput">
						<input type="password" class="form-control mt-2" placeholder="비밀번호 확인" id="passwordConfirmInput">
						<input type="text" class="form-control mt-2" placeholder="이름" id="nameInput">
						<input type="text" class="form-control mt-2" placeholder="이메일 주소" id="emailInput">
						<button type="button" class="form-control mt-2 btn btn-success" id="joinBtn">가입</button>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<script>
	
	$(document).ready(function(){
		$("#joinBtn").on("click", function(){
			
			// 입력된 값 가져오기
			// 유효성 검사
			
			var id = $("#idInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			if(id == ""){
				alert("아이디를 입력해 주세요.");
				return;
			}
			
			if(password == ""){
				alert("비밀번호를 입력해 주세요.");
				return;
			}
			
			if(password != passwordConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if(name == ""){
				alert("이름을 입력해 주세요.");
				return;
			}
			
			if(email == ""){
				alert("이메일을 입력해 주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/join"
				, data:{"loginId":id, "password":password, "name":name, "email":email}
				, success:function(data){
					if(data.result == "success"){
						// 로그인 페이지로 이동
						location.href = "/user/login-view"
					} else {
						alert("회원가입이 실패되었습니다.");
					}
				}
				, error:function(){
					alert("에러");
				}
			});
			
			
			
			
		});
	});

</script>

</body>
</html>