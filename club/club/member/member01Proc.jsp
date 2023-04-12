<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="club.clubmgr"/>
<jsp:useBean id="mBean" class="club.MemBean"/>
<jsp:setProperty property="*" name="mBean"/>
<%
	boolean result = mMgr.insertMember(mBean);
	if(result) {
%>
<script type="text/javascript">
	alert("회원가입을 하였습니다");
	location.href="../index/main.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("회원가입에 실패하였습니다");
	history.back();
</script>
<% } %>