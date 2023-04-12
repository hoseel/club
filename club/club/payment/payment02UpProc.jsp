<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="club.MemBean" %>
<%@ page import="club.CodeBean" %>
<%@ page import="club.PayBean" %>
<jsp:useBean id="pMgr" class="club.clubmgr"/>
<jsp:useBean id="pBean" class="club.PayBean"/>
<jsp:setProperty property="*" name="pBean"/>
<%
	boolean result = pMgr.updatePayment(pBean);
	if(result) {
%>
<script type="text/javascript">
	alert("자료 수정 완료");
	location.href="../payment/payment02.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("자료 수정 실패");
	history.back();
</script>
<% } %>