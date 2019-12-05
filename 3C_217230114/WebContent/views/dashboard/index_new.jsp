<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<%@include file="head.jsp" %>
	<body id="page-top">
	<% String menu = request.getParameter("vmenu"); 
	   System.out.println(menu);
	%>
		<div id="wrapper">
		  <%@include file="sidemenu.jsp" %>
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					<%@include file="topbar.jsp" %>
					<%
		        if(request.getParameter("vmenu")==null){
		      %>
		          <jsp:include page="../notice/noticelist.jsp"/> 
		      <%
		        }else{
		      %>
		          <jsp:include page="<%=menu%>"/>
		      <%
		        }
		      %>	 
				</div>
				<footer class="sticky-footer bg-white">
	        <%@include file="footer.jsp" %>
				</footer>
			</div>
		</div>
	  <%@include file="plugin.jsp" %>
	</body>
</html>

