<%-- 
    Document   : viewhotel
    Created on : 7 Mar, 2024, 12:12:57 PM
    Author     : Sejal
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
<button class="button"onclick="window.location.href='adminDash2.jsp'">Back</button>
<%
    ResultSet rs=null; 
    Connection conn=null;
    Statement stmt=null;
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from hotelimg");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Hotels</title>
</head>
<body>
    <section>    
<!--        <div id="searchBar">
            <label for="locationSearch" style="font-size: 20px;">Search by Location:</label>
            <input type="text" id="locationSearch" oninput="filterHotels()" placeholder="Enter location...">
        </div>-->

    <div class="container">
        <form action="fileupload" method="post" enctype="multipart/form-data"> 
            <label>Enter Hotel Id:</label><br>
            <input type="text" name="txt_hid" value=""><br><br>  	
            <label>Enter Hotel Name:</label><br>                   
            <input type="text" name="txt_hname" value="" size='50'><br><br>
            <label>Upload Hotel Photo:</label><br>
            Select File:<input type="file" name="img"  size='50'><br><br>
            <label>Enter Hotel Location:</label><br>                   
            <input type="text" name="txt_hlocation" value="" size='50'><br><br>
            <label>Enter Hotel Rating:</label><br>                   
            <input type="text" name="txt_hdesc" value="" size='50'><br><br>
            <label>Enter Hotel Website:</label><br>                   
            <input type="text" name="txt_hlink" value="" size='50'><br><br>
            <label>Enter Hotel Budget:</label><br>                   
            <input type="text" name="txt_hbudget" value="" size='50'><br><br>
            <input type="submit" name="btn_add" value="ADD">
             <form action="ImageDelete" method="get">
            <br> <input type="submit" name="btn_delete" value="DELETE" >
    <%
     Class.forName("org.apache.derby.jdbc.ClientDriver");
     conn=DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
     stmt=conn.createStatement();
     rs=stmt.executeQuery("select * from hotelimg");
     
     while(rs.next())
     {
    %>
     
     <table>
    <thead>
        <tr>
            <th>Hotel ID</th>
            <th>Hotel Name</th>
            <th>Hotel Image</th>
            <th>Hotel Location</th>
            <th>Hotel Rating</th>
            <th>Hotel Website</th>
            <th>Hotel Budget</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><image src="<%=rs.getString(3)%>"  width="350" height="250"></image></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><a href="<%=rs.getString(7)%>"><%= rs.getString(7) %></a></td>
            <td><%=rs.getString(8)%></td>
            
        </tr>
        <!-- Add more rows as needed -->
    </tbody>
</table>
<!--            <form action="Back" method="get">-->
<!--            <br> <input type="submit" name="btn_back" value="Back" >-->
            
            </section>
            
     <%
       }  
     %>
            </table>
            
        </form>
    </div>
    
</body>
</html>

