<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="header.jsp"></c:import>

<h1 align="center">All Product</h1>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" user="root" password="" url="jdbc:mysql://localhost:3306/may"/>
<sql:query var="result" sql="select * from product" dataSource="${ds }"></sql:query>
<c:forEach var="p" items="${result.rows}">
<c:out value="${p.pname }"/>
<BR>
<c:out value="${p.price }"/>
<br>
<a href="<%=request.getContextPath()%>/Controller?action=addtocart&id=<c:out value="${p.id }"/>">ADD TO CART</a>
<BR><BR>
</c:forEach>
<c:if test="${flag == 100 }">

<script type="text/javascript">
alert("product addded");
</script>



</c:if>
</body>
</html>