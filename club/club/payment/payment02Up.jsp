<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.PayBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="pMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	PayBean pBean = pMgr.getPayment1(num);
	num = pBean.getNum();
	
	session.setAttribute("bean", pBean);
	
	int listSize = 0;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출납내역수정</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
</head>
	<body>
	<div align="center">
	<br><br>
	<form name="regFrm" method="post" action="payment02UpProc.jsp">
		<table align="center" valign="middle">
			<tr><td align="center" valign="middle">
				<table border="1" cellpadding="2" align="center" width="600">
					<tr align="center" bgcolor="#dde6d5">
						<td colspan="3"><h2>출납내역수정</h2></td>
					</tr>
					<tr>
						<td width="25%">순번</td>
						<td width="75%"><input name="num" size="10" value="<%=num%>" readonly></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input name="id" size="15" value="<%=pBean.getId()%>" readonly></td>
					</tr>
					<tr>
						<td>날짜</td>
						<td><input type="date" name="date" size="15" value="<%=pBean.getDate()%>"></td>
					</tr>
					<tr>
						<td>종류</td>
						<td><select name="inorex" id="inorex">
							<option value="수입">수입</option>
							<option value="지출">지출</option>
						</select><script>document.regFrm.inorex.value="<%=pBean.getInorex()%>"</script></td>
					</tr>
					<tr>
						<td>수입/지출 구분</td>
						<td>수입 <select name="c_inco">
						<option value="-" selected>선택안함
						<%
							Vector<CodeBean> vlist_i = null;
							vlist_i = pMgr.getCodeList("inco");
							listSize = vlist_i.size();
							if (vlist_i.isEmpty()) {
								out.println("자료없음");
							} else  {
								for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								CodeBean bean = vlist_i.get(i);
								String assort = bean.getAssort();
						%>
							<option value="<%=assort%>"><%=assort%></option>
						<%		}
							}
						%>	
						</select><script>document.regFrm.c_inco.value="<%=pBean.getC_inco()%>"</script>&nbsp;&nbsp;&nbsp;
						지출 <select name="c_expe">
						<option value="-" selected>선택안함
						<%
							Vector<CodeBean> vlist_e = null;
							vlist_e = pMgr.getCodeList("expe");
							listSize = vlist_e.size();
							if (vlist_e.isEmpty()) {
								out.println("자료없음");
							} else  {
								for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								CodeBean bean = vlist_e.get(i);
								String assort = bean.getAssort();
						%>
							<option value="<%=assort%>"><%=assort%></option>
						<%		}
							}
						%>	
						</select><script>document.regFrm.c_expe.value="<%=pBean.getC_expe()%>"</script></td>
					</tr>
					<tr>
						<td>현금</td>
						<td><select name="cash">
						<option value="-" selected>선택하세요</option>
						<%
							Vector<CodeBean> vlist_sh = null;
							vlist_sh = pMgr.getCodeList("cash");
							listSize = vlist_sh.size();
							if (vlist_sh.isEmpty()) {
								out.println("자료 없음");
							} else {
								for (int i = 0; i < listSize; i++) {
									if (i == listSize) break;
									CodeBean bean = vlist_sh.get(i);
									String assort = bean.getAssort();
						%>
							<option value="<%=assort%>"><%=assort%></option>
						<%		}
							}
						%>
						</select><script>document.regFrm.cash.value="<%=pBean.getCash()%>"</script></td>
					</tr>
					<tr>
						<td>카드</td>
						<td><select name="card">
						<option value="-" selected>선택하세요</option>
						<%
							Vector<CodeBean> vlist_rd = null;
							vlist_rd = pMgr.getCodeList("card");
							listSize = vlist_rd.size();
							if (vlist_rd.isEmpty()) {
								out.println("자료 없음");
							} else {
								for (int i = 0; i < listSize; i++) {
									if (i == listSize) break;
									CodeBean bean = vlist_rd.get(i);
									String assort = bean.getAssort();
						%>
							<option value="<%=assort%>"><%=assort%></option>
						<%		}
							}
						%>
						</select><script>document.regFrm.card.value="<%=pBean.getCard()%>"</script></td>
					</tr>
					<tr>
						<td>은행</td>
						<td><select name="bank">
						<option value="-" selected>선택하세요</option>
						<%
							Vector<CodeBean> vlist_nk = null;
							vlist_nk = pMgr.getCodeList("bank");
							listSize = vlist_nk.size();
							if (vlist_nk.isEmpty()) {
								out.println("자료 없음");
							} else {
								for (int i = 0; i < listSize; i++) {
									if (i == listSize) break;
									CodeBean bean = vlist_nk.get(i);
									String assort = bean.getAssort();
						%>
							<option value="<%=assort%>"><%=assort%></option>
						<%		}
							}
						%>
						</select><script>document.regFrm.bank.value="<%=pBean.getBank()%>"</script></td>
					</tr>
					<tr>
						<td>수입금액</td>
						<td><input name="inco" size="15" value="<%=pBean.getInco()%>"></td>
					</tr>
					<tr>
						<td>지출금액</td>
						<td><input name="expe" size="15" value="<%=pBean.getExpe()%>"></td>
					</tr>
					<tr>
						<td>잔액</td>
						<td><input name="balan" size="15" value="<%=pBean.getBalan()%>"></td>
					</tr>
					<tr>
						<td>지출내역</td>
						<td><input name="expe_list" size="20" value="<%=pBean.getExpe_list()%>"></td>
					</tr>
					<tr>
						<td>비고</td>
						<td><input name="note" size="30" value="<%=pBean.getNote()%>"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="입력하기">&nbsp;&nbsp;
						<input type="reset" value="다시입력">&nbsp;&nbsp;
						<input type="button" value="취소하기" onclick="history.back()"></td>
					</tr>
				</table>
			</td></tr>
		</table>
	</form>
	</div>
	</body>
</html>