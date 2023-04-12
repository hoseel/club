<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	String id = (String)session.getAttribute("idKey");
	String cPath = request.getContextPath();
	String url = "../member/member01.jsp";
	String urlg = "../index/main.jsp";
	String urlc = "../index/main.jsp";
	String urlp = "../index/main.jsp";
	String urls = "../index/main.jsp";
	String label = "회원가입";

	if (id == null) {
		label = "회원가입";
	} else if (id != null) {
		MemBean mBean = mMgr.getMember1(id);
		String memship = mBean.getMemship();
		
		label = "회원정보수정";
		url = "../member/member01Up.jsp";
		urlg = "../group/group02.jsp"; 
		urlc = "../code/code01.jsp";
		urlp = "../payment/payment01.jsp";
		urls = "../sight/sight02.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Korea Club - head</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<table width="100%" border="0">
			<tr>
				<td colspan="5">
					<a href="<%=cPath%>/club/index.jsp" target="_parent" onfocus="this.blur()";>
					<image height="90" src="../images/logo1.png"></a>
				</td>
			</tr>
			<tr>
				<td width="20%">&nbsp;</td>
				<td width="16%"><font size="3"><a href="<%=url%>" target="content"><b><%=label%></b></a></font></td>
				<td width="16%"><font size="3"><a href="<%=urlg%>" target="content"><b>단체현황</b></a></font></td>
				<td width="16%"><font size="3"><a href="<%=urlc%>" target="content"><b>코드입력</b></a></font></td>
				<td width="16%"><font size="3"><a href="<%=urlp%>" target="content"><b>출납입력</b></a></font></td>
				<td width="16%"><font size="3"><a href="<%=urls%>" target="content"><b>명소목록</b></a></font></td>
			</tr>
		</table>
	</body>
</html>