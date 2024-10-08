<%-- 
    Document   : viewhotel3
    Created on : 6 Apr, 2024, 12:37:49 PM
    Author     : Sejal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Hotel</title>
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
            justify-content: flex-start;
        }
        .place-section {
            width: 30%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            margin-right: 30px;
            box-sizing: border-box;
        }
        .place-section:last-child {
            margin-right: 0;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        .text {
            text-align: left;
            margin-left: 10px;
        }
    </style>
    <button class="button"onclick="window.location.href='adminDash2.jsp'">Back</button>
</head>
<body>
    <header>
        <h1>Hotels</h1>
    </header>
    
    
    <div class="places-container">
    <% 
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
            
            String budgetParam = request.getParameter("hbudget");
            String query1;
            
            if (budgetParam != null && !budgetParam.isEmpty()) {
                int budget = Integer.parseInt(budgetParam);
                query1 = "SELECT * FROM hotelimg WHERE hbudget <= ? ";
                pstmt = conn.prepareStatement(query1);
                pstmt.setInt(1, budget);
                
            } else {
                query1 = "SELECT * FROM hotelimg";
                pstmt = conn.prepareStatement(query1);
            }
            rs = pstmt.executeQuery();
            

            while (rs.next()) {
    %>
        <div class="place-section">
            <img src="<%= rs.getString(3) %>" width="300" height="250" alt="Hotel Photo">
            <p><strong>Location:</strong> <%= rs.getString(5) %></p>
            <p><strong>Rating:</strong><%= rs.getString(6) %></p>
            
            <p><strong>Website:</strong><a href="<%= rs.getString(7) %>"><%= rs.getString(7)%></a></p>
            <p><strong>Budget:</strong> <%= rs.getString(8) %></p>
        </div>
    <% 
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    %>
    </div> <!-- end places-container -->
</body>
</html>