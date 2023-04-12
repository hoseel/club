<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.GrBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	String group = request.getParameter("group");
	GrBean gBean = mMgr.getMeet(group);
	String code = gBean.getCode();
	String name = gBean.getGrname();
	String place = gBean.getGrplace();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div aling="left">
		<%
			out.println("그룹코드 : " + code + "<br>");
			out.println("그룹이름 : " + name + "<br>");
			out.println("그룹장소 : " + place + "<br>");
		%>
		<a href="#" onclick="self.close()">[닫기]</a>
		</div>
	</body>
</html>