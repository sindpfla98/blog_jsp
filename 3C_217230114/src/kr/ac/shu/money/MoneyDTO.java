package kr.ac.shu.money;

import java.sql.Timestamp;
import java.sql.Date;

/*-------------------------------- 
create table money_tbl_02 
(
   custno     int(6),
   saleno     int(8),
   pcost      int(8),
   amount     int(4),
   price      int(8),
   pcode      char(4),
   sdate      date,
   primary key (custno,saleno)
 ) ;
---------------------------------*/

public class MoneyDTO {
	private int       custno;
	private int       saleno;
	private int       pcost ;
	private int       amount;
	private int       price ;
	private String    pcode ;
	private Date      sdate ;
	public MoneyDTO() {
		super();
	}

	public MoneyDTO(int custno, int saleno, int pcost, int amount, int price, String pcode, Date sdate) {
		super();
		this.custno = custno;
		this.saleno = saleno;
		this.pcost = pcost;
		this.amount = amount;
		this.price = price;
		this.pcode = pcode;
		this.sdate = sdate;
	}

	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public int getSaleno() {
		return saleno;
	}
	public void setSaleno(int saleno) {
		this.saleno = saleno;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	@Override
	public String toString() {
		return "MoneyDTO [custno=" + custno + ", saleno=" + saleno + ", pcost=" + pcost + ", amount=" + amount
				+ ", price=" + price + ", pcode=" + pcode + ", sdate=" + sdate + ", getCustno()=" + getCustno()
				+ ", getSaleno()=" + getSaleno() + ", getPcost()=" + getPcost() + ", getAmount()=" + getAmount()
				+ ", getPrice()=" + getPrice() + ", getPcode()=" + getPcode() + ", getSdate()=" + getSdate() + "]";
	}
}	
