<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.GrBean" %>
<%@ page import="club.DueBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	DecimalFormat df = new DecimalFormat("###,###.###");
	
	int totalRecord = 0;
	int listSize = 0;
	String id = (String) session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
	String grnum = mBean.getGrnum();
	int num = 0;
	
	Vector<MemBean> vlist = null;
	vlist = mMgr.getAdminList(grnum);
	listSize = vlist.size();
	for (int i = 0; i < listSize; i++) {
		MemBean bean = vlist.get(i);
		id = bean.getId();
		
		boolean result = mMgr.DuesList(grnum, id);
		if (result) {
			//System.out.println("존재하는 아이디 : " + id);
		} else {
			mMgr.DuessInsert(grnum, id);
		}
	}
	
	Vector<DueBean> vlistd = null;
	vlistd = mMgr.getDuesList(grnum);
	listSize = vlistd.size();
	for (int i = 0; i < listSize; i++) {
		DueBean bean = vlistd.get(i);
		num = bean.getNum();
		id = bean.getId();
		int du01 = bean.getDu01();
		int du02 = bean.getDu02();
		int du03 = bean.getDu03();
		int du04 = bean.getDu04();
		int du05 = bean.getDu05();
		int dutot = du01 + du02 + du03 + du04 + du05;
		
		mMgr.DuesUpdate(num, dutot);
	}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회비관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function due02Up(num){
		document.readFrm.num.value = num;
		document.readFrm.action = "due02Up.jsp";
		document.readFrm.target = "content";
		document.readFrm.submit();
	}
	</script>
</head>
	<body>
		<div align="center">
		<br><h2>회비관리</h2><br>
			<table align="center" width="600">
				<tr>
					<td>회비 납부 대상자 자료수 : <%=listSize%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
				<%
					vlistd = mMgr.getDuesList(grnum);
					listSize = vlistd.size();
					if (vlistd.isEmpty()) {
						out.println("등록된 자료가 없습니다.");
					} else {
				%>
					<table width="100%" cellpadding="2" border="1">
						<tr align="center" height="120%" bgcolor="#dde6d5">
							<td>번호</td>
							<td>그룹코드</td>
							<td>납부자아이디</td>
							<td>납부자이름</td>
							<td>1회</td>
							<td>2회</td>
							<td>3회</td>
							<td>4회</td>
							<td>5회</td>
							<td>합 계</td>
							<td>수 정</td>
						</tr>
				<%
						for (int i = 0; i < listSize; i++) {
							DueBean bean = vlistd.get(i);
							num = bean.getNum();
							grnum = bean.getGrnum();
							id = bean.getId();
							int du01 = bean.getDu01();
							int du02 = bean.getDu02();
							int du03 = bean.getDu03();
							int du04 = bean.getDu04();
							int du05 = bean.getDu05();
							int dutot = bean.getDutot();
							
							MemBean eBean = mMgr.getMember1(id);
							String name = eBean.getName();
							
							String du01_f = df.format(du01);
							String du02_f = df.format(du02);
							String du03_f = df.format(du03);
							String du04_f = df.format(du04);
							String du05_f = df.format(du05);
							String dutot_f = df.format(dutot);
				%>
						<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=grnum%></td>
							<td align="center"><%=id%></td>
							<td align="center"><%=name%></td>
							<td align="right"><%=du01_f%>원</td>
							<td align="right"><%=du02_f%>원</td>
							<td align="right"><%=du03_f%>원</td>
							<td align="right"><%=du04_f%>원</td>
							<td align="right"><%=du05_f%>원</td>
							<td align="right"><%=dutot_f%>원</td>
							<td align="center">
								<a href="javascript:due02Up('<%=num%>')">수 정</a></td>
						</tr>
				<%		} %>
					</table>
				<%	} %>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
			<input type="hidden" name="num"></form>
		</div>
	</body>
</html>