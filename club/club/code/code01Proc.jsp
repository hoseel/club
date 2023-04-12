<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cMgr" class="club.clubmgr"/>
<jsp:useBean id="cBean" class="club.CodeBean"/>
<jsp:setProperty property="*" name="cBean"/>
<%
	boolean result = cMgr.insertCode(cBean);
	if(result) {
%>
<script type="text/javascript">
	alert("새 코드 입력 완료");
	location.href="../index/main.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("코드입력 실패");
	history.back();
</script>
<% } %>