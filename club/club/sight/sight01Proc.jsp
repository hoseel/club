<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="sMgr" class="club.clubmgr"/>
<jsp:useBean id="sBean" class="club.SightBean"/>
<jsp:setProperty property="*" name="sBean"/>
<%
	boolean result = sMgr.insertSight(sBean);
	if(result) {
%>
<script type="text/javascript">
	alert("새 명소 입력 완료");
	opener.location.reload();
	self.close();
</script>
<% } else { %>
<script type="text/javascript">
	alert("명소 입력 실패");
	history.back();
</script>
<% } %>