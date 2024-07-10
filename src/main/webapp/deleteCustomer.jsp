<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String s=(String) session.getAttribute("delCust"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/withdrawl_page.css?v=1" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<center>
	<% if(s==null){ %>
	<h1>Delete Customer</h1>
	<% }else{ %>
	<h1><%= s %></h1>
	<%} %>
		<form action="delete_customer" method="post"> 
			<table>
				<tr>
					<td>Enter account number :</td>
					<td><input type="text" placeholder="enter here.." name="acc_no"/></td>
				</tr>
				<tr>
					<td>Enter customer name :</td>
					<td><input type="text" placeholder="enter here.." name="full_name"/></td>
				</tr>
				<tr>
					<td><button>Delete</button></form></td>
					<td><form action="javascript:history.back()"><button>Go Back</button></form></td>
				</tr>
				
			</table>
	</center>
</body>
</html>