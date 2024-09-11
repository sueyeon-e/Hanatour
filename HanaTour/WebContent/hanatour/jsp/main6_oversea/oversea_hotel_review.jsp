<%@page import="dao.OverseaHotelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
   	int innIdx = Integer.parseInt(request.getParameter("innIdx"));
   	String content = request.getParameter("textarea_review_content");
   	String registDate = request.getParameter("registDate");
   	OverseaHotelDao oDao = new OverseaHotelDao();
   	oDao.registOverseaReview(reviewIdx, innIdx, content, registDate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		alert("등록되었습니다!");
	});
</script>
</head>
<body>

</body>
</html>