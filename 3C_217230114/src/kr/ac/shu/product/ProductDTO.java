package kr.ac.shu.product;

import java.sql.Timestamp;
import java.util.Date;

public class ProductDTO {
	private String pcode;
	private String pname;
	private int    pcost;
	private String unit ;
	
	public ProductDTO() {
		super();
	}

	public ProductDTO(String pcode, String pname, int pcost, String unit) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.pcost = pcost;
		this.unit = unit;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPcost() {
		return pcost;
	}

	public void setPcost(int pcost) {
		this.pcost = pcost;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

}	
