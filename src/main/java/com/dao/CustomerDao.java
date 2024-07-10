package com.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;

public class CustomerDao {
		private String jdbc_url="jdbc:mysql://localhost:3306/bank";
		private String jdbc_user="root";
		private String jdbc_pass="sasank123.";
		private Connection conn;
		
		public CustomerDao() {
			conn=this.getConnection(jdbc_url,jdbc_user,jdbc_pass);
		}
		
		public Connection getConnection(String url,String username,String password) {
			Connection conn=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,username,password);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}

		public boolean updateCustomer(Customer c,String accNumber) {
			try {
				String query="update customer set  full_name=?, address=?, mobile_no=?,email=?, dob=? where acc_no=? And password=?";
				PreparedStatement ps=conn.prepareStatement(query);
				
				ps.setString(1, c.getFullName());
				ps.setString(2, c.getAddress());
				ps.setString(3, c.getMobileNumber());
				ps.setString(4, c.getEmail());
				ps.setString(5, c.getDob());
				ps.setString(6, c.getAccNumber());
				ps.setString(7, c.getPassword());
				
				int k=ps.executeUpdate();
				
				if(k==1)
						return true;
				else
						return false;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
public boolean changePassword(String acc, String o, String n) {
				try {
					PreparedStatement ps=conn.prepareStatement(" update customer set password=? where password=? AND acc_no=?; ");
					ps.setString(1, n);
					ps.setString(2, o);
					ps.setString(3, acc);
					
					int k=ps.executeUpdate();
					
					if( k == 1 ) {
						return true;
					}else {
						return false;
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				return false;
		}
		
		public Customer getCustomer(String acn) {
			try {
				String query="select * from customer where acc_no=?";
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setString(1, acn);
				
				ResultSet rs=ps.executeQuery();
				System.out.println(rs);
				Customer c=new Customer();
				db_to_customer(c,rs);
				
				System.out.println(c);
				return c;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
		public List<Customer> getCustomers(){
			try {
				Statement st=conn.createStatement();
				ResultSet rs=st.executeQuery("select * from customer");
				List<Customer> lc=new ArrayList<>();
				while(rs.next()) {
					Customer c=new Customer();
					c=db_to_customer(c,rs);
					lc.add(c);
				}
				return lc;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public boolean withDrawl(double amount,String ac_no) {
			try {
				System.out.println(amount+"------"+ac_no);
				PreparedStatement ps=conn.prepareStatement("update customer set balance=balance-? where acc_no=?");
				ps.setDouble(1,amount );
				ps.setString(2, ac_no);
				int k=ps.executeUpdate();
				if(k==1) {
					return true;
				}else {
					return false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
		public boolean deposit(double amount,String ac_no) {
			try {
				PreparedStatement ps=conn.prepareStatement("update customer set balance=balance+? where acc_no=?");
				ps.setDouble(1,amount );
				ps.setString(2, ac_no);
				int k=ps.executeUpdate();
				if(k==1) {
					return true;
				}else {
					return false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
		public Customer db_to_customer(Customer c,ResultSet rs) {
			try {
				while(rs.next()) {
				c.setAccNumber(rs.getString("acc_no"));
				c.setAccType(rs.getString("acc_type"));
				c.setAddress(rs.getString("address"));
				c.setBalance(rs.getDouble("balance"));
				c.setDob(rs.getString("dob"));
				c.setEmail(rs.getString("email"));
				c.setFullName(rs.getString("full_name"));
				c.setIdProof(rs.getString("id_proof"));
				c.setMobileNumber(rs.getString("mobile_no"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return c;
		}

		public boolean login(String acc_no,String pass) {
			try {

				Connection conn=getConnection(jdbc_url, jdbc_user, jdbc_pass);
				System.out.println(conn);
				PreparedStatement ps=conn.prepareStatement("select * from customer where acc_no=? AND password=?");
				ps.setString(1,acc_no);
				ps.setString(2, pass);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					System.out.println(rs.getString("acc_no"));
					return true;
				}else {
					return false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
}
