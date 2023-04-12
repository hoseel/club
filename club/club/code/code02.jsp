<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.CodeBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="cMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int listSize = 0;
	Vector<CodeBean> vlist = null;
	String check = request.getParameter("check");
	if (check == null) check = "all";

	
	String keyWord = "", keyField= "";
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
		check = "search";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>코드 확인하기</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script>
		function check() {
			document.searchFrm.action="code02.jsp";
			document.searchFrm.submit();
		 }
	</script>
</head>
	<body>
	<div align="center">
		<br><h2>코드 확인</h2><br>
		<form name="searchFrm" method="get" action="code02.jsp" align="center">
			<table width="100%" cellpadding="4" cellspacing="0" aling="center">
 				<tr><td valign="bottom">
	   			<select name="keyField" size="1" >
	    			<option value="disc"> 식별코드</option>
	    			<option value="assort"> 구&nbsp;&nbsp;분</option>
	   			</select>
   				<input size="16" name="keyWord">
   				<input type="button" value="검색하기" onclick="check()"></td>
 				</tr>
			</table>
		</form>
		<table align="center" width="400" cellpadding="3">
			<tr>
				<td align="center" colspan="3">
				<%
					vlist = cMgr.getCodeSearch(check, keyWord, keyField);
					listSize = vlist.size();
					if (vlist.isEmpty()) {
						out.println("등록된 자료가 없습니다.");
					} else {
				%>
					<table width="100%" cellpadding="2" border="1">
						<tr align="center" height="100%" bgcolor="#dde6d5"> 
						<td>식별코드</td>
						<td>코드</td>
						<td>구분</td>
						</tr>
				<%
						for(int i = 0; i < listSize; i++) {
							if (i == listSize) break;
							CodeBean bean = vlist.get(i);
							String disc = bean.getDisc();
							String code = bean.getCode();
							String assort = bean.getAssort();
				%>
						<tr>
						<td align="center"><%=disc%></td>
						<td align="center"><%=code%></td>
						<td align="center"><%=assort%></td>
						</tr>
				<%		} %>
					</table>
				<% } %>
				</td>
			</tr>
		</table>
		<input type="hidden" name="check" value="a">
	</div>
	</body>
</html>