package kr.ac.shu.money;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;

import java.util.ArrayList;
import kr.ac.shu.util.DateTimeUtil;


public class MoneyDAO {
	private Connection con;

	public MoneyDAO(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<MoneyDTO> selectMoneyAllData(){
		ArrayList<MoneyDTO> array1 = new ArrayList<MoneyDTO>();
		String sql = "select custno, saleno, pcost, amount, price, pcode, sdate from money_tbl_02";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MoneyDTO temp = new MoneyDTO();
				temp.setCustno(rs.getInt   ("custno"));
				temp.setSaleno(rs.getInt   ("saleno"));
				temp.setPcost (rs.getInt   ("pcost "));
				temp.setAmount(rs.getInt   ("amount"));
				temp.setPrice (rs.getInt   ("price "));
				temp.setPcode (rs.getString("pcode "));
				temp.setSdate (rs.getDate  ("sdate "));
				
				array1.add(temp);
				//System.out.println("NoticeDAO" + temp.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return array1;
	}
	//---------------------------------------------------------------------------------------------------------------------
	// MySQL 
	//---------------------------------------------------------------------------------------------------------------------
	public boolean insertMoneyData(MoneyDTO money) {
		boolean result = true;
		System.out.println(money.toString());

		String sql = "insert into money_tbl_02 (custno, saleno, pcost, amount, price, pcode, sdate)  values (?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt    (1,  money.getCustno());
			pstmt.setInt    (2,  money.getSaleno());
			pstmt.setInt    (3,  money.getPcost ());
			pstmt.setInt    (4,  money.getAmount());
			pstmt.setInt    (5,  money.getPrice ());
			pstmt.setString (6,  money.getPcode ());
			pstmt.setDate   (7,  money.getSdate ()); 
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public MoneyDTO selectMoneyIdxData(int idx){
		MoneyDTO money = new MoneyDTO();
		String sql = " select custno, saleno, pcost, amount, price, pcode, sdate from money_tbl_02 where custno=? ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				money.setCustno(rs.getInt   ("custno"));
				money.setSaleno(rs.getInt   ("saleno"));
				money.setPcost (rs.getInt   ("pcost "));
				money.setAmount(rs.getInt   ("amount"));
				money.setPrice (rs.getInt   ("price "));
				money.setPcode (rs.getString("pcode "));
				money.setSdate (rs.getDate  ("sdate "));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		System.out.println("수정 : "+money.toString());
		
		return money;
	}
	
	public boolean updateMoneyData(MoneyDTO money) {
		boolean result = true;
		String sql = " update money_tbl_02 set saleno=?, pcost=?, amount=?, price=?, pcode=?, sdate=?  where custno=? ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt   (1, money.getSaleno());
			pstmt.setInt   (2, money.getPcost ());
			pstmt.setInt   (3, money.getAmount());
			pstmt.setInt   (4, money.getPrice ());
			pstmt.setString(5, money.getPcode ());
			pstmt.setDate  (6, money.getSdate ());
			pstmt.setInt   (7, money.getCustno()); 
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteMoneyData(int custNo) {
		boolean result = true;
		String sql = "delete from money_tbl_02 where custno=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
}
