<%-- 
    Document   : Content
    Created on : Jul 12, 2019, 2:54:30 PM
    Author     : Tharusha Jayadeera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Inventory Control</title>
    </head>
    <body>
        <%@ include file="Header.jsp" %>

        <h3>Library book list</h3>
        
        <%
            String isbn = request.getParameter("isbn");
            String desc = request.getParameter("desc");
            String price = request.getParameter("price");
            
            String inputvalue = desc + "-" + price + "=";
            
            if (isbn != null && isbn.length() > 0) 
            {
                Cookie Cookies = new Cookie(isbn, inputvalue);

                response.addCookie(Cookies);

                // redirects control to same page for new request
                response.sendRedirect("Content.jsp");
            }
        %>
        
    <form action="Content.jsp" method="get">
        <table>
            <tr bgcolor="#AED6F1">
             <th>Isbn_no</th>
             <th>Short desc</th>
             <th>Price</th>
             <th>Del.</th>
            </tr>
            <%
                Cookie[] cookies = request.getCookies();

                for (int i = 0; i < cookies.length; i++) 
                {
                    Cookie cookie = cookies[i];
                    
                    String ISBN = cookie.getName();
                    
                    String Value = cookie.getValue();
                    
                    String[] descarr = Value.split("-");                    
                    String DESC = descarr[0]; 
                    
                    String[] pricearr = Value.replaceAll(DESC+"-", "").split("=");                    
                    String PRICE = pricearr[0];                    
                                   
            %>
            
                    <tr bgcolor="#D6EAF8">
                     <td><%=ISBN%></td>
                     <td><%=DESC%></td>
                     <td><%=PRICE%></td>
                     <td><input type="checkbox" name="checkbox" </td>
                    </tr>
            <%
                }
            %>
        </table> <br> 
       <input type="submit" name="delete" value="Delete Book(s)"/> <br><br>
    </form>
       
        <hr>

        <h3>Add a book</h3>
        
        <form action="Content.jsp" method="Get">
            <input type="text" name="isbn" placeholder="Isbn number" style="background-color:#FCF5D8"/> <br> <br>
            <input type="text" name="desc" placeholder="Short desc." style="background-color:#FCF5D8"/> <br> <br>
            <input type="text" name="price" placeholder="Price" style="background-color:#FCF5D8"/> <br> <br>
            <input type="submit" name="addbook" value="Add book"/> <br> <br>
        </form>

        <%@ include file="Footer.jsp" %>
    </body>
</html>
