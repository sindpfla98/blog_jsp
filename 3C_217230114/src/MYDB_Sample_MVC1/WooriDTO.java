package MYDB_Sample_MVC1;


public class WooriDTO {
	private String id;
	private String name;
	private String email;
	private int password;
	
	public WooriDTO() {
		super();
	}
	
	public WooriDTO(String id, String name, String email, int password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	} 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "WooriDTO [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + "]";
	}
}
