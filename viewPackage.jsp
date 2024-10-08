<%-- 
    Document   : viewPackage
    Created on : 8 Mar, 2024, 3:53:44 PM
    Author     : Sejal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Package</title>
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
            flex-direction: column; 
            align-items: center;
        }
        .place-section {
            width: 80%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-sizing: border-box;
            text-align: center;
            height: auto; /* Adjust height as needed */
        }
        img {
            max-width: 100%;
            height: 250px; /* Adjust image height */
            border-radius: 5px;
        }
        .text {
            text-align: center;
            font-weight: bold;
            margin-left: 10px;
            margin-right: 10px;
            text-shadow: 2px 2px 5px #000;
        }
        .tour-button {
            background-color: #0DC1A8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .tour-button:hover {
            background-color: #45a049;
        }
        .button {
            background-color: #007bff;
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
    <button class="button" onclick="window.location.href='loggedindash.jsp'">Back</button>
</head>
<body>
    <header>
        <h1>Packages</h1>
    </header>
    
    <div class="places-container">
    <% 
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
            
            String budgetParam = request.getParameter("pbudget");
            String query1;
            
            if (budgetParam != null && !budgetParam.isEmpty()) {
                String budget = request.getParameter(budgetParam);
                query1 = "SELECT * FROM package WHERE pbudget <= ? ";
                pstmt = conn.prepareStatement(query1);
                pstmt.setString(1, budget);
            } else {
                query1 = "SELECT * FROM package";
                pstmt = conn.prepareStatement(query1);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
        <div class="place-section">
            <p><strong>Name:</strong> <%= rs.getString(2) %></p>
            <img src="<%= rs.getString(3) %>" alt="Hotel Photo"> 
            <p><strong>Description:</strong> <%= rs.getString(5) %></p>
            <p><strong>Budget:</strong> <%= rs.getString(6) %></p>
            <a href="reservation.jsp"><button class="tour-button">Reserve</button></a>
            
            <!-- Display "View Reviews" and "Add Reviews" buttons side by side -->
            <div style="display: flex; justify-content: center; margin-top: 10px;">
                <a href="viewreview.jsp"><button class="tour-button">View Reviews</button></a>
                <a href="review.jsp"><button class="tour-button" style="margin-left: 10px;">Add Review</button></a>
            </div>
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
    </div>
    
    
</body>
</html>

    
    
   