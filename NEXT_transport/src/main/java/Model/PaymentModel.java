package Model;

public class PaymentModel {
	
	String name;
	String email;
	String a1;
	String a2;
	 
	int tp;
	String pmethod;
	String cnumber;
	String cvc;
	String exp;
	
	
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
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	 
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
	public String getPmethod() {
		return pmethod;
	}
	public void setPmethod(String pmethod) {
		this.pmethod = pmethod;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	
	
	public PaymentModel(String name, String email, String a1, String a2,  int tp,
			String pmethod, String cnumber, String cvc, String exp) {
	
		this.name = name;
		this.email = email;
		this.a1 = a1;
		this.a2 = a2;
		 
		this.tp = tp;
		this.pmethod = pmethod;
		this.cnumber = cnumber;
		this.cvc = cvc;
		this.exp = exp;
	}
	
	
	

}
