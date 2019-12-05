<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");%>
<%
	//idx 값
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	dao1.deleteNoticeData(idx);
	DBConnection.closeConnection(con1);	
	response.sendRedirect("../dashboard/index_new.jsp");
%> 