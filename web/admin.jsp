<%-- 
    Document   : admin
    Created on : Dec 21, 2020, 6:34:18 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <h1>Welcome Admin: ${sessionScope.LOGIN_USER.name} </h1>



        <a href="MainController?action=Logout">Logout</a>

        <h1>
            Insert Book
        </h1>

        <form action="MainController" method="post">
            BookID <input type="text" name="productID" value="${param.productID}" required="true"/><br/>
            BookName <input type="text" name="productName" value="${param.productName}" required="true"/><br/>
            price <input type="text" name="price" value="${param.price}" required="true"/><br/>
            quantity <input type="text" name="quantity" value="${param.quantity}" required="true"/><br/>
            image <input type="text" name="image" value="${param.image}" required="true"/><br/>
            <input type="submit" name="action" value="Insert"/>
        </form>
        ${requestScope.ketQuaCreate}

        <h1>Book List</h1>
        <form action="MainController" method="post">
            Search <input type="text" name="search1" value="${param.search1}"/>
            <input type="submit" name="action" value="Search1"/>
        </form>
         
            <c:if test="${requestScope.listBook1 != null}">
                
                <c:if test="${not empty requestScope.listBook1}">
                    
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Book ID</th>
                                <th>Book Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Image</th>
                                <th>Delete Button</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:forEach var="li" varStatus="counter" items="${listBook1}">
                            
                            <tr>
                                <td>${counter.count}</td>
                                <td>${li.productID}</td>
                                <td>${li.productName}</td>
                                <td>${li.price}</td>
                                <td>${li.quantity}</td>
                                <td>
                                    <img src="${li.image}" alt="Hinh Book" width="300" height="200"/>
                                </td>
                                <td>
                                    <form action="MainController" method="post">
                                        
                                        <input type="hidden" name="productID" value="${li.productID}"/>
                                        <input type="hidden" name="search1" value="${param.search1}"/>
                                        <input type="submit" name="action" value="Delete"/>
                                    </form>
                                </td>
                            </tr>
                            
                            </c:forEach>
                        </tbody>
                    </table>

                    
                    
                </c:if>
                
                
            </c:if>
        

<%--
        <c:if test="${requestScope.listBook1 != null}">
            <c:if test="${not empty requestScope.listBook1}">
                
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Delete</th>                             
                        </tr>
                    </thead>
                    
                    <tbody>
                        
                        <c:forEach var="li" varStatus="counter" items="${requestScope.listBook1}">

                            <tr>
                                <td>${counter.count}</td>
                                <td>${li.productID}</td>
                                <td>
                                    <input type="text" name="productName" value="${li.productName}" required="true"/>
                                </td>
                                <td>
                                    <input type="text" name="price" value="${li.price}" required="true"/>
                                </td>
                                <td>
                                    <input type="text" name="quantity" value="${li.quantity}" required="true"/>
                                </td>
                                <td>
                                    <img src="${li.image}" alt="HinhBook" width="300" height="200"> 

                                </td>
                                <td>

                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="productID" value="${li.productID}"></c:param>
                                        <c:param name="search" value="${param.search1}"></c:param>
                                    </c:url>
                                    <a href="${deleteLink}">Delete</a>
                                </td>
                            </tr>

                        </c:forEach>
                            
                    </tbody>
                </table>

            </c:if>
        </c:if>
--%>

    </body>
</html>
