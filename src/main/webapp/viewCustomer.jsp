<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.entity.Customer" %>
<% 
    Customer c = (Customer) session.getAttribute("viewOne");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/withdrawl_page.css?v=1" type="text/css">
<style>
    table {
        border-spacing: 20px;
    }
    td {
        width: 170px;
        text-align: right;
    }
    .recieve {
        text-align: center;
        border-style: double;
        margin-left: 5px;
    }
</style>
<title>Customer Details</title>
</head>
<body>
    <center>
        <h1>Customer Details</h1>
        <form action="admin_to_customer" method="post">
            <table>
                <tr>
                    <td>Enter Account Number :</td>
                    <td><input type="text" placeholder="enter here..." name="acc_no" /></td>
                </tr>
                <tr>
                    <td><button type="submit">Submit</button></td>
                    <td><button type="button" onclick="history.back()">Go Back</button></td>
                </tr>
            </table>
        </form>
        <br>
        <table>
            <% 
                if (c != null && c.getFullName()!=null) { 
            %>
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
                    <td>Id Proof :</td>
                    <td class="recieve"><%= c.getIdProof() %></td>
                </tr>
            <% 
                } else{
            %>
            <tr>
            	<td>No Account Found...</td>
            </tr>
            <% } %>
        </table>
    </center>
</body>
</html>
