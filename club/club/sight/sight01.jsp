<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="sMgr" class="club.clubmgr" />
<%
	String id = (String)session.getAttribute("idKey");

	MemBean mBean = sMgr.getMember1(id);
	String name = mBean.getName();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>코드 입력</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
<!-- 	<script>
	function send() {
		opener.location.reload();
	}
	</script>
-->
</head>
	<body onload="regFrm.sight.focus()">
		<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="sight01Proc.jsp">
		<table align="center" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center" valign="middle">
					<table border="1" cellsapcing="0" cellpadding="2" align="center" width="600">
						<tr align="center" bgcolor="#dde6d5">
							<td colspan="3"><h2>명소입력</h2></td>
						</tr>
						<tr>
							<td width="25%">아이디</td>
							<td width="75%"><input name="id" size="15" value="<%=id%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" size="15" value="<%=name%>"></td>
						</tr>
						<tr>
							<td>관련 동호회</td>
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
							%></select></td>
						</tr>
						<tr>
							<td>명소 이름</td>
							<td><input name="sight" size="15"></td>
						</tr>
						<tr>
							<td>명소 장소</td>
							<td><input name="place" size="30"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><input name="note" size="50"></td>
						</tr>
					</table>
					<span align="center">
						<br>
						<input type="submit" value="입력">&nbsp;&nbsp;
						<input type="reset" value="리셋">&nbsp; &nbsp;
						<input type="button" value="닫기" onclick="self.close()">
					</span>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</body>
</html>