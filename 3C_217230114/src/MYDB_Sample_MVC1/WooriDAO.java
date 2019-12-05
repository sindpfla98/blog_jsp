package MYDB_Sample_MVC1;
import java.sql.*;
import java.util.ArrayList;

public class WooriDAO {
	private Connection con;
	public WooriDAO(Connection con) {
		this.con = con;
	}

	public boolean createTable() {
		PreparedStatement pstmt = null;
		boolean result = true;
		String sql = " create table woori(id       varchar(10) primary key, "
				   + "                    name     varchar(15) not null,    "
				   + "                    email    varchar(30),             "
				   + "                    password int(20)     )            ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public boolean alterTable() {
		Statement stmt = null;
		boolean result = true;
		String sql1 = "alter table woori change name name varchar(15) not null";
		String sql2 = "alter table woori add email varchar(30)";
		String sql3 = "alter table woori add password int(20)";
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql1);
			stmt.executeUpdate(sql2);
			stmt.executeUpdate(sql3);
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(stmt != null)try {stmt.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public boolean insertData(WooriDTO member) {
		PreparedStatement pstmt = null;
		boolean result = true;
		String sql = "insert into woori values( ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setInt(4, member.getPassword());
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public boolean checkID(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = true;
		String sql = "select id, name, email, password from woori where id=?";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = false;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
			if(rs != null)try {rs.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public ArrayList<WooriDTO> selectAllData(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<WooriDTO> array1 = new ArrayList<WooriDTO>();
		String sql = "select id, name, email, password from woori";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WooriDTO temp = new WooriDTO(); 
				temp.setId(rs.getString("id"));
				temp.setName(rs.getString("name"));
				temp.setEmail(rs.getString("email"));
				temp.setPassword(rs.getInt("password"));
				System.out.println(temp.toString());
				array1.add(temp);  
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
			if(rs != null)try {rs.close();} catch (SQLException e) {e.getMessage();}
		}
		return array1;
	}
	
	public WooriDTO selectIdData(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		WooriDTO member = new WooriDTO();
		String sql = "select id, name, email, password from woori where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getInt("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
			if(rs != null)try {rs.close();} catch (SQLException e) {e.getMessage();}
		}
		return member;
	}
	
	
	public boolean updateData(WooriDTO member) {
		PreparedStatement pstmt = null;
		boolean result = true;
		String sql = "update woori set name=?, email=? where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public boolean deleteData(String id) {
		PreparedStatement pstmt = null;
		boolean result = true;
		String sql = "delete from woori where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.getMessage();}
		}
		return result;
	}
	
	public boolean dropTable(String sztableName) {
		Statement stmt = null;
		boolean result = true;
		String sql = " drop table " + sztableName ;			
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(stmt != null)try {stmt.close();} catch (SQLException e) {e.getMessage();}
		}		
		return result;
	}

	public boolean dropTableWoori() {
		Statement stmt = null;
		boolean result = true;
		String sql = " drop table woori " ;			
		try {
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			result = false;
			System.out.println(e.getMessage());
		} finally {
			if(stmt != null)try {stmt.close();} catch (SQLException e) {e.getMessage();}
		}		
		return result;
	}
}

