<%-- 
    Document   : viewreview
    Created on : 6 Apr, 2024, 2:08:02 AM
    Author     : Sejal
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Info</title>
<style>
     
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #CCF3F5;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
    
</style>
</head>

<%
    ResultSet rs=null; 
    Connection conn=null;
    Statement stmt=null;
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from REVIEWS");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Reviews</title>
<body>
    <div class="container">
        <form action="review" method="post" enctype="multipart/form-data"> 

    <%
     Class.forName("org.apache.derby.jdbc.ClientDriver");
     conn=DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
     stmt=conn.createStatement();
     rs=stmt.executeQuery("select * from REVIEWS");
     while(rs.next())
     {
    %>
             

<table>
    <thead>
        <tr>
            <th>USERNAME</th>
            <th>DESTINATION</th>
            <th>PACKAGE</th>
            <th>REVIEW</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
        </tr>
       
    </tbody>
</table>
     <%
       }  
     %>
        

       
            </table>
        </form>
    </div>
    
</body>
</html>