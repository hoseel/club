<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="gMgr" class="club.clubmgr" />
<jsp:useBean id="gBean" class="club.GrBean" />
<jsp:setProperty name="gBean" property="*" />
<%
	  boolean result = gMgr.insertGr(gBean);
	  if(result){
%>
<script type="text/javascript">
		alert("단체 등록 성공");
		location.href="../index/main.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("등록 실패");
		history.back();
</script>
<%} %>