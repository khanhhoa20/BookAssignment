<%-- 
    Document   : user
    Created on : Dec 21, 2020, 6:34:08 PM
    Author     : PC

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Welcome User: ${sessionScope.LOGIN_USER.name} </h1>

        <c:url var="logout" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logout}">Logout</a>

        <h1>Book List</h1>
        <form action="MainController" method="post">
            Search <input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
        </form>
            
            <c:if test="${requestScope.listBook != null}">
                <c:if test="${not empty requestScope.listBook}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Book ID</th>
                                <th>Book Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="li" varStatus="counter" items="${requestScope.listBook}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${li.productID}</td>
                                <td>${li.productName}</td>
                                <td>${li.price}</td>
                                <td>${li.quantity}</td>
                                <td>
                                    <img src="${li.image}" alt="HinhBook" width="300" height="200">
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </c:if>
            </c:if>
      
            
            
        

    </body>
</html>
