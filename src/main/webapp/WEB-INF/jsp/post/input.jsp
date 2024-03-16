<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 입력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section>
			<div class="container main">
				<h2 class="text-center pt-5">메모 입력</h2>
				<div class="d-flex mt-3">
					<label class="col-1" style="font-size:18px !important; font-weight:bold">제목 : </label>  
					<input type="text" class="form-control col-9" placeholder="제목을 입력해주세요" id="titleInput">
				</div>
					<textarea placeholder="내용을 입력해주세요" class="col-10 form-control mt-3" id="contentsInput"></textarea>
					<input type="file" class="mt-3 col-10">
				<div class="d-flex justify-content-between align-items-center mt-3 col-10">
					<a href="/post/list-view" class="btn btn-secondary">목록으로</a>
					<button type="button" class="btn btn-secondary" id="saveBtn">저장</button>
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
		
		$("#saveBtn").on("click", function(){
			let title = $("#titleInput").val();
			let contents = $("#contentsInput").val();
			
			if(title == ""){
				alert("제목을 입력해 주세요.");
				$("#titleInput").focus();
				return;
			}
			
			if(contents == ""){
				alert("내용을 입력해 주세요.");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:{"title":title, "contents":contents}
				, success:function(data){
					if(data.result == "success"){
						location.href="/post/list-view"
					} else{
						alert("메모 추가 실패");
					}
				}
				, error:function(){
					alert("메모 추가 에러")
				}
			});
			
		});
		
	});

</script>	

</body>
</html>