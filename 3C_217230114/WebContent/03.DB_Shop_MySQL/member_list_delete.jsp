<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "MYDB_Sample_MVC1.DBConnection" %>
<%
	Connection conn = DBConnection.openConnection(); 
	request.setCharacterEncoding("utf-8");

	String custno = request.getParameter("custno");
	
	java.sql.PreparedStatement stat = conn.prepareStatement("delete member_tbl_02 where empno = ?");
	stat.setString(1, custno);
	stat.executeUpdate();
	stat.close();
	// DB를 닫는다. (DB disconnect)
	conn.close();
	response.sendRedirect("index.jsp?section=member_list.jsp");
%>
