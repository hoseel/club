<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String cPath = request.getContextPath();
	String id = (String)session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
		function loginCheck() {
			if (document.loginFrm.id.value == "") {
				alert("아이디를 입력해주세요");
				document.loginFrm.id.focus();
				return;
			}
			if (document.loginFrm.pw.value == "") {
				alert("비밀번호를 입력해주세요");
				document.loginFrm.pw.focus();
				return;
			}
			document.loginFrm.action = "<%=cPath%>/club/login/loginProc.jsp";
			document.loginFrm.submit();
		}
		function memberForm() {
			document.loginFrm.target = "content";
			document.loginFrm.action = "<%=cPath%>/club/member/member01.jsp";
			document.loginFrm.submit();
		}
	</script>
	
</head>
	<body>
		<div align="center"><br><br>
		<%
			if (id != null) { 
		%>
		<b><%=mBean.getName()%></b>[<%=id%>]님 환영합니다.
		<p>한국동호회에 오신것을<br>진심으로 환영합니다.</p>
		<p>한국동호회에는 다양한<br>동호회 모임이 존재합니다.</p>
		<p><%=mBean.getName()%>님께 알맞은<br>동호회를 찾아 즐거운 시간을<br>보내시길 바랍니다.</p>
		<a href="../login/logout.jsp">로그아웃</a>		
		<%
			} else {
		%>
		<form name="loginFrm" method="post" action="../login/loginProc.jsp">
		<table>
			<tr>
				<td align="center" colspan="2"><h2>로그인</h2></td>
			</tr>
			<tr>
				<td>아 이 디</td>
				<td><input name="id" size="15"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" size="15"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="right">
					<input type="button" value="로그인" onClick="loginCheck()">&nbsp;
					<input type="button" value="회원가입" onClick="memberForm()">
					</div>
				</td>
			</tr>
		</table>
		</form>
		<%
			}
		%>
		</div>
	</body>
</html>