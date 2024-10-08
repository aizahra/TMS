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
<title>Delete Personal Details</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }
    .container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }
    .form-container {
        width: 50%;
        padding: 20px;
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
        margin: 20px;
    }
    .add-button {
        background-color: green;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .back-button {
        background-color: red;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .image-container {
        width: 50%;
        text-align: center;
    }
    img {
        max-width: 100%;
        height: auto;
    }
</style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2>Delete Personal Details</h2>
        <form >
      <!--  <form action="save_details.php" method="POST"> --> <!-- Replace 'save_details.php' with your PHP script for saving details -->
            <label for="username">Username</label><br>
            <input type="text" id="username" name="txtuname" required><br>
          <!--  <label for="id">ID:</label><br>
            <select id="id" name="id" required>
                <option value="passport">Passport</option>
                <option value="pan_card">Pan Card</option>
                <option value="aadhar_card">Aadhar Card</option>
                <option value="driving_license">Driving Licence</option>
            </select><br> -->
           
            <tr>
                <td>ID:</td>
                <td><select name="drpId">
                        <option>Passport</option>
                        <option>Pan Card</option>
                        <option>Aadhar Card</option>
                        <option>Driving License</option>
                        </select></td>
            </tr>
            <label for="number">Number</label><br>
            <input type="text" id="number" name="txtnum" required><br>
            

            <tr>
                <td>Gender</td>
                <td><select name="drpgender">
                        <option>Male</option>
                        <option>Female</option>
                        </select></td>
            </tr>
            
            <label for="country">Country</label><br>
            <select id="country" name="txtcountry" required>
                <option value="india">India</option>
            </select><br>
            
            <label for="address">Address</label><br>
            <input type="text" id="address" name="txtaddr" required><br>
            
            <label for="email">Email</label><br>
            <input type="text" id="email" name="txtemail" required><br>
            
            <label for="phnumber">Phone Number</label><br>
            <input type="text" id="phnumber" name="txtphnum" required><br>
           
          
           <input type="submit" name="btnDELETE" value="DELETE">
           
            <button class="back-button" onclick="window.location.href='loggedindash.jsp'">BACK</button>
        </form>
    </div>
    <div class="image-container">
        <img src="traveller.jpg" alt="Image"> 
    </div>
</div>
</body>
</html>
<%
    String username = request.getParameter("txtuname");
    String id = request.getParameter("drpId");
    String number =request.getParameter("txtnum"); 
    String gender = request.getParameter("drpgender");
    String country = request.getParameter("txtcountry");
    String address = request.getParameter("txtaddr");
    String email = request.getParameter("txtemail"); 
    String phnumber =request.getParameter("txtphnum"); 
    

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        
        if(request.getParameter("btnDELETE")!=null) {
            out.print("DONE");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        // Prepare SQL statement to check user credentials
            String sql = "DELETE FROM prsnldetails WHERE num=? AND email=? ";
            stmt = conn.prepareStatement(sql);
           
            stmt.setString(1, number);
            stmt.setString(2, email);
            
            

            int x=stmt.executeUpdate();

            if(x>0)
            {
                out.print("<script>alert('Record DELETED Successfully.')</script>");
                
                response.sendRedirect("deletedetails.html");
            }
            else
                    out.print("<script>alert('No such username exists or not deleted successfully')</script>");
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
