<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.SightBean" %>
<%@ page import="club.GrBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%@ page import="java.util.Vector" %>
<%
	String id = (String)session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모임입력</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="meet01Proc.jsp">
			<table align="center" valign="middle">
				<tr><td align="center" valign="middle">
					<table border="1" cellpadding="2" align="center" width="600">
						<tr align="center" bgcolor="#dde6d5">
							<td colspan="2"><h2>모임 입력</h2></td>
						</tr>
						<tr>
						<td width="25%">동호회 선택</td>
						<td width="75%"><select name="code">
						<option value="0" selected>선택하세요
						<%
							Vector<GrBean> vlist = null;
							int listSize = 0;
							vlist = mMgr.getGroupList();
							listSize = vlist.size();
							if (vlist.isEmpty()) {
								out.println("등록된 자료가 없습니다.");
							} else {
								for (int i = 0; i < listSize; i++) {
									if (i == listSize) break;
									GrBean bean = vlist.get(i);
									String code = bean.getGrnum();
									String Grname = bean.getGrname();
						%>
						<option value="<%=code%>"><%=Grname%>
						<%		} // for
							} // if
						%>
						</select></td>
						</tr>
						<tr>
							<td>모임 관리자</td>
							<td><input name="id" size="15" value="<%=id%>" readonly></td>
						</tr>
						<tr>
							<td>차수</td>
							<td><input name="freq" size="15" placeholder="모임 차수 입력"></td>
						</tr>
						<tr>
							<td>명소 코드</td>
							<td><select name="s_code">
							<option value="0" selected>선택하세요
						<%
							Vector<SightBean> vlists = null;
							vlists = mMgr.getSight1();
							listSize = vlists.size();
							if (vlist.isEmpty()) {
								out.println("등록된 자료가 없습니다.");
							} else {
								for (int i = 0; i < listSize; i++) {
									if (i == listSize) break;
									SightBean bean = vlists.get(i);
									String s_code = bean.getS_code();
									String sight = bean.getSight();
						%>
						<option value="<%=s_code%>"><%=sight%>
						<%		} // for
							} // if
						%>
						</select></td>
						</tr>
						<tr>
							<td>모임 날짜</td>
							<td><input name="date" type="date" size="15" placeholder="모임 날짜 입력"></td>
						</tr>
						<tr>
							<td>모임 장소</td>
							<td><input name="place" size="15" placeholder="모임 장소 입력"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><input name="note" size="40"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="submit" value="등록하기">&nbsp;&nbsp;
							<input type="reset" value="다시쓰기">&nbsp;&nbsp;
							<input type="button" value="뒤로가기" onclick="history.back()">
						</tr>
					</table>
				</td></tr>
			</table>
		</form>
		</div>
	</body>
</html>