<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Personal Details</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-image: url('seagreen.jpeg'); 
        background-size: cover; 
        background-position: center; 
        background-repeat: no-repeat; 
    }
    .container {
        display: flex;
        justify-content: center; /* Center the container horizontally */
        align-items: center; /* Center the container vertically */
        height: 100vh; /* Make the container full height of the viewport */
    }
    .form-container {
        width: 50%;
        padding: 20px;
        background-color: #f9f9f9; /* Light background color */
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
    }
    form {
        margin: 0;
    }
    input[type="text"],
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    input[type="radio"] {
        margin-right: 5px;
    }
    .button-container {
        text-align: center;
        margin: 20px 0; /* Adjust margin for spacing */
    }
    .add-button,
    .back-button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease; /* Smooth transition */
    }
    .add-button {
        background-color: green;
        color: white;
    }
    .back-button {
        background-color: red;
        color: white;
    }
    .add-button:hover,
    .back-button:hover {
        background-color: darkgreen; /* Darken color on hover */
    }
</style>
</head>
<body>
   

<div class="container">
    <div class="form-container">
        <h1 style="text-align: center;">Update Personal Details</h1>
        <h4 style="text-align: center;">ENTER CORRECT ID NUMBER TO UPDATE</h4>
        <form >
            <label for="username">Username</label><br>
            <input type="text" id="username" name="txtuname" required><br>
            
            <label for="id">ID:</label><br>
            <select id="id" name="drpId" required>
                <option value="passport">Passport</option>
                <option value="pan_card">Pan Card</option>
                <option value="aadhar_card">Aadhar Card</option>
                <option value="driving_license">Driving Licence</option>
            </select><br>
            
            <label for="number">ID Number</label><br>
            <input type="text" id="number" name="txtnum" required><br>
            
            <label for="gender">Gender</label><br>
            <select name="drpgender" required>
                <option>Male</option>
                <option>Female</option>
            </select><br>
            
            <label for="country">Country</label><br>
            <select id="country" name="txtcountry" required>
                <option value="india">India</option>
            </select><br>
            
            <label for="address">Address</label><br>
            <input type="text" id="address" name="txtaddr" required><br>
            
            <label for="email">E-mail</label><br>
            <input type="text" id="email" name="txtemail" required><br>
            
            <label for="phnumber">Phone Number</label><br>
            <input type="text" id="phnumber" name="txtphnum" required><br>
           
            <div class="button-container">
                <input type="submit" name="btnUPDATE" class="add-button" value="UPDATE">
                <button class="back-button" onclick="window.location.href='loggedindash.jsp'">BACK</button>
            </div>
            
        </form>
    </div>
</div>
</body>
</html>

<%
    String id = request.getParameter("drpId");
    String number =request.getParameter("txtnum"); 
    String gender = request.getParameter("drpgender");
    String country = request.getParameter("txtcountry");
    String address = request.getParameter("txtaddr");
    String email = request.getParameter("txtemail"); 
    String phnumber =request.getParameter("txtphnum"); 
    String username = request.getParameter("txtuname");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        
        if(request.getParameter("btnUPDATE")!=null) {
            out.print(phnumber);
            out.print(username);
            out.print(id);
            out.print(number);
            out.print(gender);
            out.print(country);
            out.print(address);
            out.print(email);
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        // Prepare SQL statement to check user credentials
            String sql = "UPDATE prsnldetails SET uname=?,id =?,gender=?,country=?,addr=?,email=?,phnum=? WHERE num =?";
            stmt = conn.prepareStatement(sql);
           
            stmt.setString(1, username);
            stmt.setString(2, id);
            stmt.setString(3, gender);
            stmt.setString(4, country);
            stmt.setString(5, address);
            stmt.setString(6, email);
            stmt.setString(7, phnumber);
            stmt.setString(8, number);

            int x=stmt.executeUpdate();

            if(x>0)
            {
                out.print("<script>alert('Record Updated Successfully.')</script>");
                response.sendRedirect("loggedindash.jsp");
            }
            else
                    out.print("<script>alert('No such username exists or not updated successfully')</script>");
        }
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      out.println("Database connection error: " + e.getMessage());
    } 
finally {
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