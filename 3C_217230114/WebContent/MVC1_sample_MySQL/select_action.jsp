<%@page import="MYDB_Sample_MVC1.DBConnection" %>
<%@page import="MYDB_Sample_MVC1.WooriDAO" %>
<%@page import="MYDB_Sample_MVC1.WooriDTO" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 확인 화면</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		int password = Integer.parseInt(request.getParameter("password"));
		String passwordString = Integer.toString(password);
		WooriDTO member = new WooriDTO();
		
		Connection con = DBConnection.openConnection();
		WooriDAO dao1 = new WooriDAO(con);
		member = dao1.selectIdData(id);
		DBConnection.closeConnection(con);
		
		if(member.getId() == null){
			out.println("<script>alert('해당되는 회원이 없습니다.');location.href='select.html';</script>");
		}else{
			if(password == member.getPassword()){
	%>
	사용자 ID가 <%= id %>인 회원의 정보는 다음과 같습니다.
	정보를 변경하려면 내용을 입력한 다음 [수정하기]버튼을 누르세요.
	<form name="form1" method="post" action="update.jsp">
		<input type="hidden" name="id" value="<%=id%>"><br/>
		이름 : <input type="text" name="name" value="<%=member.getName()%>"><br/>
		E-mail : <input type="text" name="email" value="<%=member.getEmail()%>"><br/>
		<input type="hidden" name="password" value="<%=passwordString%>"><br/>
		<input type="submit" name="change" value="수정하기">
		<a href="delete.jsp?id<%=id %>">삭제하기</a>
	</form>
	<%
			}else{
				out.println("<script>alert('비밀번호가 틀립니다.');location.href='select.html';</script>");
			}
		}
	%>
</body>
</html>