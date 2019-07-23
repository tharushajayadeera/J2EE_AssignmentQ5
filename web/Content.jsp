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
         // Checks for the value of isbn that it is null or not
          String isbn = request.getParameter("isbn");
          String desc = request.getParameter("desc");
          String price = request.getParameter("price");
          
          String checkbox = request.getParameter("checkbox");
          out.print(checkbox);
          
          if (isbn != null && isbn.length() > 0 && desc != null && desc.length() > 0 && price != null && price.length() > 0) 
          {
            
            Cookie ISBNCookies = new Cookie(("ISBN"+isbn).replaceAll(" ", ""), isbn);
            Cookie DESCCookies = new Cookie(("DESC"+desc).replaceAll(" ", ""), desc);
            Cookie PRICECookies = new Cookie(("PRICE"+price).replaceAll(" ", ""), price);

            
           // add cookies to response object of jsp 
            response.addCookie(ISBNCookies);
            response.addCookie(DESCCookies);
            response.addCookie(PRICECookies);
            
            
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
            // getCookies() method returns array of Cookie 
            // we iterate over it and extract ISBN, DESC and PRICE
            // into seperate variables 
            Cookie[] cookies = request.getCookies();
            
            String ISBN = "";
            String DESC = "";
            String PRICE = "";
         
        if(cookies != null)
        {    
            
            for (int i = 0; i < cookies.length; i++) 
            {
                Cookie cookie = cookies[i];
          
                //Fill all the columns of a single row by iterating
                //the for loop 3 times
                if(cookie.getName().startsWith("ISBN") && ISBN == "")
                {
                    ISBN = cookie.getValue();
                    DESC = "";
                    PRICE = "";
                    continue;
                }
                
                if(cookie.getName().startsWith("DESC") && DESC == "")
                {
                    DESC = cookie.getValue();                    
                    PRICE = "";
                    continue;
                }
                
                if(cookie.getName().startsWith("PRICE") && PRICE == "")
                {
                    PRICE = cookie.getValue();
                    continue;
                }
            
                //Display one filled row
                %>

                <% 
                    if(ISBN != "" || DESC != "" || PRICE != "")
                    {                  
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
        <%
                //Reset varaiables to create the next row
                ISBN = "";
                DESC = "";
                PRICE = "";   
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
