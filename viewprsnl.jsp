<%-- 
    Document   : viewprsnl
    Created on : 9 Mar, 2024, 1:39:31 PM
    Author     : Sejal
--%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Personal Information</title>
    <style>    
        body {
            font-family: Arial, sans-serif;
            background-image: url('seagreen.jpeg');
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
        .container {
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    text-align: center;
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
<body>
    <div class="container">
   <h1>View Personal Information</h1><br>
     <h3>Enter the number of ID type you chose while creating account(Passport,Aadhar Card,Driving License,Pan Card)</h3>
    
    <form method="post" action="">
        Enter ID Number: <input type="text" name="num">
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
                ps.setInt(1, Integer.parseInt(num));
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
</html>
