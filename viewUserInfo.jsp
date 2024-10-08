<%-- 
    Document   : viewUserInfo
    Created on : 8 Mar, 2024, 2:54:13 PM
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
            background-image: url('teal.jpg');
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
         h3 {
            text-align: center;
            margin-top: 20px;
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
         .container {
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
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
<body>
    <div class="container">
   <h1>View User Information</h1><br>
     <h3>Enter the user's ID number entered while making account(PASSPORT , AADHAR CARD , DRIVING LICENSE ,PAN CARD )</h3>
    
    <form method="post" action="">
        Enter user's ID <input type="text" name="num">
        <input type="submit" value="View Information">
    </form>
         
    </div>    
     <% 
        String num = request.getParameter("num");
        if(num != null && !num.isEmpty()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms"); 
                PreparedStatement ps = con.prepareStatement("SELECT uname, id, num, gender, addr, email, phnum FROM prsnldetails WHERE num=?");
                ps.setString(1, num);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
    %>
    <br>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>ID</th>
            <th>Number</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Email</th>
            <th>Phone Number</th>
        </tr>
        <tr>
            <td><%= rs.getString("uname") %></td>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("num") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("addr") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phnum") %></td>
        </tr>
    </table>
    <% 
                } else {
                    out.println("No personal information found for ID: " + num);
                }
                con.close();
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>

<%
    ResultSet rs=null; 
    Connection conn=null;
    Statement stmt=null;
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from signn");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>USER DETAILS</title>
<body>
    <div>
        <form action="userInfo" method="post" enctype="multipart/form-data"> 

    <%
     Class.forName("org.apache.derby.jdbc.ClientDriver");
     conn=DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
     stmt=conn.createStatement();
     rs=stmt.executeQuery("select * from prsnldetails");
     while(rs.next())
     {
    %>
             

<table>
    <thead>
        <tr>
            <th>USERNAME</th>
            <th>ID</th>
            <th>ID NUMBER</th>
            <th>GENDER</th>
            <th>COUNTRY</th>
            <th>ADDRESS</th>
            <th>EMAIL</th>
            <th>CONTACT NO.</th>
            
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
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