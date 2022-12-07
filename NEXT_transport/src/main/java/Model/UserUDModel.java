package Model;

public class UserUDModel {
	
	
	int user_id;
	String fname,lname,email;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public UserUDModel(int user_id, String fname, String lname, String email) {
		
		this.user_id = user_id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
	}
	
	

}
