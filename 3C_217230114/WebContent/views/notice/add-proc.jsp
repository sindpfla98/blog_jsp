<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.util.DateTimeUtil"%>
<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	NoticeDTO notice = new NoticeDTO();
	//전체 알림  추가
	notice.setName(request.getParameter("name"));
	notice.setEmail(request.getParameter("email"));
	notice.setPhone(request.getParameter("phone"));
	notice.setAddress(request.getParameter("address"));
	notice.setCreated(DateTimeUtil.dateTimestamp());
	notice.setUpdated(DateTimeUtil.dateTimestamp());
	System.out.println(notice.toString());
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	dao1.insertNoticeData(notice);
	DBConnection.closeConnection(con1);

	response.sendRedirect("../dashboard/index_new.jsp");
%>