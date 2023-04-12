<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<jsp:useBean id="mBean" class="club.MemBean" />
<jsp:setProperty name="mBean" property="*" />
<%
	  boolean result = mMgr.updateMember(mBean);
	  if(result){
%>
<script type="text/javascript">
		alert("회원정보 수정하였습니다.");
		location.href="../index/main.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원정보 수정에 실패하였습니다.");
		history.back();
</script>
<%} %>