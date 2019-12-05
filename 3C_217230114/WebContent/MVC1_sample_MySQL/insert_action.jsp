<%@page import="MYDB_Sample_MVC1.DBConnection" %>
<%@page import="MYDB_Sample_MVC1.WooriDAO" %>
<%@page import="MYDB_Sample_MVC1.WooriDTO" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

	WooriDTO member = new WooriDTO();
	member.setId(request.getParameter("id"));
	member.setName(request.getParameter("name"));
	member.setEmail(request.getParameter("email"));
	member.setPassword(Integer.parseInt(request.getParameter("password")));
	System.out.println(member);
	
	boolean checkResult = false;
	boolean insertResult = false;
	
	Connection con1 = DBConnection.openConnection();
	WooriDAO dao1 = new WooriDAO(con1);
	checkResult = dao1.checkID(member.getId());
	System.out.println(member.getId());
	DBConnection.closeConnection(con1);
	
	if(!checkResult){
		Connection con2 = DBConnection.openConnection();
		WooriDAO dao2 = new WooriDAO(con2);
		insertResult = dao2.insertData(member);
		DBConnection.closeConnection(con2);
	
		if(insertResult){
			out.println("<script>alert('회원 등록 성공');location.href='index.html';</script>");
		}else{
			out.println("<script>alert('회원 등록 실패');location.href='insert.html';</script>");
		}
	}else{
		out.println("<script>alert('id가 이미 등록되어 있습니다.');location.href='insert.html';</script>");
	}
%>