<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 목록</h3> 
	<table border="1">
		<tr>
			<th width="80">사원번호</th>
			<th width="80">사원이름</th>
			<th width="80">부서명</th>
			<th width="100">입사년도</th>
			<th width="60">직급</th>
		</tr>
		
<%@ page import = "MYDB_Sample_MVC1.DBConnection" %>
<%
	Connection conn = DBConnection.openConnection(); 
	request.setCharacterEncoding("utf-8");

	String custno   = request.getParameter("custno");  
	String custname = request.getParameter("custname");
 	String phone    = request.getParameter("phone");
	String address  = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade    = request.getParameter("grade");
	String city     = request.getParameter("city");
	
	Statement stmt = null;
	
	try{
		String sql = "UPDATE member_tbl_02 SET "+ 
		"custname='" + custname + "', " +
		"phone='" + phone +"', " +
		"address='" + address +"', " +
		"joindate='" + joindate + "' " +
		"grade='" + grade +"', " +
		"city='" + city + "' " +
		"where custno='" + custno+"'";
		System.out.println(sql);
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		ResultSet rs = stmt.executeQuery("select * from member_tbl_02;");
		response.sendRedirect("index.jsp?section=member_list.jsp");
	} catch (SQLException ex){
		out.println("member 테이블 삽입이 실패했습니다.<br/>");
		out.println("SQLException: " + ex.getMessage());
	} finally {
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
	}
%>
</body>
</html>