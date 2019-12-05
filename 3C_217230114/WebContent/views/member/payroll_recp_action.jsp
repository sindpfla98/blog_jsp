<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script >
   function display_alert() {
      alert("사원정보가 등록 되었습니다!.");
   }
</script>

<%

	request.setCharacterEncoding("utf-8");	
	String empno, empdate, empname, deptcodeString;
	String[] deptcode;
	int salary, bonus; 
	try {
			empno   			= null;
			empdate  			= null;
			empname  			= null;
			deptcodeString     	= null;
			salary				= 0;
			bonus				= 0;
	    	
			empno		= request.getParameter("empno");
			empdate		= request.getParameter("empdate");
			empname   	= request.getParameter("empname");
			deptcode  	= request.getParameterValues("deptcode");
			salary    	= Integer.parseInt(request.getParameter("salary"));
			bonus    	= Integer.parseInt(request.getParameter("bonus"));
			
			//성별 1: 10[경영], 2: 20[총무], 3 : 30[전산], 4 : 40[구매]
			for(int i=0; i<deptcode.length; i++) {
				if(deptcode[i].equals("1")) { deptcodeString = "10"; continue; } 
				if(deptcode[i].equals("2")) { deptcodeString = "20"; continue; }
				if(deptcode[i].equals("3")) { deptcodeString = "30"; continue; } 
				if(deptcode[i].equals("4")) { deptcodeString = "40"; continue; }
			}
			
		    /*--------jdbc를 통해 database  연결 하기-------*/
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection 
		     	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		    if(conn != null)
		    {
		 	    System.out.println("DB 연결  : success" + "<br>");
		    }else{
		 	    System.out.println("DB 연결  : fail" + "<br>");
		    };
				java.sql.PreparedStatement stat = conn.prepareStatement("insert into tbl_payroll_201906"+
						                                 "(empno, empdate, empname, deptcode, salary, bonus) values(?,?,?,?,?,?)");
				stat.setString(1,empno);
				stat.setString(2,empdate);
				stat.setString(3,empname);
				stat.setString(4,deptcodeString);
				stat.setInt(5,salary);
				stat.setInt(6,bonus);
				stat.executeUpdate();
				conn.commit();
				stat.close();
				conn.close();
				response.sendRedirect("index.jsp?section=payroll_list.jsp");
				//out.println("<script>alert('사원정보가 등록 되었습니다!');location.href='index.jsp?section=payroll_list.jsp'</script>");
				
		}
	catch (Exception e) {
		out.println(e); e.printStackTrace();	}
%>