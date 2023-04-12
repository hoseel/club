<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<jsp:useBean id="Mbean" class="club.MemBean" />
<jsp:setProperty name="Mbean" property="*" />
<%
	String id = (String) session.getAttribute("idKey");
	boolean result = mMgr.updateMember1(Mbean);
	if (result) {
%>
<script type="text/javascript">
	alert("회원정보 수정하였습니다");
	location.href="member02.jsp?check=a&num=0";
</script>
<%	} else { %>
<script type="text/javascript">
	alert("회원정보 수정 실패");
	history.back();
</script>
<%	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>