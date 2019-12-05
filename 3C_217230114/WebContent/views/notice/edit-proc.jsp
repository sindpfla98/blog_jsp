<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.util.DateTimeUtil"%>
<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	//idx 값
	int idx = Integer.parseInt(request.getParameter("idx"));
	String idxString = request.getParameter("idx");
	
	NoticeDTO notice = new NoticeDTO();
	notice.setIdx(idx);
	notice.setUpdated(DateTimeUtil.dateTimestamp());
	notice.setName(request.getParameter("name"));
	notice.setEmail(request.getParameter("email"));
	notice.setPhone(request.getParameter("phone"));
	notice.setAddress(request.getParameter("address"));
	
	//Notice 게시판 정보 수정
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	dao1.updateNoticeData(notice);
	DBConnection.closeConnection(con1);
	
	response.sendRedirect("../dashboard/index_new.jsp?vmenu=/views/notice/view.jsp?idx="+idxString);
 %>