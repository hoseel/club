<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.MemBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.GrBean" %>
<%@ page import="club.DueBean" %>
<jsp:useBean id="dMgr" class="club.clubmgr" />
<%
	String id = (String) session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));
	DueBean dBean = dMgr.getDues(num);      //입력자료 가져오기
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회비수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
	<div align="center">
	<br><br>
	<form name="regFrm" method="post" action="due02UpProc.jsp">
	<table aling="center" cellpadding="5">
		<tr>
			<td align="center" valign="middle">
				<table border="1" cellpadding="2" align="center" width="600">
					<tr align="center" bgcolor="#dde6d5">
						<td colspan="3"><h2>회비수정</h2></td>
					</tr>
					<tr>
						<td width="25%">순번</td>
						<td width="75%"><input name="num" size="5" value="<%=num%>" readonly></td>
					</tr>
					<tr>
						<td>그룹 코드</td>
						<td><input name="grnum" size="15" value="<%=dBean.getGrnum()%>"></td>
					</tr>
					<tr>
						<td>납부자 아이디</td>
						<td><input name="id" size="15" value="<%=dBean.getId()%>" readonly></td>
					</tr>
					<tr>
						<td>납부 1회</td>
						<td><input name="du01" size="15" value="<%=dBean.getDu01()%>"></td>
					</tr>
					<tr>
						<td>납부 2회</td>
						<td><input name="du02" size="15" value="<%=dBean.getDu02()%>"></td>
					</tr>
					<tr>
						<td>납부 3회</td>
						<td><input name="du03" size="15" value="<%=dBean.getDu03()%>"></td>
					</tr>
					<tr>
						<td>납부 4회</td>
						<td><input name="du04" size="15" value="<%=dBean.getDu04()%>"></td>
					</tr>
					<tr>
						<td>납부 5회</td>
						<td><input name="du05" size="15" value="<%=dBean.getDu05()%>"></td>
					</tr>
					<tr>
						<td>납부 합계</td>
						<td><input name="dutot" size="15" value="<%=dBean.getDutot()%>"></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<input type="submit" value="수정완료">&nbsp;&nbsp; 
						<input type="reset" value="다시쓰기">&nbsp;&nbsp; 
						<input type="button" value="신규자료" onClick="">&nbsp;&nbsp;
						<input type="button" value="모임목록" onClick="history.go(-1)"></td>						
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	</div>
	</body>
</html>