<%-- 
    Document   : viewDestination2
    Created on : 3 Apr, 2024, 11:23:16 PM
    Author     : Sejal
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Destination</title>
     <style>
        body {
            font-family: Arial, sans-serif;
        }
        header {
            background-color: black;
            color: white;
            text-align: center;
            padding: 1em;
        }
        .search-container {
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .search-container input[type=text] {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .search-container input[type=submit] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-container input[type=submit]:hover {
            background-color: #0056b3;
        }
        .places-container {
            display: flex; 
            flex-wrap: wrap;
            justify-content: center; 
        }
        .place-section {
            width: 50%; 
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            margin-right: 20px;
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            position: relative;
            text-align: center; /* Center align the content */
        }
        .place-section:last-child {
            margin-right: 0;
        }
        img {
            max-width: 100%;
            height: auto;
            display: block; /* Make the image a block element to center it */
            margin: 0 auto; /* Center align the image */
        }
        .text {
            text-align: left;
            margin-left: 10px;
        }
        .tour-button {
            position: absolute;
            bottom: 0px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #0DC1A8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .tour-button:hover {
            background-color: #45a049;
        }
        .button {
            background-color: blue; 
            color: white; 
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .button:hover {
            background-color: #0056b3; 
        }
    </style>
    <button class="button"onclick="window.location.href='Dashboard.jsp'">Back</button>
</head>
<body>
<header>
    <h1>RAJASTHAN ROYAL ROUTES</h1>
    <h2>Welcome to our Rajasthan Destinations Page! Explore the beauty and grandeur of Rajasthan.</h2>
</header>
<section>    
    <div class="container">
        <form action="viewPackage2.jsp" method="post" enctype="multipart/form-data"> 
    <%
        ResultSet rs=null; 
        Connection conn=null;
        Statement stmt=null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from destination");
            while(rs.next()) {
    %>
        <div class="places-container">
            <div class="place-section">
                <img src="<%= rs.getString(1) %>" width="300" height="250" alt="Hotel Photo"> 
                <p><strong>Location:</strong><%= rs.getString(3) %></p>
                <p><strong>About:</strong> <%= rs.getString(4) %></p>
                <a href="viewPackage2.jsp"><button class="tour-button">Available Tours</button></a>
            </div>
        </div>
    <%
            }  
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
        </form>
    </div>
</section>
</body>
</html>