<%-- 
    Document   : reservationreq
    Created on : 5 Apr, 2024, 8:55:19 PM
    Author     : Sejal
--%>

<%@page import="java.util.Random"%>
<%@page import="common.DB_connect"%>
<%@page import="java.util.UUID"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
<head>
    <title>Approve Request</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            background-color: white;
        }

        table {
            margin-top: 20px;
            margin-right: 20px; 
        }

        .table-content {
            width: 100%;
            font-size: 15px;
            height: auto;
            margin-left: 10px;
        }

        .table-content tr {
            height: 25px;
            font-size: 15px;
            background-color: white;
            color: black;
        }

        .table-content thead tr {
            background-color: #219ebc;
            color: white;
            height: 30px;
            font-size: 20px;
            opacity: 0.7;
        }

        .btn {
            background-color: #219ebc;
            width: 100%;
            height: 100%;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 2px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        h2 {
            color: #219ebc;
        }
    </style>
</head>
<body>
    <h2>Approve/Disapprove the requests</h2>
    <form method="post" action="reservationRequest.jsp">
        <table border="1" width="100%" cellspacing="0" class="table-content">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ID NUMBER</th>
                    <th>Contact No.</th>
                    <th>Email</th>
                    <th>Location</th>
                    <th>Nearest Airport</th>
                    <th>Month</th>
                    <th>No. of Adults</th>
                    <th>No. of Children</th>
                    <th>Package</th>
                    <th>Date</th>
                    <th>name</th>
                    <th>Action</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%-- Java code to fetch and display requests --%>
                <%
                    Connection conn = null;
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");
                       
                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM reservation");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("idnum") %></td>
                    <td><%= rs.getString("phn") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("location") %></td>
                    <td><%= rs.getString("airport") %></td>
                    <td><%= rs.getString("month") %></td>
                    <td><%= rs.getInt("adultsno") %></td>
                    <td><%= rs.getInt("childno") %></td>
                    <td><%= rs.getString("package") %></td>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("name") %></td>
                     <td> <button class="btn"><a href="insert.jsp?idnum=<%=rs.getString(2)%>">Approve</a></button></td>
                <td><button class="btn"><a href="delete.jsp?idnum=<%=rs.getString(2)%>">Remove from Request</a></button></td>
                </tr>
                <%
                        }
                        rs.close();
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </form>
</body>
</html>
