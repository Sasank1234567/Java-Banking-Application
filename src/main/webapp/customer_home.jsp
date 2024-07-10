<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="com.entity.Customer" %>
<%
	Customer c=(Customer) session.getAttribute("cHome");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/customer_home.css" type="text/css">
<style type="text/css">
	div.logout{
		text-align:right;
	}
	form.logout{
		display:inline-block;
	}
	button.logout{
		height:30px;
	}
</style>
<title>Home Page</title>
</head>
<body>
	<div class="logout">
		<form class="logout" action="customer_login.jsp"><button class="logout">log out</button></form>
	</div>
	<div>
	<center>
		<h1>Customer Home</h1>
		<div id="image"><img src='user.png'/></div>
			<table>
				<tr>
					<td>Name :</td>
					<td class="recieve"><%= c.getFullName() %></td>
				</tr>
				<tr>
					<td>DOB:</td>
					<td class="recieve"><%= c.getDob() %></td>
				</tr>
				
				<tr>
					<td>Account Number :</td>
					<td class="recieve"><%= c.getAccNumber() %></td>
				</tr>
				<tr>
					<td>Balance :</td>
					<td class="recieve"><%= c.getBalance() %></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td class="recieve"><%= c.getEmail() %></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><form action="withdrawl_page.jsp?acc_no=<%= c.getAccNumber() %>"><button>Withdraw</button></form></td>
					<td><form action="deposit_page.jsp"><button>Deposit</button></form></td>
				</tr>
				<tr>
					<td><form action="changeDetailsByCustomer.jsp"><button>Change Details</button></form></td>
					<td><form action="change_password.jsp"><button>Change Password</button></form></td>
				</tr>
			</table>
	</center>
	</div>
</body>
</html>