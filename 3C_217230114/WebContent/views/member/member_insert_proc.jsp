<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.util.DateTimeUtil"%>
<%@page import="kr.ac.shu.member.MemberDTO"%>
<%@page import="kr.ac.shu.member.MemberDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	MemberDTO member = new MemberDTO();
	//전체 알림  추가
	member.setCustno  (Integer.parseInt(request.getParameter("custno")));
	member.setCustname(request.getParameter("custname"));
	member.setPhone   (request.getParameter("phone"));
	member.setAddress (request.getParameter("address"));

	String tempDate = request.getParameter("joindate");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date jdate = (Date)df.parse(tempDate);
	member.setJoindate(jdate);
	
	//member.setJoindate((Date)df.parse(tempDate));
	member.setGrade   (request.getParameter("grade"));                                  
	member.setCity    (request.getParameter("city"));                                  
	                                                    
	System.out.println(member.toString());
	Connection con1 = DBConnection.openConnection();
	MemberDAO dao1 = new MemberDAO(con1);
	dao1.insertMemberData(member);
	DBConnection.closeConnection(con1);

	response.sendRedirect("../dashboard/index_new.jsp");
%>