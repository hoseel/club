<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="club.clubmgr" />
<jsp:useBean id="mBean" class="club.MeetBean" />
<jsp:setProperty name="mBean" property="*" />
<%
	  boolean result = mMgr.updateMeet(mBean);
	  if(result){
%>
<script type="text/javascript">
		alert("모임 내역 수정 성공");
		location.href="../meet/meet02.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("수정 실패");
		history.back();
</script>
<%} %>