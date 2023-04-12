<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="sMgr" class="club.clubmgr" />
<jsp:useBean id="sBean" class="club.SightBean" />
<jsp:setProperty name="sBean" property="*" />
<%
	  boolean result = sMgr.updateSight(sBean);
	  if(result){
%>
<script type="text/javascript">
		alert("명소 내역 수정 성공");
		location.href="../index/main.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("수정 실패");
		history.back();
</script>
<%} %>