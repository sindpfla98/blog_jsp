package MYDB_Sample_MVC1;
import java.sql.*;

public class DBConnection {
	static {
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch (Exception ex){
		ex.printStackTrace();
	}
}
	public static Connection openConnection() {
		Connection conn = null;
		try {
		String url = "jdbc:mysql://localhost:3306/jspdb3"; // jspdb3: 내가 생성한 데이터베이스 이름
		String user = "root";
		String password = "217230114";
		
		conn = DriverManager.getConnection(url, user, password); 
		if(conn != null)
		{
			System.out.println("Database Connect : [" + "<b>success</b>]<br>");
		}else{
			System.out.println("Database Connect : [" + "<b>fail</b>]<br>");
		};
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return conn;
	} 
	public static void closeConnection(Connection conn) {
		if(conn != null) {
			try {
			conn.close();
			System.out.println("Database disconnect");
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	}
}
