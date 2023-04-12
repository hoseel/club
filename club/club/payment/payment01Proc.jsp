<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pMgr" class="club.clubmgr"/>
<jsp:useBean id="pBean" class="club.PayBean"/>
<jsp:setProperty property="*" name="pBean"/>
<%
	boolean result = pMgr.insertPayment(pBean);
	if(result) {
%>
<script type="text/javascript">
	alert("자료입력 완료");
	location.href="../index/main.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("자료입력 실패");
	history.back();
</script>
<% } %>