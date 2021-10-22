<%-- 
    Document   : index
    Created on : Dec 21, 2020, 6:05:36 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            Name <input type="text" name="name" required="true"/><br/>
            Password <input type="password" name="password" required="true"/><br/>
            <input type="submit" name="action" value="Login"/>
        </form>
        
        <a href="user.jsp">Buy Book</a>
    </body>
</html>
