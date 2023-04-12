<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.SightBean" %>
<jsp:useBean id="sMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 게시물의 수
	Vector<SightBean> vlist = null;
	Vector<CodeBean> vlistc = null;
	String id = (String) session.getAttribute("idKey");

	totalRecord = sMgr.getTotalSight();
	
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
	<title>모임관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function sight02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "sight02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function newSight() {
			url = "../sight/sight01.jsp";
			window
			.open(url, "CodeCheck", "width=650, height=400, scollbars=yes");
		}
	</script>
</head>
	<body>
		<div align="center">
		<br><h2>명소관리</h2><br>
			<table align="center" width="800">
				<tr width="100%">
					<td align="left"><input type="button" value="새로운 명소 등록" onclick="newSight()"></td>
					<td align="right">
					<form name="searchFrm" method="get" action="sight02.jsp" align="right">
						<table width="100%" cellpadding="4" cellspacing="0" align="right">
			 				<tr><td valign="bottom">
				   			<select name="keyField" size="1" >
				    			<option value="club"> 동호회</option>
				    			<option value="sight"> 명소이름</option>
				    			<option value="place"> 명소장소</option>
				   			</select>
			   				<input size="16" name="keyWord">
			   				<input type="button" value="검색하기" onclick="check()"></td>
			 				</tr>
						</table>
					</form></td>
				</tr>
				<tr></tr>
				<tr>
					<td><br>자료수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="800" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = sMgr.getSightList(check, keyWord, keyField);
						vlistc = sMgr.getCodeList("club");
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
						<table width="100%" cellpadding="2" border="1">
							<tr align="center" height="120%" bgcolor="#dde6d5">
								<td>번 호</td>
								<td>동호회</td>
								<td>등록자 이름</td>
								<td>명소 이름</td>
								<td>명소 장소</td>
								<td>비고</td>
								<td>수 정</td>
							</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								SightBean bean = vlist.get(i);
								int num = bean.getNum();
								String club = bean.getClub();
								String name = bean.getName();
								String sight = bean.getSight();
								String place = bean.getPlace();
								String note = bean.getNote();
								
					%>
							<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=club%></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=sight%></td>
							<td align="center"><%=place%></td>
							<td align="center"><%=note%></td>
							<td align="center">
								<a href="javascript:sight02Up('<%=num%>')">수 정</a></td>
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