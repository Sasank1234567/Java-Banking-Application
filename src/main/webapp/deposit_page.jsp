<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/withdrawl_page.css?v=1" type="text/css">
<title>Money Deposit</title>
</head>
<body>
<center>
	<div>
		<form action="deposit_" method="post">
			<h1>Money Deposit Page</h1>
			<table>
				<td>Enter Account Number :</td>
				<td><input placeholder="enter here..."type="text" name="acc_no"/><b>/-<b></td>
				</tr>
				<tr>
				<tr>
				<td>Enter Amount to deposit (in Rs.) :</td>
				<td><input placeholder="e.g. 500.00"type="text" name="amount"/><b>/-<b></td>
				</tr>
				<tr>
					<td id="right"><button  type="submit" >Deposit</button></td>
					</form>
					<td>
						<form action="javascript:history.back()">
							<button type="submit">Go Back</button>
						</form>
					</td>
					
				</tr>
			</table>
	</div>
</center>
</body>
</html>