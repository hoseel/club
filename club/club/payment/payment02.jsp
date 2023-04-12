<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="club.MemBean" %>
<%@ page import="club.PayBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="pMgr" class="club.clubmgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String check = request.getParameter("check");
	
	MemBean mBean = pMgr.getMember1(id);
	String memship = mBean.getMemship();
	int num = 0;
	if (check == null) check = "admin";

	int balan = 0;
	int totalRecord = 0;
	int listSize = 0;
	Vector<PayBean> vlist = null;

	String keyField = "", keyWord = "";
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
		check = "search";
	}
	
	totalRecord	= pMgr.getPayCount(check, id, keyField, keyWord);

	vlist = pMgr.getPayment(check, id, keyField, keyWord);
	listSize = vlist.size();
	for (int i = 0; i < listSize; i++) {
		PayBean bean = vlist.get(i);
		id = bean.getId();
		num = bean.getNum();
		int inco = bean.getInco();
		int expe = bean.getExpe();
		
		balan = balan + inco - expe;
		pMgr.updateBalan(num, balan);
	}
			
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출납 관리</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function payment02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "payment02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function payment03De(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "payment03De.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function check() {
			if (document.searchFrm.keyWord.value == "") {
				alert("검색어를 입력하세요.");
				document.searchFrm.keyWord.focus();
				return;
			}
			document.searchFrm.action="payment02.jsp";
			document.searchFrm.target="content";
			document.searchFrm.submit();
		 }
	</script>
</head>
	<body>
	<div align="center">
		<br><h2>출납관리</h2><br>
		<table align="center" width="800" cellpadding="3">
			<tr>
				<td>입력된 자료수 : <%=totalRecord%></td>
			</tr>
			<tr></tr>
			<tr>
				<td align="center" colspan="3">
				<%
					vlist = pMgr.getPayment(check, id, keyField, keyWord);
					listSize = vlist.size();
					if (vlist.isEmpty() && memship.equals("admin") && memship.equals("gradmin")) {
						out.println("등록된 자료가 없습니다.");
				%>		<br><br><input type="button" value="뒤로가기" onclick="history.back()"><%
					} else if (memship.equals("basic")) {
						out.println("접근 권한이 없습니다.");
				%>		<br><br><input type="button" value="뒤로가기" onclick="history.back()"><%
					} else {
				%>
					<table width="100%" cellpadding="2" border="1">
						<tr align="center" height="120%" bgcolor="#dde6d5">
							<td>번 호</td>
							<td>아이디</td>
							<td>날 짜</td>
							<td>구 분</td>
							<td>수입종류</td>
							<td>지출종류</td>
							<td>현 금</td>
							<td>카 드</td>
							<td>은 행</td>
							<td>지출내역</td>
							<td>수입액</td>
							<td>지출액</td>
							<td>잔 액</td>
							<td>수 정</td>
							<td>삭 제</td>
						</tr>
				<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								PayBean bean = vlist.get(i);
								num = bean.getNum();
								id = bean.getId();
								String date = bean.getDate();
								String inorex = bean.getInorex();
								String c_inco = bean.getC_inco();
								String c_expe = bean.getC_expe();
								String cash = bean.getCash();
								String card = bean.getCard();
								String bank = bean.getBank();
								String expe_list = bean.getExpe_list();
								int inco = bean.getInco();
								int expe = bean.getExpe();
								balan = bean.getBalan();
				%>		<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=id%></td>
							<td align="center"><%if (date == null) {out.print("-");} else {out.print(date);}%></td>
							<td align="center"><%=inorex%></td>
							<td align="center"><%=c_inco%></td>
							<td align="center"><%=c_expe%></td>
							<td align="center"><%if (cash == null) {out.print("-");} else {out.print(cash);}%></td>
							<td align="center"><%if (card == null) {out.print("-");} else {out.print(card);}%></td>
							<td align="center"><%if (bank == null) {out.print("-");} else {out.print(bank);}%></td>
							<td align="center"><%if (expe_list == null) {out.print("-");} else {out.print(expe_list);}%></td>
							<td align="center"><%if (Integer.valueOf(inco) == null) {out.print("-");} else {out.print(inco);}%></td>
							<td align="center"><%if (Integer.valueOf(expe) == null) {out.print("-");} else {out.print(expe);}%></td>
							<td align="center"><%if (Integer.valueOf(balan) == null) {out.print("-");} else {out.print(balan);}%></td>
							<td align="center">
								<a href="javascript:payment02Up('<%=num%>')">수 정</a></td>
							<td align="center">
								<a href="javascript:payment03De('<%=num%>')">삭 제</a></td>
						</tr>
				<%			} %>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<form name="searchFrm" method="get" action="payment02.jsp" align="center">
			<table width="100%" cellpadding="4" cellspacing="0">
 				<tr><td align="center" valign="bottom">
	   			<select name="keyField" size="1" >
	    			<option value="id"> 아이디</option>
    				<option value="inorex"> 구 분</option>
    				<option value="cash"> 현 금</option>
    				<option value="card"> 카 드</option>
    				<option value="bank"> 은 행</option>
	   			</select>
   				<input size="16" name="keyWord">
   				<input type="button" value="검색하기" onClick="check()"></td>
 				</tr>
			</table>
		</form>
		<form name="readFrm" method="get" align="center">
	    <br>
		<input type="button" value="신규출납입력" onClick="location.href='payment01.jsp'">&nbsp;&nbsp;
		<input type="button" value="전체자료확인" onClick="location.href='payment02.jsp?check=admin'">&nbsp;&nbsp;
		<input type="hidden" name="num"> 
	</form>
				<% } %>
	</div>
	</body>
</html>