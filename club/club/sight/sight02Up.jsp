<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.SightBean" %>
<%@ page import="club.CodeBean" %>
<jsp:useBean id="sMgr" class="club.clubmgr" />
<%@ page import="java.util.Vector" %>
<%
	String id = (String)session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));

	SightBean sBean = sMgr.getsight(num);
	String name = sBean.getName();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>명소 내용 수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css" >
</head>
	<body>
	<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="sight02UpProc.jsp">
		<table aling="center" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#dde6d5">
								<td colspan="3"><h2>명소 내용 수정</h2></td>
							</tr>
							<tr>
								<td width="25%">순번</td>
								<td width="75%"><input name="num" size="5" value="<%=num%>" readonly></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input name="id" size="15" value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="name" size="15" value="<%=sBean.getName()%>" readonly></td>
							</tr>
							<tr>
								<td>동호회 선택</td>
								<td><select name="club">
								<option value="0" selected>선택하세요
								<%
									Vector<CodeBean> vlist = null;
									int listSize = 0;
									vlist = sMgr.getCodeList("club");
									listSize = vlist.size();
									if (vlist.isEmpty()) {
										out.println("등록된 자료가 없습니다.");
									} else {
										for (int i = 0; i < listSize; i++) {
											if (i == listSize) break;
											CodeBean bean = vlist.get(i);
											String assort = bean.getAssort();
								%>
								<option value="<%=assort%>"><%=assort%>
								<%		} // for
									} // if
								%>
								</select><script>document.regFrm.club.value="<%=sBean.getClub()%>"</script></td>
							</tr>
							<tr>
								<td>명소 이름</td>
								<td><input name="sight" size="15" value="<%=sBean.getSight()%>"></td>
							</tr>
							<tr>
								<td>명소 장소</td>
								<td><input name="place" size="30" value="<%=sBean.getPlace()%>"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input name="note" size="50" value="<%=sBean.getNote()%>"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit" value="등록하기">&nbsp;&nbsp;
								<input type="reset" value="다시쓰기">&nbsp;&nbsp;
								<input type="button" value="뒤로가기" onclick="history.back()">
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>