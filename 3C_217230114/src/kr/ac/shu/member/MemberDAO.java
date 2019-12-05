package kr.ac.shu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;

import kr.ac.shu.util.DateTimeUtil;


public class MemberDAO {
	private Connection con;

	// 객체선언
	public MemberDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<MemberDTO> selectMemberAllData(){
		ArrayList<MemberDTO> array1 = new ArrayList<MemberDTO>();
		String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_02";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO temp = new MemberDTO();
				temp.setCustno  (rs.getInt      ("custno  "));
				temp.setCustname(rs.getString   ("custname"));
				temp.setPhone   (rs.getString   ("phone   "));
				temp.setAddress (rs.getString   ("address "));
				temp.setJoindate(rs.getDate      ("joindate"));
				temp.setGrade   (rs.getString   ("grade   "));
				temp.setCity    (rs.getString   ("city    "));
				
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
	public boolean insertMemberData(MemberDTO notice) {
		boolean result = true;
		System.out.println(notice.toString());

		String sql = "insert into money_tbl_02 (custno, custname, phone, address, joindate, grade, city)  values (?, ?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt      (1, notice.getCustno  ());
			pstmt.setString   (2, notice.getCustname());
			pstmt.setString   (3, notice.getPhone   ());
			pstmt.setString   (4, notice.getAddress ());
			pstmt.setDate     (5, notice.getJoindate());
			pstmt.setString   (6, notice.getGrade   ());
			pstmt.setString   (7, notice.getCity    ());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO selectMemberIdxData(int idx){
		MemberDTO member = new MemberDTO();
		String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_02 where idx=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				member.setCustno  (rs.getInt      ("custno  "));
				member.setCustname(rs.getString   ("custname"));
				member.setPhone   (rs.getString   ("phone   "));
				member.setAddress (rs.getString   ("address "));
				member.setJoindate(rs.getDate     ("joindate"));
				member.setGrade   (rs.getString   ("grade   "));
				member.setCity    (rs.getString   ("city    "));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		System.out.println("수정 : "+member.toString());
		
		return member;
	}
	
	public boolean updateMemberData(MemberDTO notice) {
		boolean result = true;
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString   (1, notice.getCustname());
			pstmt.setString   (2, notice.getPhone   ());
			pstmt.setString   (3, notice.getAddress ());
			pstmt.setDate     (4, notice.getJoindate());
			pstmt.setString   (5, notice.getGrade   ());
			pstmt.setString   (6, notice.getCity    ());
			pstmt.setInt      (7, notice.getCustno  ());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteMemberData(int custNo) {
		boolean result = true;
		String sql = "delete from member_tbl_02 where custno=?";
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
