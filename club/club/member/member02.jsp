<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String check = request.getParameter("check");
	String perm1 = request.getParameter("perm1");
	String perm2 = request.getParameter("perm2");
	int recnum = Integer.parseInt(request.getParameter("num"));
	if (check == null) check = "a";
	if (perm1 == null) perm1 = "go";
	if (perm2 == null) perm2 = "go";
	if (perm2.equals("gg")) {
		mMgr.updatePerm(recnum, perm1);
	}


	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 게시물의 수
	Vector<MemBean> vlist = null;
	String id = (String) session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
	
	int num = mBean.getNum();
	String name = mBean.getName();
	String memship = mBean.getMemship();
	
	totalRecord = mMgr.getTotalCount(memship, check);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function member02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function member01Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member01Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function member03De(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member03De.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function member02Perm(num, appro) {
			document.readFrm.num.value = num;
			document.readFrm.perm1.value = appro;
			document.readFrm.perm2.value = "gg";
			document.readFrm.action = "member02.jsp";
			document.readFrm.target="content";
			document.readFrm.submit();
		}
	</script>
</head>
	<body>
		<div align="center">
			<br>
			<h2>회원관리</h2>
			<br>
			<table align="center" width="600">
				<tr>
					<td>회원수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = mMgr.getMemberList(memship, check);
						listSize = vlist.size();
						if (vlist.isEmpty() && memship.equals("admin")) {
							out.println("등록된 게시물이 없습니다.");
					%>
					<br><br><input type="button" value="뒤로가기" onclick="history.back()">
					<%	
						} else if (memship.equals("gradmin") || memship.equals("basic")) {
							out.println("접근 권한이 없습니다.");
					%>
					<br><br><input type="button" value="뒤로가기" onclick="history.back()">
					<%
						} else {
					%>
					<table width="100%" cellpadding="2" border="1">
						<tr align="center" height="120%" bgcolor="#dde6d5">
							<td>번 호</td>
							<td>아이디</td>
							<td>권 한</td>
							<td>상 태</td>
							<td>희망동호회</td>
							<td>이 름</td>
							<td>전 화</td>
							<td>메 일</td>
							<td>수 정</td>
							<td>삭 제</td>
						</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								MemBean bean = vlist.get(i);
								num = bean.getNum();
								id = bean.getId();
								memship = bean.getMemship();
								String mem = null;
								if (memship.equals("admin")) { mem = "관리자"; }
								else if (memship.equals("gradmin")) { mem="모임관리자"; }
								else { mem = "일반회원";}
								String appro = bean.getAppro();
								String club = bean.getClub();
								name = bean.getName();
								String tel = bean.getTel();
								String mail = bean.getMail();
					%>
						<tr>
						<td align="center">
							<%=num%>
						</td>
						<td align="center">
							<%=id%>
						</td>
						<td align="center">
							<%=mem%>
						</td>
						<td align="center">
							<a href="javascript:member02Perm('<%=num%>', '<%=appro%>')"><%=appro%></a>
						</td>
						<td align="center">
							<%=club%>
						</td>
						<td align="center">
							<%=name%>
						</td>
						<td align="center">
							<%=tel%>
						</td>
						<td align="center">
							<%=mail%>
						</td>
						<td align="center">
							<% if (Integer.valueOf(mBean.getNum()).equals(1)) { %>
							<a href="javascript:member02Up('<%=num%>')">수 정</a>
							<% } else { %> <a href="javascript:member01Up('<%=num%>')">수 정</a><% } %>
						</td>
						<td align="center">
							<a href="javascript:member03De('<%=num%>')">삭 제</a>
						</td>
						</tr>
					<% 		} //for end%>	
						</table>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
			<br>
			<input type="button" value="신규회원" onclick="location.href='member01.jsp'">&nbsp;
			<input type="button" value="전체회원" onclick="location.href='member02.jsp?check=a&num=0'">&nbsp;
			<input type="button" value="승인회원" onClick="location.href='member02.jsp?check=o&num=0'">&nbsp;
			<input type="button" value="미승인회원" onClick="location.href='member02.jsp?check=x&num=0'">&nbsp;
			<input type="hidden" name="num">
			<input type="hidden" name="perm1">
			<input type="hidden" name="perm2">
			</form>
			<% } // if end%>	
		</div>
	</body>
</html>