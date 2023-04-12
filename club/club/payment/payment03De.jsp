<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean"%>
<%@ page import="club.CodeBean"%>
<%@ page import="club.PayBean"%>
<jsp:useBean id="pMgr" class="club.clubmgr"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출납내역삭제</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String cPath = request.getContextPath();
	
		PayBean pBean = pMgr.getPayment1(num);
		String id = pBean.getId();
		MemBean mBean = pMgr.getMember1(id);
	    
		if (request.getParameter("pass") != null) {
			String inPass = request.getParameter("pass");
			String dbPass = mBean.getPw();
			if (inPass.equals(dbPass)) {
				pMgr.deletePayment(num);
				String url = "payment02.jsp";
				response.sendRedirect(url);
			} else {
	%>
	<script type="text/javascript">
		alert("입력하신 비밀번호가 아닙니다.");
		history.back();
	</script>
	<%		}
		} else { %>
	<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
	</script>
</head>
	<body aling="center">
		<div align="center">
		<br><br>
		<table width="500" cellpadding="3">
			<tr>
				<td height="20" align="center">
				사용자의 비밀번호를 입력해주세요.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="payment03De.jsp">
			<table width="300" cellpadding="1" align="center">
				<tr>
					<td>번호</td>
					<td><%=pBean.getNum()%></td>
				</tr>
				<tr>
					<td>입력 아이디</td>
					<td><%=pBean.getId()%></td>
				</tr>
				<tr>
					<td>거래 일자</td>
					<td><%=pBean.getDate()%></td>
				</tr>
				<tr>
					<td>거래 항목</td>
					<td><%=pBean.getInorex()%></td>
				</tr>
				<tr>
					<td colspan="2"><hr size="1" color="#eeeeee"/></td>
				</tr>
			</table>
			</table>
			<table width="200" align="center">
				<tr>
					<td>
					<input type="password" name="pass" size="17" maxlength="15"></td>
				</tr>
				<tr>
					<td><br>
					<input type="button" value="삭제완료" onClick="check()"> 
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onClick="history.go(-1)"></td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num%>">
		</form>
		</div>
	<% } %>
	</body>	
</html>