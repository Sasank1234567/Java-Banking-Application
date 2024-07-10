<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.entity.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<% List<Customer> l= (List<Customer>) session.getAttribute("viewAll");
	Iterator itr=l.iterator();
	String s="<tr><td class=\"recieve\">Account_number</td><td class=\"recieve\">Full Name</td><td class=\"recieve\">Balance</td></tr>";
	while(itr.hasNext()){
		Customer c= (Customer) itr.next();
		String st1=c.getFullName();
		String st2=c.getAccNumber();
		double bal=c.getBalance();
		s=s+"<tr><td >"+st2+"</td><td >"+st1+"</td><td>"+bal+"</td></tr>";
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/customer_home.css?v=1" type="text/css">
<style>
	.recieve{
		border:none;
		font-size:30px;
		text-decoration:underline;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<center>
	<h1>All Customers</h1>
		<table>
				<%= s%>
				<tr>
					<td></td>
					<td><form action="javascript:history.back()"><button>Go Back</button></form></td>
				</tr>
			
		</table>
	</center>
</body>
</html>