package DB;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.ContactModel;
import Model.PaymentModel;
import Model.RootModel;
import Model.UserModel;

public class DatabaseHelper {
	Connection con;
	String Usertype;
	public DatabaseHelper(Connection con)
	{
		this.con=con;
	}
	//for register user 
    public boolean saveUser(UserModel user){
        boolean set = false;
        //Exception Handling
        try{
            //Insert register data to database
            String query = "INSERT INTO `users`( `fname`, `lname`, `email`, `password`, `cat`) "
            		+ "VALUES ('"+user.getFname()+"','"+user.getLname()+"','"+user.getEmail()+"',"
            				+ "'"+user.getPassword()+"','"+user.getCat()+"')";
           
           PreparedStatement pt = this.con.prepareStatement(query);
         
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
  //for Login user
    public boolean checkuser(String email,String password)
	{
		boolean st=false;
		//Exception Handling
		try {
			 Connection con=DB.getConnection();
			 PreparedStatement ps=(PreparedStatement) con.prepareStatement("select  * from users where email=? and password=?");
			 ps.setString(1, email);
	         ps.setString(2, password);
	         ResultSet rs=ps.executeQuery();
	         st=rs.next();
	        
	         
		}
		catch(Exception ex)
		{
			 ex.printStackTrace();
		}
		return st;
	}
    
    //for Send Contact Information - insert
    public  boolean contactus(ContactModel contact)
   	{
   		boolean st=false;
   		//Exception Handling
   		try {
   		 Connection con=DB.getConnection();
   		 String sql="INSERT INTO `contact`( `name`, `email`, `tp`, `msg`) VALUES('"+"','"+contact.getName()+"','"+contact.getEmail()+"',"+contact.getTp()+",'"+contact.getMsg()+"')";
 		 PreparedStatement pst=con.prepareStatement(sql);
 	     pst.executeUpdate();
   	        
   	         
   		}
   		catch(Exception ex)
   		{
   			 ex.printStackTrace();
   		}
   		return st;
   	}
    
  //for Send Payment Information 
    public  boolean pay(PaymentModel payment)
   	{
    	String address=payment.getA1()+","+payment.getA2();
   		boolean st=false;
   		//Exception Handling
   		try {
   		 Connection con=DB.getConnection();
   		 String sql="INSERT INTO `payment`( `name`, `address`, `email`, `tp`, `p_method`, `c_number`, `cvc`, `exp_date`) VALUES"
   		 		+ " ('"+payment.getName()+"','"+payment.getEmail()+"','"+address+"',"+payment.getTp()+",'"+payment.getPmethod()+"',"
   		 				+ "'"+payment.getCnumber()+"','"+payment.getCvc()+"','"+payment.getExp()+"')";
 		 PreparedStatement pst=con.prepareStatement(sql);
 	     pst.executeUpdate();
    
   		}
   		catch(Exception ex)
   		{
   			 ex.printStackTrace();
   		}
   		return st;
   	}
    //for Send Contact Information - insert
    public  boolean rootdetails(RootModel root)
   	{
   		boolean st=false;
   		//Exception Handling
   		try {
   		 Connection con=DB.getConnection();
   		 String sql="INSERT INTO `location`( `You_L`, `D_L`, `V_T`, `Con_Num`,`Pase`, `Cus_ID`) VALUES"+"('"+root.getName()+"','"+root.getType()+"','"+root.getCat()+"','"+root.getMan()+"','"+root.getQty()+"','"+root.getId()+"')";
 		 PreparedStatement pst=con.prepareStatement(sql);
 	     pst.executeUpdate();
   	        
   	         
   		}
   		catch(Exception ex)
   		{
   			 ex.printStackTrace();
   		}
   		return st;
   	}
    
   
   

}
