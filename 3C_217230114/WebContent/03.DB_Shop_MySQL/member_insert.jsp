<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function Insert() {
		if(frmMemberInsert.custno.value == ""){
			alert("회원번호가 입력되지 않았습니다.");
			frmMemberInsert.custno.focus();
			return false;}
		if(frmMemberInsert.custname.value == ""){
			alert("회원성명이 입력되지 않았습니다.");
			frmMemberInsert.custname.focus();
			return false;}
		if(frmMemberInsert.phone.value == ""){
			alert("회원전화가 입력되지 않았습니다.");
			frmMemberInsert.phone.focus();
			return false;}
		if(frmMemberInsert.address.value == ""){
			alert("주소가 입력되지 않았습니다.");
			frmMemberInsert.address.focus();
			return false;}
		if(frmMemberInsert.joindate.value == ""){
			alert("가입일자가 입력되지 않았습니다.");
			frmMemberInsert.joindate.focus();
			return false;}
		if(frmMemberInsert.grade.value == ""){
			alert("고객등급이 입력되지 않았습니다.");
			frmMemberInsert.grade.focus();
			return false;}
		if(frmMemberInsert.city.value == ""){
			alert("거주도시가 입력되지 않았습니다.");
			frmMemberInsert.city.focus();
			return false;}
		frmMemberInsert.action = "member_insert_process.jsp"
		frmMemberInsert.submit();
		alert("회원정보가 등록 되었습니다.");
	}
</script>
</head>

<body>
<%

try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/jspdb3?useSSL=false&serverTimezone=UTC"; // jspdb3: 내가 생성한 데이터베이스 이름
	String user = "root";
	String password = "217230114";
	
	Connection conn = DriverManager.getConnection(url, user, password); 
	if(conn != null)
	{
		System.out.println("Database Connect : [" + "<b>success</b>]<br>");
	}else{
		System.out.println("Database Connect : [" + "<b>fail</b>]<br>");
	};
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from member_tbl_02");
 	while(rs.next()){
		int custno = rs.getInt("custno");
		if(rs.isLast()){
%>
		

	<h2 align="center">홈쇼핑 회원 등록</h2>
	<form name="frmMemberInsert" method="post" action="member_insert_process.jsp">
	<table>
		<tr>
		<td>회원번호(자동발생)</td>
		<td><input type="text" name="custno" value="<%=custno+1%>"></td>
		</tr>
		<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname"></td>
		</tr>
		<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone"></td>
		</tr>
		<tr>
		<td>회원주소</td>
		<td><input type="text" name="address"></td>
		</tr>
		<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=new SimpleDateFormat("yyyyMMdd").format(new java.util.Date())%>"></td>
		</tr>
		<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade"></td>
		</tr>
		<tr>
		<td>도시코드</td>
		<td><input type="text" name="city"></td>
		</tr>
		<tr>
		<td><input type="button" name="btnInsert" value="등록" ONCLICK="Insert()">
				<input type="button" value="조회" ONCLICK="document.location.href='member_list.jsp'"></td>
		</tr>
	</table>
	</form>
<%
		}
 	}
rs.close();
stmt.close();
conn.close();
} catch (Exception e) {
out.println(e);
}
%>
</body>
</html>