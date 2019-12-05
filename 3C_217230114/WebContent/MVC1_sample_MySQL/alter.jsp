<%@page import="MYDB_Sample_MVC1.DBConnection" %>
<%@page import="MYDB_Sample_MVC1.WooriDAO" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	boolean result1;
	Connection con = DBConnection.openConnection();
	WooriDAO dao1 = new WooriDAO(con);
	result1 = dao1.alterTable();
	DBConnection.closeConnection(con);
	
	if(result1){
		out.println("<script>alert('테이블 수정 성공');location.href='index.html';</script>");
	}else{
		out.println("<script>alert('테이블 수정 실패');location.href='index.html';</script>");
	}
%>
