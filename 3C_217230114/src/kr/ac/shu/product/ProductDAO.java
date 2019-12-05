package kr.ac.shu.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.ac.shu.util.DateTimeUtil;


public class ProductDAO {
	private Connection con;

	public ProductDAO(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<ProductDTO> selectProductAllData(){
		ArrayList<ProductDTO> array1 = new ArrayList<ProductDTO>();
		String sql = "select pcode, pname, pcst, unit from product_tbl_02";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO temp = new ProductDTO();
				temp.setPcode (rs.getString("pcode"));
				temp.setPname (rs.getString("pname"));
				temp.setPcost (rs.getInt   ("pcost"));
				temp.setUnit  (rs.getString("unit "));				
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
	public boolean insertProductData(ProductDTO product) {
		boolean result = true;
		System.out.println(product.toString());

		String sql = "insert into product_tbl_02 (pcode, pname, pcost, unit)  values (?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,  product.getPcode());
			pstmt.setString(2,  product.getPname());
			pstmt.setInt   (3,  product.getPcost());
			pstmt.setString(4,  product.getUnit ());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public ProductDTO selectProductIdxData(int Pcode){
		ProductDTO product = new ProductDTO();
		String sql = "select pcode, pname, pcst, unit from product_tbl_02 where pcode=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Pcode);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				product.setPcode (rs.getString("pcode"));
				product.setPname (rs.getString("pname"));
				product.setPcost (rs.getInt   ("pcost"));
				product.setUnit  (rs.getString("unit "));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		System.out.println("수정 : "+product.toString());
		
		return product;
	}
	
	public boolean updateProductData(ProductDTO product) {
		boolean result = true;
		String sql = "update product_tbl_02 set pname=?, pcost=?, unit=? where pcode=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setInt   (2, product.getPcost());
			pstmt.setString(3, product.getUnit());
			pstmt.setString(4, product.getPcode());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deleteProductData(int Pcode) {
		boolean result = true;
		String sql = "delete from product_tbl_02 where pcode=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Pcode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
}
