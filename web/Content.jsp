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
            //Initialize all input values into variables
            String isbn = request.getParameter("isbn");
            String desc = request.getParameter("desc");
            String price = request.getParameter("price");
            
            String checkbox = request.getParameter("checkbox");
            out.print(checkbox);
            
            /*Concatanate description and price inputs with a - to store 
            both values the cookie's value*/ 
            String inputvalue = desc + "-" + price;
            
            /*Check wheather the isbn value is not null to ensure the 
            cookie's name is not null*/
            if (isbn != null && isbn.length() > 0) 
            {    
                //Set isbn value as cookie's name
                Cookie Cookies = new Cookie("isbn"+isbn, inputvalue);
                
                //Store cookie
                response.addCookie(Cookies);

                //redirects control to same page for new request
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
                //Get all stored cookies 
                Cookie[] cookies = request.getCookies();
                
                //Process only if there are cookies available
                if (cookies!=null)
                {                
                    for (int i = 0; i < cookies.length; i++) 
                    {
                        Cookie cookie = cookies[i];
                        
                        /* Check wheather if the cookie startswith isbn
                        to filter only required cookies to process */
                        if(cookie.getName().startsWith("isbn"))
                        {       
    //                        if(checkbox=="on")
    //                        {
    //                            cookie.setMaxAge(0);
    //                            response.addCookie(cookie);
    //                            continue;
    //                        }
                            
                            /*Remove front isbn text from the cookie name to print
                            the real input isbn number*/
                            String ISBN = cookie.getName().replaceAll("isbn", "");
                            String Value = cookie.getValue();
                            
                            /*Split the value of the cookie to extract 
                            description and price*/
                            String[] descarr = Value.split("-");                    
                            String DESC = descarr[0]; 
                            
                            /*Ignore extracted description text from the cookie's
                            value to filter the price*/ 
                            String PRICE = Value.replaceAll(DESC+"-", "");                    
                                   
            %>                            
                            <tr bgcolor="#D6EAF8">
                             <td><%=ISBN%></td>
                             <td><%=DESC%></td>
                             <td><%=PRICE%></td>
                             <td><input type="checkbox" name="checkbox" </td>
                            </tr>
            <%              
                        }
                    }
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
