package kr.ac.shu.notice;

import java.sql.Timestamp;
import java.sql.Date;

public class NoticeDTO {
	private int idx;
	private String name;
	private String email;
	private String phone;
	private String address;
	private Timestamp created;
	private Timestamp updated;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int idx, String name, String email, String phone, String address, 
			Timestamp created,	Timestamp updated) 
	{
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.created = created;
		this.updated = updated;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getUpdated() {
		return updated;
	}

	public void setUpdated(Timestamp updated) {
		this.updated = updated;
	}

	@Override
	public String toString() {
		return "NoticeDTO [idx=" + idx + ", name=" + name + ", email=" + email + ", phone=" + phone + ", address="
				+ address + ", created=" + created + ", updated=" + updated + "]";
	}
}	
