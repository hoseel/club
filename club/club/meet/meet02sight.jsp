<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.SightBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	String sight = request.getParameter("sight");
	SightBean sBean = mMgr.getMeet1(sight);
	String s_code = sBean.getS_code();
	String sightname = sBean.getSight();
	String place = sBean.getPlace();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>명소</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div aling="left">
		<%
			out.println("명소코드 : " + s_code + "<br>");
			out.println("명소이름 : " + sightname + "<br>");
			out.println("명소장소 : " + place + "<br>");
		%>
		<a href="#" onclick="self.close()">[닫기]</a>
		</div>
	</body>
</html>