package kr.ac.shu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		}
	}
	
	public static Connection openConnection(){
		Connection con = null;
		try {
			String url = "jdbc:mysql://localhost:3306/jspdb3";
			String id  = "root";
			String passwd = "217230114";
			con = DriverManager.getConnection(url, id, passwd);
			System.out.println("�뜲�씠�꽣踰좎씠�뒪 �뿰寃� �꽦怨�");
		} catch (SQLException e) {
		}
		
		return con;
	}
	public static void closeConnection(Connection con){
		if(con != null){
			try {
				con.close();
				System.out.println("�뜲�씠�꽣踰좎씠�뒪 醫낅즺 �꽦怨�");
			} catch (SQLException e) {
			}
		}
	}
}
