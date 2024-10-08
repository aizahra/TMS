<%-- 
    Document   : rsrvation
    Created on : 5 Apr, 2024, 8:50:00 PM
    Author     : Sejal
--%>

<%@page import="java.util.Random"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Entry Form</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            background-color:#D6EAE6;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        label {
            display: inline-block;
            width: 10%;
            text-align: left;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="email"],
        select {
            width: calc(100% - 160px); 
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="number"] {
            width: 50px;
        }
        .submit {
            background-color: #0DC1A8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit:hover {
            background-color: #45a049;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .required::after{
            content:"*";
            color:red;
            font-size:20px;
        }
    </style>
    
<h2> Reservation Form</h2>
    <form >
    <label class="required">ID</label>
        <select name="drpid" required>
            <option value="Passport">Passport</option>
            <option value="Aadhar Card">Aadhar Card</option>
            <option value="Driving License">Driving License</option>
            <option value="Pan Card">Pan Card</option>
        </select><br>
        <label class="required">ID Number</label>
        <input type="text" name="txtidnum" required><br>
        <label class="required">Contact Number</label>
        <input type="text" name="txtphn" required><br>
        <label class="required">Email</label>
        <input type="text" name="txtemail" required><br>
        <label class="required">Location</label>
        <select name="drplocation" required>
            <option value="Jaipur">Jaipur</option>
            <option value="Udaipur">Udaipur</option>
            <option value="Jaisalmer">Jaisalmer</option>
        </select><br>
        <label class="required">Nearest Airport (India)</label>
        <select name="drpairport" required>
            <option value="Delhi">Indira Gandhi International Airport, Delhi (DEL)</option>
            <option value="Mumbai">Chhatrapati Shivaji Maharaj International Airport, Mumbai (BOM)</option>
            <option value="Bangalore">Kempegowda International Airport, Bangalore (BLR)</option>
        </select><br>
        <label class="required">Month</label>
        <select name="drpmonth" required>
            <option value="January">January</option>
            <option value="February">February</option>
            <option value="March">March</option>
            <option value="April">April</option>
            <option value="May">May</option>
            <option value="June">June</option>
            <option value="July">July</option>
            <option value="August">August</option>
            <option value="September">September</option>
            <option value="October">October</option>
            <option value="November">November</option>
            <option value="December">December</option>
        </select><br>
        <label class="required">No. of Adults</label>
        <input type="text" name="txtadultsno"  required><br>
        <label class="required">No. of Kids</label>
        <input type="text" name="txtchildno"  required><br>
        <label class="required">Package</label>
        <select name="drppackage" required>
            <option value="Gold">Gold</option>
            <option value="Silver">Silver</option>
            <option value="Bronze">Bronze</option>
        </select><br>
        <label class="required">Date</label>
        <select name="drpdate" required>
            <option value="start from 01">Starting from 1st of selected month</option>
            <option value="start from 14">Starting from 14th of selected month</option>
            <option value="start from 23">Starting from 23rd of selected month</option>
        </select><br>
        <label class="required">Name of person making the booking</label>
        <input type="text" name="txtname" required><br>
        <input type="submit" name="btnSubmit" value="Submit"> 
    </form>
  
</head>
</body>
</html>
<% 
    String id = request.getParameter("drpid");
    String idnum = request.getParameter("txtidnum");
    String phn = request.getParameter("txtphn");
    String email = request.getParameter("txtemail");
    String location = request.getParameter("drplocation");
    String airport = request.getParameter("drpairport");
    String month = request.getParameter("drpmonth");
    String adultsno =request.getParameter("txtadultsno");
    String childno =request.getParameter("txtchildno");
    String pack =request.getParameter("drppackage");
    String date = request.getParameter("drpdate");
    String name = request.getParameter("txtname");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        if(request.getParameter("btnSubmit")!=null) {
            out.println("ABC="+phn);
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");

         String requestId = "REQ" + String.format("%07d", new Random().nextInt(10000000));
         
            String sql = "insert into reservation values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, idnum);
            stmt.setString(3, phn);
            stmt.setString(4, email);
            stmt.setString(5, location);
            stmt.setString(6, airport);
            stmt.setString(7, month);
            stmt.setInt(8, Integer.parseInt(adultsno));
            stmt.setInt(9, Integer.parseInt(childno));
            stmt.setString(10, pack);
            stmt.setString(11, date);
            stmt.setString(12, requestId);
            stmt.setString(13, name);


            int x=stmt.executeUpdate();

            if(x>0)
            {
                out.print("<script>alert('Record Inserted Successfully.')</script>");
                response.sendRedirect("reservationConfirmation.html");
            }
            else
                
                    out.print("<script>alert('Problem in  Inserting Record');</script>");
       }
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      out.println("Database connection error: " + e.getMessage());
    } finally {
    // Close JDBC objects
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

