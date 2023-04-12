<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%	
	String id = (String)session.getAttribute("idKey");
	String urlg = "../group/group01.jsp";
	String urlm = "../member/member02.jsp?num=0";
	String urlp = "../payment/payment02.jsp";
	String urle = "../meet/meet02.jsp";
	String urld = "../dues/due02.jsp";
/*
	if (id != null) {
		MemBean mBean = mMgr.getMember1(id);
		String memship = mBean.getMemship();
		
		if (memship.equals("basic")) {
		urlg = "../index/main.jsp";
		}
	} else {
		urlg = "../index/main.jsp";
		urlm = "../index/main.jsp";
		urlp = "../index/main.jsp";
		urle = "../index/main.jsp";
		urld = "../index/main.jsp";
	}
*/
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Korea Club - left</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body leftmargin="0" topmargin="0" bgcolor="#D9E5FF">
		<jsp:include page="../login/login.jsp" />
		<br><br><br><br>
		<div align="center"><a href="<%=urlm%>" target="content">회원관리</a>
		<br><br>
		<a href="<%=urlg%>" target="content">단체입력</a>
		<br><br>
		<a href="<%=urlp%>" target="content">출납관리</a>
		<br><br>
		<a href="<%=urle%>" target="content">모임관리</a>
		<br><br>
		<a href="<%=urld%>" target="content">회비관리</a>
		</div>
	</body>
</html>