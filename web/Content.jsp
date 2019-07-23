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
            //Initialize result variable
            String ISBN,DESC,PRICE = "";
            
            //Get input values and assign to variables
            String isbn = request.getParameter("isbn");
            String desc = request.getParameter("desc");
            String price = request.getParameter("price");
            
            //If the user input is empty assign it in to a "-"
            if(isbn == null)
            {
                isbn = "-";
            }
            if(desc == null)
            {
                desc = "-";
            }
            if(price == null)
            {
                price = "-";
            }
            
            //Create cookie objects with dynamic key values which can identify
            Cookie isbncookie = new Cookie("ISBN"+isbn, isbn);
            Cookie desccookie = new Cookie("DESC"+desc, desc);
            Cookie pricecookie = new Cookie("PRICE"+price, price);
            
            //Add all cookies
            response.addCookie(isbncookie);             
            response.addCookie(desccookie);              
            response.addCookie(pricecookie);  
 
            //Read all the stored cookies from the browser
            Cookie[] cookies = request.getCookies();
            
            if (cookies != null) 
            {  
        %>
        
        <form action="Content.jsp" method="Get">
            
            <table bgcolor="#F2EFEF" border="white" >
                
                <tr>
                <th>Isbn_no</th>    
                <th>Short desc</th> 
                <th>Price</th>  
                <th>Del.</th>
                </tr>
                
                <%                      
                    
                %>         
                <tr>
                    <td> 
                    <% 
                    for(int i=0; i<cookies.length; i++) 
                    {
                        //Get cookies one by one using the loop
                        Cookie c1 = cookies[i];
                        if (c1.getName().startsWith("ISBN"))  
                        {                                                         
                            ISBN = c1.getValue(); 
                            out.println(ISBN);                                         
                        }
                    }
                    %>
                    </td>
                    <td> 
                    <% 
                    for(int i=0; i<cookies.length; i++) 
                    {
                        //Get cookies one by one using the loop
                        Cookie c2 = cookies[i];
                        if (c2.getName().startsWith("DESC"))  
                        {                                                         
                            DESC = c2.getValue(); 
                            out.println(DESC);                                         
                        }
                    }
                    %>
                    </td>
                    <td> 
                    <% 
                    for(int i=0; i<cookies.length; i++) 
                    {
                        //Get cookies one by one using the loop
                        Cookie c3 = cookies[i];
                        if (c3.getName().startsWith("PRICE"))  
                        {                                                         
                            PRICE = c3.getValue(); 
                            out.println(PRICE);                                         
                        }
                    }
                    %>
                    </td>
                    <td>
                        <input type="checkbox" name="delete">
                    </td>
                </tr>                                         
        <%  }  %>
        
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
