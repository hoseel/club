<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.SightBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.ListBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%@ page import="java.util.Vector" %>
<%
	int totalRecord = 0;	
	int listSize = 0;
	Vector<ListBean> vlist = null;
	
	String id = (String)session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
	
	int recnum = Integer.parseInt(request.getParameter("num1"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	MeetBean eBean = mMgr.getMeeting1(num);
	String grnum = eBean.getCode();
	String freq = eBean.getFreq();
	
	String check = request.getParameter("check");
	String perm1 = request.getParameter("perm1");
	String perm2 = request.getParameter("perm2");
	if (check == null) check = "N";
	if (perm1 == null) perm1 = "Z";
	if (perm2 == null) perm2 = "Z";
	
	if (perm2.equals("GG")) {
		mMgr.updateParti(recnum, perm1);
	}
	
	vlist = mMgr.getPartiList(grnum, freq);
	listSize = vlist.size();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>참여자 목록</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script>
	function meetlist(num, num1, parti){
		document.readFrm.num.value = num;
		document.readFrm.num1.value = num1;
		document.readFrm.perm1.value = parti;
		document.readFrm.perm2.value = "GG";
		document.readFrm.action = "meet05.jsp";
		document.readFrm.target = "content";
		document.readFrm.submit();
	}
	</script>
</head>
	<body>
		<div align="center">
		<br><h2>참여자 목록</h2><br>
			<table align="center" width="600">
				<tr>
					<td>회원수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
 						vlist = mMgr.getPartiList(grnum, freq);
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
						<table width="100%" cellpadding="2" border="1">
							<tr align="center" height="120%" bgcolor="#dde6d5">
								<td>번 호</td>
								<td>모임코드</td>
								<td>차 수</td>
								<td>아이디</td>
								<td>이 름</td>
								<td>전화번호</td>
								<td>참석여부</td>
							</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								ListBean bean = vlist.get(i);
								int num1 = bean.getNum();
								grnum = bean.getGrnum();
								freq = bean.getFreq();
								id = bean.getId();
								String name = bean.getName();
								String tel = bean.getTel();
								String parti = bean.getParti();
					%>
							<tr>
							<td align="center"><%=num1%></td>
							<td align="center"><%=grnum%></td>
							<td align="center"><%=freq%></td>
							<td align="center"><%=id%></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=tel%></td>
							<td align="center">
								<a href="javascript:meetlist('<%=num%>','<%=num1%>','<%=parti%>')"><%=parti%></a></td>
							</tr>
					<% 		} //for end%>	
						</table>
					<%	} %>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
				<input type="hidden" name="num">
				<input type="hidden" name="num1">
				<input type="hidden" name="perm1">
				<input type="hidden" name="perm2">
				<br><input type="button" value="뒤로가기" onclick="window.location.href='meet02.jsp'">
			</form>
		</div>
	</body>
</html>