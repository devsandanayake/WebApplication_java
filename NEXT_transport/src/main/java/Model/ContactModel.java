package Model;

public class ContactModel {
	String name,email,msg;
	int tp;
	
	//getters annd methods
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
	
	
	public ContactModel(String name, String email, String msg, int tp) {
		
		this.name = name;
		this.email = email;
		this.msg = msg;
		this.tp = tp;
	}
	
	

}
