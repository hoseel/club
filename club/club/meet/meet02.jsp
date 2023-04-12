<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.MemBean" %>
<%@ page import="club.SightBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.GrBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 게시물의 수
	Vector<MeetBean> vlistm = null;
	Vector<CodeBean> vlistc = null;
	String id = (String) session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
	
	int num = 0;
	
	totalRecord = mMgr.getTotalMeet();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>모임관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function meet02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "meet02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		/*04번이 명단=참여자 명단 강사님꺼는 c*/
		function meet04(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "meet04.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		/*05번이 현황=리스트? 무슨 참여리스트이런건가? 강사님은 list*/
		function meet05(num) {
			document.readFrm.num.value = num;
			document.readFrm.num1.value = 0;
			document.readFrm.action = "meet05.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function meet02id(id){
			url = "meet02id.jsp?id=" + id;
			window.open(url, "meet02id", "width=300, height=300, scrollbars=yes");
		}
		function meet02group(group){
			url = "meet02group.jsp?group=" + group;
			window.open(url, "meet02group", "width=300, height=300, scrollbars=yes");
		}
		function meet02sight(sight){
			url = "meet02sight.jsp?sight=" + sight;
			window.open(url, "meet02sight", "width=300, height=300, scrollbars=yes");
		}
	</script>
</head>
	<body>
		<div align="center">
		<br><h2>모임관리</h2><br>
			<table align="center" width="600">
				<tr>
					<td>자료수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
 						vlistm = mMgr.getMeet();
						listSize = vlistm.size();
						if (vlistm.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
						<table width="100%" cellpadding="2" border="1">
							<tr align="center" height="120%" bgcolor="#dde6d5">
								<td>번 호</td>
								<td>관리자</td>
								<td>그룹코드</td>
								<td>그룹이름</td>
								<td>명소코드</td>
								<td>명소이름</td>
								<td>차 수</td>
								<td>날 짜</td>
								<td>장 소</td>
								<td>명 단</td>
								<td>현 황</td>
								<td>수 정</td>
							</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								MeetBean bean = vlistm.get(i);
								num = bean.getNum();
								String ide = bean.getId();
								String grnum = bean.getCode();
								String freq = bean.getFreq();
								String s_code = bean.getS_code();
								String date = bean.getDate();
								String place = bean.getPlace();
								
								GrBean gBean = mMgr.getMeet(grnum);
								String grname = gBean.getGrname();
								SightBean sBean = mMgr.getMeet1(s_code);
								String sight = sBean.getSight();
					%>
							<tr>
							<td align="center"><%=num%></td>
							<td align="center">
								<a href="javascript:meet02id('<%=ide%>')"><%=ide%></a></td>
							<td align="center">
								 <a href="javascript:meet02group('<%=grnum%>')"><%=grnum%></td>
							<td align="center"><%=grname%></td>
							<td align="center">
								 <a href="javascript:meet02sight('<%=s_code%>')"><%=s_code%></td>
							<td align="center"><%=sight%></td>
							<td align="center"><%=freq%></td>
							<td align="center"><%=date%></td>
							<td align="center"><%=place%></td>
							<td align="center">
								<a href="javascript:meet04('<%=num%>')">명 단</a></td>
							<td align="center">
								<a href="javascript:meet05('<%=num%>')">현 황</a></td>
							<td align="center">
								<a href="javascript:meet02Up('<%=num%>')">수 정</a></td>
							</tr>
					<% 		} //for end%>	
						</table>
					<%	} %>
					</td>
				</tr>
			</table>
			<br><br>
			<span align="center"><input type="button" value="신규 모임 입력" onclick="location.href='meet01.jsp'"></span>
			<form name="readFrm" method="get">
			<br>
			<input type="hidden" name="num">
			<input type="hidden" name="num1">
			</form>
		</div>
	</body>
</html>