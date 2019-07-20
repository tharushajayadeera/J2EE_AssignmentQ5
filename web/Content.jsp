<%-- 
    Document   : Content
    Created on : Jul 12, 2019, 2:54:30 PM
    Author     : Tharusha Jayadeera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="input" prefix="input" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Inventory Control</title>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        
        <h3>Library book list</h3>
        
        <form action="Content.jsp" method="Get">
            
            <table bgcolor="#F2EFEF" border="white" >
                
                    <th>Isbn_no</th>    
                    <th>Short desc</th> 
                    <th>Price</th>  
                    <th>Del.</th>
 
                        <tr>
                        <td><%= request.getParameter("isbn") %></td>
                        <td><%= request.getParameter("desc") %></td>
                        <td><%= request.getParameter("price") %></td>
                        <td><input type = "checkbox" name = "del" value="selected"/></td>
                        </tr>
                         
            </table>                
            <br>
            <input type="submit" name="delete" value="Delete book(s)"/> <br>
            
        </form>
                
        <hr>

        <h3>Add a book</h3>
        
        <form action="Content.jsp" method="Get">
            <input type="text" name="isbn" placeholder="Isbn number" style="background-color:#FCF5D8"/> <br> <br>
            <input type="text" name="desc" placeholder="Short desc." style="background-color:#FCF5D8"/> <br> <br>
            <input type="text" name="price" placeholder="Price" style="background-color:#FCF5D8"/> <br> <br>
            <input type="submit" name="addbook" value="Add book"/> <br>
        </form>
        
        <%@ include file="Footer.jsp" %>
    </body>
</html>
