<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 14</title>
</head>
<body>
<h2>상품 구매 영수증</h2>
	
<form name="buyForm" action="exam14_Proc.jsp" method="post">
	<table>
		<tr>
			<td>
				상품1의 이름
			</td>
			<td>
				<input type="text" name="product_1">
			</td>
		</tr>
		<tr>
			<td>
				상품1의 가격
			</td>
			<td>
				<input type="text" name="price_1">
			</td>
		</tr>
		<tr>
			<td>
				상품2의 이름
			</td>
			<td>
				<input type="text" name="product_2">
			</td>
		</tr>
		<tr>
			<td>
				상품2의 가격
			</td>
			<td>
				<input type="text" name="price_2">
			</td>
		</tr>
		<tr>
			<td>
				상품3의 이름
			</td>
			<td>
				<input type="text" name="product_3">
			</td>
		</tr>
		<tr>
			<td>
				상품3의 가격
			</td>
			<td>
				<input type="text" name="price_3"">
			</td>
		</tr>
		<tr>
			<td>
				상품4의 이름
			</td>
			<td>
				<input type="text" name="product_4">
			</td>
		</tr>
		<tr>
			<td>
				상품4의 가격
			</td>
			<td>
				<input type="text" name="price_4">
			</td>
		</tr>
		<tr>
			<td>
				상품5의 이름
			</td>
			<td>
				<input type="text" name="product_5">
			</td>
		</tr>
		<tr>
			<td>
				상품5의 가격
			</td>
			<td>
				<input type="text" name="price_5">
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit">구매</button>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>