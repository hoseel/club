<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.GrBean" %>
<jsp:useBean id="gMgr" class="club.clubmgr" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>단체 내역 삭제</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String cPath = request.getContextPath();
		
		GrBean gBean = gMgr.getGroup2(num);
		gMgr.deleteGroup(num);
	%>
	<script type="text/javascript">
	function check() {
		alert("자료를 삭제하였습니다");
		document.delFrm.submit();
		location.href="group02.jsp";
	}
	</script>
</head>
	<body>
	<div align="center">
	<br><br>
	<table width="400" cellpadding="3">
		<tr>
			<td height="21" align="center">자료를 삭제합니다.</td>
		</tr>
	</table>
	<form name="delFrm" method="post" action="cost03De.jsp">
		<table width="400" cellpadding="2">
			<tr>
				<td align="center">
					<table>
						<tr>
							<td>번호</td>
							<td><%=gBean.getNum()%></td>
						</tr>
						<tr>
							<td>동호회</td>
							<td><%=gBean.getCode()%></td>
						</tr>
						<tr>
							<td>동호회 코드번호</td>
							<td><%=gBean.getGrnum()%></td>
						</tr>
						<tr>
							<td>단체 이름</td>
							<td><%=gBean.getGrname()%></td>
						</tr>
						<tr>
							<td>관리자 이름</td>
							<td><%=gBean.getGradmname()%></td>
						<tr>
							<td><hr size="1" color="#eeeeee"/></td>
						</tr>
						<tr align="center">
							<td align="center">
							<input type="button" value="삭제" onClick="check()"> 
							<input type="reset" value="리셋">
							<input type="button" value="뒤로" onClick="history.go(-1)"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num%>">
	</form>
	</div>
	</body>
</html>