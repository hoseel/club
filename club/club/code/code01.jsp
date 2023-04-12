<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>코드 입력</title>
	<link href="../style1.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function CodeCheck() {
			url = "../code/code02.jsp";
			window
			.open(url, "CodeCheck", "width=500, height=400, scollbars=yes");
		}
	</script>
</head>
	<body onload="regFrm.code.focus()">
	<div align="center">
	<br><br>
	<form name="regFrm" method="post" action="code01Proc.jsp">
		<table align="center" valign="middle">
			<tr><td align="center" valign="middle">
				<table border="1" cellpadding="2" align="center" width="600">
					<tr align="center" bgcolor="#dde6d5">
						<td colspan="2"><h2>새 코드 입력</h2></td>
					</tr>
					<tr>
						<td width="25%">식별코드</td>
						<td width="75%"><select name="disc">
						<option value="A" selected>동호회</option>
						<option value="B">수입종류</option>
						<option value="C">지출종류</option>
						<option value="D">직업종류</option>
						<option value="E">현금종류</option>
						<option value="F">카드종류</option>
						<option value="G">은행종류</option>
						</select></td>
					</tr>
					<tr>
						<td>코드</td>
						<td><input name="code" size="15" placeholder="식별코드 표 참조"></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><input name="assort" size="15" placeholder="명확한 분류 입력"></td>
					</tr>				
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="입력하기">&nbsp;&nbsp;
						<input type="reset" value="다시입력">&nbsp;&nbsp;
						<input type="button" value="취소하기" onclick="history.back()"></td>
					</tr>
				</table><br>
				<b>코드 중복 입력 방지를 위해 기존 코드를 확인 후 등록해주시길 바랍니다!<br>
				중복 코드 발견시 일괄 삭제 처리됩니다!</b><br>
				<input type="button" value="코드 확인하기" onClick="CodeCheck()"><br><br>
				<table border="1" align="center" width="400">
					<tr align="center" bgcolor="#dde6d5"><td colspan="7">식별코드안내</td></tr>
					<tr align="center"><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td></tr>
					<tr align="center"><td>&nbsp;동호회&nbsp;</td><td>수입종류</td><td>지출종류</td><td>직업종류</td><td>현금종류</td><td>카드종류</td><td>은행종류</td></tr>
				</table>
			</td></tr>
		</table>
	</form>
	</div>
	</body>
</html>