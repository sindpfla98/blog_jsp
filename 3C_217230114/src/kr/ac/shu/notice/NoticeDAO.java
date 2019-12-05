package kr.ac.shu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.ac.shu.util.DateTimeUtil;


public class NoticeDAO {
	private Connection con;

	public NoticeDAO(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<NoticeDTO> selectNoticeAllData(){
		ArrayList<NoticeDTO> array1 = new ArrayList<NoticeDTO>();
		String sql = "select idx, name, email, phone, address, created, updated from notice_00";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO temp = new NoticeDTO();
				temp.setIdx(rs.getInt("idx"));
				temp.setName(rs.getString("name"));
				temp.setEmail(rs.getString("email"));
				temp.setPhone(rs.getString("phone"));
				temp.setAddress(rs.getString("address"));
				temp.setCreated(rs.getTimestamp("created"));
				temp.setUpdated(rs.getTimestamp("updated"));
				
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
	public boolean insertNoticeData(NoticeDTO notice) {
		boolean result = true;
		System.out.println(notice.toString());

		String sql = "insert into notice_00 (name, email, phone, address, created, updated)  values (?, ?, ?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,  notice.getName());
			pstmt.setString(2,  notice.getEmail());
			pstmt.setString(3,  notice.getPhone());
			pstmt.setString(4,  notice.getAddress());
			pstmt.setTimestamp(5, notice.getCreated());
			pstmt.setTimestamp(6, notice.getUpdated());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public NoticeDTO selectNoticeIdxData(int idx){
		NoticeDTO notice = new NoticeDTO();
		String sql = "select idx, name, email, phone, address, created, updated from notice_00 where idx=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				notice.setIdx(rs.getInt("idx"));
				notice.setName(rs.getString("name"));
				notice.setEmail(rs.getString("email"));
				notice.setPhone(rs.getString("phone"));
				notice.setAddress(rs.getString("address"));
				notice.setCreated(rs.getTimestamp("created"));
				notice.setUpdated(rs.getTimestamp("updated"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		System.out.println("수정 : "+notice.toString());
		
		return notice;
	}
	
	public boolean updateNoticeData(NoticeDTO notice) {
		boolean result = true;
		String sql = "update notice_00 set updated=?, name=?, email=?, phone=?, address=? where idx=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setTimestamp(1, notice.getUpdated());
			pstmt.setString(2, notice.getName());
			pstmt.setString(3, notice.getEmail());
			pstmt.setString(4, notice.getPhone());
			pstmt.setString(5, notice.getAddress());
			pstmt.setInt(6, notice.getIdx());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteNoticeData(int idx) {
		boolean result = true;
		String sql = "delete from notice_00 where idx=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
}
