<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] product = new String[5];
	
	String one;
	one = request.getParameter("product_1") + ",";	
	one += request.getParameter("price_1");	
	product[0] = one;
	
	String two;
	two = request.getParameter("product_2") + ",";		
	two += request.getParameter("price_2");	
	product[1] = two;
	
	String three;
	three = request.getParameter("product_3") + ",";		
	three += request.getParameter("price_3");	
	product[2] = three;
	
	String four;
	four = request.getParameter("product_4") + ",";		
	four += request.getParameter("price_4");	
	product[3] = four;
	
	String five;
	five = request.getParameter("product_5") + ",";		
	five += request.getParameter("price_5");	
	product[4] = five;

	int hap = 0;
	String pro; //상품
	int pri = 0; //가격
	for(int i = 0; i < product.length; i++){
		String pro_[] = product[i].split(",");
		pro = pro_[0];
		pri = Integer.parseInt(pro_[1]);
		hap += pri;
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