<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>
         <%@ page import="com.product.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:set var="amount" value="${0}"/>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" user="root" password="" url="jdbc:mysql://localhost:3306/may"/>
<sql:query var="result" sql="select * from product" dataSource="${ds }" ></sql:query>
<c:forEach var="row" items="${result.rows }">
<c:forEach var="id" items="${list }">
<c:if test="${row.id == id }">
<c:out value="${row.pname }"/>---<c:out value="${row.price }"/>----
 

    <c:set var="amount" value="${amount + row.price}" />

 <font color="yellow"><a href="<%=request.getContextPath()%>/Controller?action=delete&id=<c:out value="${row.id }"/>">Delete</a></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <button type="button" onclick="document.getElementById('demo').innerHTML">BUY NOW</button>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="<%=request.getContextPath()%>/Controller?action=increment&id=<c:out value="${row.id }"/>">ADD</a>&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="<%=request.getContextPath()%>/Controller?action=add&id=<c:out value="${row.id }"/>">(<%=Product.getList().size() %>)</a>
<br><BR>
</c:if>
</c:forEach>
</c:forEach>



total amount is 
<c:out value="${amount }"/>

</body>
</html>