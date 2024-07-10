<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String s=(String) session.getAttribute("change_password"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/customer_login.css?v=1" type="text/css">

<title>Change password..</title>
</head>
<body>
	<center>
		<% if(s==null){ %>
		<h1>Change Your Password</h1>
		<%}else{ %>
		<h1><%= s %></h1>
		<%} %>
		<form action="change_password" method="post">
			<table>
				<tr>
					<td>Enter Account Number :</td>
					<td><input type="text" placeholder="enter here..." name="acc_no" /></td>
				</tr>
				<tr>
					<td>Enter your current password :</td>
					<td><input type="password" placeholder="old password" name="old" /></td>
				</tr>
				<tr>
					<td>Enter your new password :</td>
					<td><input type="password" placeholder="new password" name="new" /></td>
				</tr>
				<tr>
					<td><button>Change</button></td>
					</form>
					<td><form action="javascript:history.back()"><button >Go Back</button></form></td>
				</tr>
			</table>
		
	</center>
</body>
</html>