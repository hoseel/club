<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="gMgr" class="club.clubmgr" />
<jsp:useBean id="gBean" class="club.GrBean" />
<jsp:setProperty name="gBean" property="*" />
<%
	  boolean result = gMgr.updateGroup(gBean);
	  if(result){
%>
<script type="text/javascript">
		alert("단체 내역 수정 성공");
		location.href="../index/main.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("수정 실패");
		history.back();
</script>
<%} %>