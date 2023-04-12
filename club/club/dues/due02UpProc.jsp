<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="club.MemBean"%>
<%@ page import="club.DueBean"%>
<jsp:useBean id="dMgr" class="club.clubmgr"/>
<jsp:useBean id="dBean" class="club.DueBean"/>
<jsp:setProperty name="dBean" property="*"/>
<%
	  boolean result = dMgr.updateDues(dBean);
	  if(result){
%>
<script type="text/javascript">
		alert("회비납부 정보를 수정하였습니다.");
		location.href="due02.jsp";
</script>
<% } else {%>
<script type="text/javascript">
		alert("회비납부 정보 수정에 실패하였습니다.");
		history.back();
</script>
<%} %>