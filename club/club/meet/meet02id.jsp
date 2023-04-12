<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	String id = request.getParameter("id");
	MemBean eBean = mMgr.getMember1(id);
	String name = eBean.getName();
	String tel = eBean.getTel();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div aling="left">
		<%
			out.println("아이디 : " + id + "<br>");
			out.println("이 름 : " + name + "<br>");
			out.println("연락처 : " + tel + "<br>");
		%>
		<a href="#" onclick="self.close()">[닫기]</a>
		</div>
	</body>
</html>