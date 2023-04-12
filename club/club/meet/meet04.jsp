<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.MemBean" %>
<%@ page import="club.SightBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.ListBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");

	int totalRecord = 0;
	int listSize = 0; 
	Vector<ListBean> vlist = null;
	Vector<MeetBean> vlistm = null;
	Vector<CodeBean> vlistc = null;
	
	String id = (String) session.getAttribute("idKey");
	MemBean nBean = mMgr.getMember1(id);
	
	int num = Integer.parseInt(request.getParameter("num"));
	MeetBean mBean = mMgr.getMeeting1(num);
	String grnum = mBean.getCode();
	String freq = mBean.getFreq();
	
	totalRecord = mMgr.getTotalMeet();
	
	Vector<MemBean> vlistb = null;
	vlistb = mMgr.getAdminList(grnum);
	listSize = vlistb.size();
	for (int i = 0; i < listSize; i++) {
		MemBean bean = vlistb.get(i);
		id = bean.getId();
		String name = bean.getName();
		String tel = bean.getTel();
		
		boolean result = mMgr.PartiList(grnum, freq, id);
		if (result) {
			System.out.println("존재하는 아이디 : " + id);
		} else {
			mMgr.InsertList(grnum, freq, id, name, tel);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>참여자 목록</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div align="center">
		<br><h2>참여자 목록</h2><br>
			<table align="center" width="600">
				<tr>
					<td>회원수 : <%=listSize%></td>
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
								num = bean.getNum();
								grnum = bean.getGrnum();
								freq = bean.getFreq();
								id = bean.getId();
								String name = bean.getName();
								String tel = bean.getTel();
								String parti = bean.getParti();
					%>
							<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=grnum%></td>
							<td align="center"><%=freq%></td>
							<td align="center"><%=id%></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=tel%></td>
							<td align="center"><%=parti%></td>
							</tr>
					<% 		} //for end%>	
						</table>
					<%	} %>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
	    		<br><input type="hidden" name="num"> 
	    		<input type="button" value="뒤로가기" onclick="history.go(-1)">
			</form>
		</div>	
	</body>
</html>