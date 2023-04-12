<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.GrBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<style>
	table { border-collapse: collapse; }
	</style>
	<script src="javascript1.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function idCheck(id) {
			if (id == "") {
				alert("아이디를 입력해 주세요");
				document.regFrm.id.focus();
				return;
			}
			url = "idCheck.jsp?id=" + id;
			window
			.open(url, "IDCheck", "width=300, height=150");
		}
	</script>
</head>
	<body onLoad="regFrm.id.focus()">
		<div align="center">
			<br><br>
			<form name="regFrm" method="post" action="member01Proc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellsapcing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#dde6d5">
								<td colspan="3"><h2>회원가입</h2></td>
							</tr>
							<tr>
								<td width="25%">아이디<font color="red"> *</font></td>
								<td width="75%"><input name="id" size="15" >
								<input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value)"></td>
							</tr>
							<tr>
								<td>비밀번호<font color="red"> *</font></td>
								<td><input type="password" name="pw" size="15" placeholder="4자 이상"></td>
							</tr>
							<tr>
								<td>비밀번호 확인<font color="red"> *</font></td>
								<td><input type="password" name="repw" size="15" placeholder="4자 이상"></td>
							</tr>
							<tr>
								<td>이름<font color="red"> *</font></td>
								<td><input name="name" size="15" placeholder="이름 작성"></td>
							</tr>
							<tr>
								<td>전화번호<font color="red"> *</font></td>
								<td><input name="tel" size="15" placeholder="하이픈(-) 포함"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input type="radio" name="gender" value="남" checked>남
								<input type="radio" name="gender" value="여">여
								<input type="radio" name="gender" value="지정안함">지정하지않음</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birth" size="10" placeholder="ex)830815"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input name="mail" size="20" placeholder="aa@bb.cc형태로 작성"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input id="zip" name="zip" size="5" readonly>
								<input type="button" value="우편번호찾기" onclick="PostCheck()"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input id="post" name="post" size="50" readonly>
								<input id="post2" name="post2" size="50" placeholder="상세주소 입력"></td>
							</tr>
							<tr>
								<td>취미</td>
								<td><input type="checkbox" name="hobby" value="인터넷"> 인터넷
									<input type="checkbox" name="hobby" value="여행"> 여행
									<input type="checkbox" name="hobby" value="게임"> 게임
									<input type="checkbox" name="hobby" value="영화"> 영화
									<input type="checkbox" name="hobby" value="운동"> 운동
								</td>
							</tr>
							<tr>
								<td>희망동호회</td>
								<td><select name="club">
								<option value="0" selected>선택하세요
							<%
								Vector<CodeBean> vlistc = null;
								int listSize = 0;
								vlistc = mMgr.getCodeList("club");
								listSize = vlistc.size();
								if (vlistc.isEmpty()) {
									out.println("등록된 자료가 없습니다.");
								} else {
									for (int i = 0; i < listSize; i++) {
										if (i == listSize) break;
										CodeBean bean = vlistc.get(i);
										String assort = bean.getAssort();
							%>
										<option value="<%=assort%>"><%=assort%>
							<%		} // for
								} // if
							%>
								</select></td>
							</tr>
							<tr>
								<td>동호회 그룹 선택</td>
								<td><select name="grnum">
								<option value="0" selected>선택하세요
								<%
								Vector<GrBean> vlistg = null;
								vlistg = mMgr.getGroupList();
								listSize = vlistg.size();
								if (vlistg.isEmpty()) {
									out.println("등록된 자료가 없습니다.");
								} else {
									for (int i = 0; i < listSize; i++) {
										if (i == listSize) break;
										GrBean bean = vlistg.get(i);
										String grnum = bean.getGrnum();
										String grname = bean.getGrname();
								%>
										<option value="<%=grnum%>"><%=grname%>
								<%		} // for
									} // if
								%>
								</select></td>
							</tr>
							<tr>
								<td>직업</td>
								<td><select name="job">
								<option value="0" selected>선택하세요
							<%
								Vector<CodeBean> vlist = null;
								vlist = mMgr.getCodeList("job");
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
							%>
								</select></td>
							</tr>
						</table>
						<span align="center">
							<br>
							<input type="button" value="회원가입" onClick="inputCheck()">&nbsp;&nbsp;
							<input type="reset" value="다시쓰기">&nbsp; &nbsp;
							<input type="button" value="뒤로가기" onclick="history.back()">
						</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>