<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script>
	$(function(){
		$("#btn1").click(function(){
	 		$.ajax({
	 			type: 'post',
	 			url: '<%= request.getContextPath() %>/fortest',

	 			success: function(response) {
	 				alert(response);
	 			},
	 			error: function(request,status,error) {
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
	 		});
	    });
	});
</script>
</head>
<body>
	<button id="btn1">버튼</button>
</body>
</html>