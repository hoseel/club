<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.GrBean" %>
<jsp:useBean id="gMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 게시물의 수
	Vector<GrBean> vlist = null;
	Vector<CodeBean> vlistc = null;
	String id = (String) session.getAttribute("idKey");

	totalRecord = gMgr.getTotalGroup();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>단체관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function group02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "group02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function group03De(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "group03De.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
	</script>
</head>
	<body>
		<div align="center">
		<br><h2>단체관리</h2><br>
			<table align="center" width="600">
				<tr>
					<td>자료수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = gMgr.getGroupList();
						vlistc = gMgr.getCodeList("club");
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
						<table width="100%" cellpadding="2" border="1">
							<tr align="center" height="120%" bgcolor="#dde6d5">
								<td>번 호</td>
								<td>동호회</td>
								<td>동호회 코드번호</td>
								<td>단체 이름</td>
								<td>단체 장소</td>
								<td>관리자 이름</td>
								<td>관리자 연락처</td>
								<td>수 정</td>
								<td>삭 제</td>
							</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								GrBean bean = vlist.get(i);
								int num = bean.getNum();
								String code = bean.getCode();
								String grnum = bean.getGrnum();
								String grname = bean.getGrname();
								String grplace = bean.getGrplace();
								String gradmname = bean.getGradmname();
								String gradmtel = bean.getGradmtel();
								
					%>
							<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=code%></td>
							<td align="center"><%=grnum%></td>
							<td align="center"><%=grname%></td>
							<td align="center"><%=grplace%></td>
							<td align="center"><%=gradmname%></td>
							<td align="center"><%=gradmtel%></td>
							<td align="center">
								<a href="javascript:group02Up('<%=num%>')">수 정</a></td>
							<td align="center">
								<a href="javascript:group03De('<%=num%>')">삭 제</a></td>
							</tr>
					<% 		} //for end%>	
						</table>
					<%	} %>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
			<br>
			<input type="hidden" name="num">
			</form>
		</div>
	</body>
</html>