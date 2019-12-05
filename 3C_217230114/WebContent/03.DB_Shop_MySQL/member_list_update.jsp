<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<script>
	function Update() {
		if(frmPersonUpdate.custno.value == ""){
			alert("회원번호가 입력되지 않았습니다.");
			frmPersonUpdate.custno.focus();
			return false;}
		if(frmPersonUpdate.custname.value == ""){
			alert("회원이름이 입력되지 않았습니다.");
			frmPersonUpdate.custname.focus();
			return false;}
		if(frmPersonUpdate.phone.value == ""){
			alert("전화번호가 입력되지 않았습니다.");
			frmPersonUpdate.phone.focus();
			return false;}
		if(frmPersonUpdate.address.value == ""){
			alert("주소가 입력되지 않았습니다.");
			frmPersonUpdate.address.focus();
			return false;}
		if(frmPersonUpdate.joindate.value == ""){
			alert("가입일자가 입력되지 않았습니다.");
			frmPersonUpdate.joindate.focus();
			return false;}
		if(frmPersonUpdate.grade.value == ""){
			alert("고객등급이 입력되지 않았습니다.");
			frmPersonUpdate.grade.focus();
			return false;}
		if(frmPersonUpdate.city.value == ""){
			alert("거주지역이 입력되지 않았습니다.");
			frmPersonUpdate.city.focus();
			return false;}
		frmPersonUpdate.action = "member_update_action.jsp"
		frmPersonUpdate.submit();
		alert("회원정보가 수정 되었습니다.");
	}
	function Delete(){
		frmPersonUpdate.action = "member_list_delete.jsp"
			frmPersonUpdate.submit();
			alert("회원정보가 삭제되었습니다.");
	}
</script>
</head>
<body>
<%@ page import = "MYDB_Sample_MVC1.DBConnection" %>
<%
	Connection conn = DBConnection.openConnection(); 	request.setCharacterEncoding("utf-8");
	Statement stmt = conn.createStatement();
	
	String custno   = request.getParameter("custno");
	String custname,phone,address,joindate, grade, city = null;
	String sql = "SELECT * FROM member_tbl_02 where custno =" + custno;
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		custname = rs.getString(2);
	 	phone = rs.getString(3);
		address = rs.getString(4);
		joindate = rs.getString(5);
		grade = rs.getString(6);
		city = rs.getString(7);
	
%>       

	<form name="frmPersonUpdate" method="get" action="member_insert_process.jsp">
		<table border="1">
			<tr><td width="80">회원번호</td><td width="80"> <input type="text" name="custno" value="<%=custno%>" readonly="readonly"></td></tr>
			<tr><td width="80">회원이름</td><td width="80"> <input type="text" name="custname" value="<%= custname %>"></td></tr>
			<tr><td width="80">전화번호</td><td width="80"> <input type="text" name="phone" value="<%= phone %>"></td></tr>
			<tr><td width="80">주소</td><td width="80"> <input type="text" name="address" value="<%= address %>"></td></tr>
			<tr><td width="80">가입일자</td><td width="80"> <input type="text" name="joindate" value="<%= joindate %>"></td></tr>
			<tr><td width="80">고객등급</td><td width="80"> <input type="text" name="grade" value="<%= grade %>"></td></tr>
			<tr><td width="80">거주지역</td><td width="80"> <input type="text" name="city" value="<%= city %>"></td></tr>
			<tr><td colspan="2"><input type="button" name="btnUpdate" value="수정" ONCLICK="Update()"> 
					<input type="button" name="btnExit" value="돌아가기"                                  
					ONCLICK="document.location.href='member_list.jsp'">
					<input type="button" name="btnDelete" value="삭제"
					ONCLICK="Delete()">
			</td></tr>
<%	}
		// out.println("</table>");
		// statement 메모리를 닫는다.
		stmt.close();
		// DB를 닫는다. (DB disconnect)
		conn.close();
	%>
	</table>
	</form>
</body>
</html>