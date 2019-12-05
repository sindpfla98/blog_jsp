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
<%
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/jspdb3?useSSL=false&serverTimezone=UTC"; // jspdb3: 내가 생성한 데이터베이스 이름
String user = "root";
String password = "217230114";

Connection conn = DriverManager.getConnection(url, user, password); 

request.setCharacterEncoding("utf-8");

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

Statement stmt = null;

try{
	String sql = "INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) VALUES("+
			custno + ",'" + custname + "','" + phone +"','" +address +"','" + joindate + "','" 
			+ grade + "','" + city +"')";
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	out.println("member_tbl_02 테이블 삽입이 성공했습니다.<br/>");
	
	ResultSet rs = stmt.executeQuery("select * from member_tbl_02");
	while(rs.next()){
		out.println(
				"<tr><td>" + rs.getString("custno") + "</td>" 
				+"<td>" + rs.getString("custname") + "</td>"
				+"<td>" + rs.getString("phone") + "</td>"
				+"<td>" + rs.getString("address") + "</td>"
				+"<td>" + rs.getString("joindate") + "</td>"
				+"<td>" + rs.getString("grade") + "</td>"
				+"<td>" + rs.getString("city") + "</td></tr>"
				);
	}
} catch (SQLException ex){
	out.println("member_tbl_02 테이블 삽입이 실패했습니다.<br/>");
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