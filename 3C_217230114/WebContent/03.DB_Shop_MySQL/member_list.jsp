<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
	<h3 align="center">회원목록조회</h3> 
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원이름</th>
			<th width="120">전화번호</th>
			<th width="300">주소</th>
			<th width="120">가입일자</th>
			<th width="120">고객등급</th>
			<th width="120">거주지역</th>
		</tr>
						
	<%
		// DB를 연다
		String custno  = null,
					custname = null,
				 	phone    = null,
				 	address  = null,
				 	joindate = null,
				 	grade    = null,
				 	city     = null;

		Connection conn = null; 
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/jspdb3?useSSL=false&serverTimezone=UTC"; // jspdb3: 내가 생성한 데이터베이스 이름
			String user = "root";
			String password = "217230114";
			
			conn = DriverManager.getConnection(url, user, password); 
			if(conn != null)
			{
				System.out.println("Database Connect : [" + "<b>success</b>]<br>");
			}else{
				System.out.println("Database Connect : [" + "<b>fail</b>]<br>");
			};
			// sql 실행
			// sql statement 메모리 확보
			Statement stmt = conn.createStatement();
			// 직후에 결과를 메모리에 담는다.   sql 실행                                                             sql 작성
			ResultSet rs = stmt.executeQuery(
														"SELECT custno, custname, phone, address, joindate, "+
														"(CASE grade "+
																"WHEN 'A' THEN 'VIP' "+
																"WHEN 'B' THEN '직원' "+
																"WHEN 'C' THEN '일반' "+
																"END "+
																")AS mgrade, city FROM member_tbl_02"
														);
			// 결과를 사용한다. (출력)                               
			while(rs.next()){
%>
				<tr><td>
				<a href="member_list_update.jsp?custno=<%=rs.getString("custno")%>">
				<%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td></tr>
				
<%		}
			
			// out.println("</table>");
			// statement 메모리를 닫는다.
			stmt.close();
			// DB를 닫는다. (DB disconnect)
			conn.close();
		} catch (Exception ex){
			ex.printStackTrace();
		}
		
		
	%>
	</table>