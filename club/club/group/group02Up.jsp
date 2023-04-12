<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.GrBean" %>
<%@ page import="club.CodeBean" %>
<jsp:useBean id="gMgr" class="club.clubmgr" />
<%@ page import="java.util.Vector" %>
<%
	String id = (String)session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));

	GrBean gBean = gMgr.getGroup2(num);

	MemBean mBean = gMgr.getMember1(id);
	String name = mBean.getName();
	String tel = mBean.getTel();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>단체 내용 수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css" >
</head>
	<body>
	<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="group02UpProc.jsp">
		<table aling="center" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#dde6d5">
								<td colspan="3"><h2>단체 내용 수정</h2></td>
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
									vlist = gMgr.getCodeList("club");
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
								</select><script>document.regFrm.code.value="<%=gBean.getCode()%>"</script></td>
							</tr>
							<tr>
								<td>단체 코드</td>
								<td><input name="grnum" size="15" placeholder="A0001-01 형태로 입력" value="<%=gBean.getGrnum()%>"></td>
							</tr>
							<tr>
								<td>단체 이름</td>
								<td><input name="grname" size="15" placeholder="단체 이름 입력" value="<%=gBean.getGrname()%>"></td>
							</tr>
							<tr>
								<td>단체 장소</td>
								<td><input name="grplace" size="15" placeholder="단체 장소 입력" value="<%=gBean.getGrplace()%>"></td>
							</tr>
							<tr>
								<td>단체 관리자 아이디</td>
								<td><input name="gradmid" size="15" value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>단체 관리자 이름</td>
								<td><input name="gradmname" size="15" value="<%=name%>" readonly></td>
							</tr>
							<tr>
								<td>단체 관리자 전화번호</td>
								<td><input name="gradmtel" size="15" value="<%=tel%>" readonly></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit" value="등록하기"> &nbsp; &nbsp;
								<input type="reset" value="다시쓰기">
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>