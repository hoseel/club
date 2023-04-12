<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.MeetBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.SightBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%@ page import="java.util.Vector" %>
<%
	String id = (String)session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));

	MeetBean mBean = mMgr.getMeeting();

	MemBean nBean = mMgr.getMember1(id);
	String name = nBean.getName();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모임 내용 수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css" >
</head>
	<body>
	<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="meet02UpProc.jsp">
		<table aling="center" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#dde6d5">
								<td colspan="3"><h2>모임 내용 수정</h2></td>
							</tr>
							<tr>
								<td width="25%">순번</td>
								<td width="75%"><input name="num" size="5" value="<%=num%>" readonly></td>
							</tr>
							<tr>
								<td>동호회 선택</td>
								<td><select name="code">
								<option value="0" selected>선택하세요
								<%
									Vector<CodeBean> vlist = null;
									int listSize = 0;
									vlist = mMgr.getCodeList("club");
									listSize = vlist.size();
									if (vlist.isEmpty()) {
										out.println("등록된 자료가 없습니다.");
									} else {
										for (int i = 0; i < listSize; i++) {
											if (i == listSize) break;
											CodeBean bean = vlist.get(i);
											String code = bean.getCode();
											String assort = bean.getAssort();
								%>
								<option value="<%=code%>"><%=assort%>
								<%		} // for
									} // if
								%>
								</select><script>document.regFrm.code.value="<%=mBean.getCode()%>"</script></td>
							</tr>
							<tr>
								<td>모임 관리자 아이디</td>
								<td><input name="id" size="15" value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>차수</td>
								<td><input name="freq" size="15" placeholder="모임 차수 입력" value="<%=mBean.getFreq()%>"></td>
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
							</select><script>document.regFrm.s_code.value="<%=mBean.getS_code()%>"</script></td>
							</tr>
							<tr>
								<td>모임 날짜</td>
								<td><input name="date" type="date" size="15" placeholder="모임 날짜 입력" value="<%=mBean.getDate()%>"></td>
							</tr>
							<tr>
								<td>모임 장소</td>
								<td><input name="place" size="15" placeholder="모임 장소 입력" value="<%=mBean.getPlace()%>"></td>
							</tr>
							
							<tr>
								<td>비고</td>
								<td><input name="note" size="50" value="<%=mBean.getNote()%>"></td>
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