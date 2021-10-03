<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] product = new String[5];
	String[] price = new String[5];
	
	String tmp;
	tmp = request.getParameter("product_1");	
	product[0] = tmp;
	tmp= request.getParameter("price_1");	
	price[0] = tmp;
	
	tmp = request.getParameter("product_2");	
	product[1] = tmp;
	tmp= request.getParameter("price_2");	
	price[1] = tmp;

	tmp = request.getParameter("product_3");	
	product[2] = tmp;
	tmp= request.getParameter("price_3");	
	price[2] = tmp;
	
	tmp = request.getParameter("product_4");	
	product[3] = tmp;
	tmp= request.getParameter("price_4");	
	price[3] = tmp;
	
	tmp = request.getParameter("product_5");	
	product[4] = tmp;
	tmp= request.getParameter("price_5");	
	price[4] = tmp;

	int hap = 0;
	for(int i = 0; i < product.length; i++){
		String pro = product[i];
		int pri = Integer.parseInt(price[i]);
%>
		<tr>
			<td><%=pro %></td>
			<td>............</td>
			<td><%=pri %></td>
		</tr>
		<br>
<%		
	}
%>
<hr>
합계 ..........<%=hap%>