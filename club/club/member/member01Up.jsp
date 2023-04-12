<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="java.util.Vector" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.GrBean" %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<%
    String id = (String)session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember1(id);
	session.setAttribute("bean", mBean);//회원자료 세션에 저장
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css" >
	<script type="text/javascript" src="javascript1.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>table { border-collapse: collapse; }</style>
</head>
	<body onload="regFrm.id.focus()">
		<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="member01UpProc.jsp">
			<table aling="center" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#dde6d5">
								<td colspan="3"><h2>회원정보수정</h2></td>
							</tr>
							<tr>
								<td width="25%">아이디<font color="red"> *</font></td>
								<td width="75%"><input name="id" size="15" value="<%=mBean.getId()%>" readonly></td>
							</tr>
							<tr>
								<td>비밀번호<font color="red"> *</font></td>
								<td><input type="password" name="pw" placeholder="4자 이상" size="15" value="<%=mBean.getPw()%>"></td>
							</tr>
							<tr>
								<td>이름<font color="red"> *</font></td>
								<td><input name="name" size="15" value="<%=mBean.getName()%>" placeholder="이름 작성"></td>
							</tr>
							<tr>
								<td>전화번호<font color="red"> *</font></td>
								<td><input name="tel" size="15" value="<%=mBean.getTel()%>" placeholder="하이픈(-) 포함"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input type="radio" name="gender" value="남" <%=mBean.getGender().equals("남") ? "checked" : ""%>>남
								<input type="radio" name="gender" value="여" <%=mBean.getGender().equals("여") ? "checked" : ""%>>여
								<input type="radio" name="gender" value="지정안함" <%=mBean.getGender().equals("지정안함") ? "checked" : ""%>>지정하지않음</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birth" size="10" placeholder="ex)830815" value="<%=mBean.getBirth()%>"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input name="mail" size="30" value="<%=mBean.getMail()%>"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input id="zip" name="zip" size="5" value="<%=mBean.getZip()%>" readonly>
								<input type="button" value="우편번호찾기" onclick="PostCheck()"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input id="post" name="post" size="50" value="<%=mBean.getPost()%>" readonly>
								<input id="post2" name="post2" size="50" value="<%=mBean.getPost2()%>"></td>
							</tr>
							<tr>
								<td>취미</td>
								<td><%
										String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
										String hobby[] = mBean.getHobby();
										for (int i = 0; i < lists.length; i++) {
											out.println("<input type='checkbox' name='hobby'");
											out.println("value=" + lists[i] + " "
											+ (hobby[i].equals("1") ? "checked" : "") + ">");
											out.println( lists[i]);
										}
									%>
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
								</select><script>document.regFrm.club.value="<%=mBean.getClub()%>"</script></td>
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
								</select><script>document.regFrm.grnum.value="<%=mBean.getGrnum()%>"</script></td>
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
								</select><script>document.regFrm.job.value="<%=mBean.getJob()%>"</script></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								<input type="submit" value="수정완료"> &nbsp; &nbsp;
								<input type="reset" value="다시쓰기"> &nbsp; &nbsp;
								<input type="button" value="취소하기" onclick="history.go(-1)"></td>						
							</tr>
						</table>
					</td>
				</tr>	
			</table>
		</form>
		</div>
	</body>
</html>