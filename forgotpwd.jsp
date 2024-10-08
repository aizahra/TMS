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
    <title>Forgot Password</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('forgotpwd.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .button-container {
        text-align: center;
        margin: 20px;
    }
    .ResetPassword-button {
        background-color: green;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
        .forgot-password-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<!--<body>
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <form action="#" method="post">
          <input type="email" name="email" placeholder="Enter your email" required><br>
            <label for="email">Enter Email</label>
            <input type="email" name="txtemail" required><br>
           
            <tr>
                <td>Security Question</td>
                <td><select name="drpSec">
                        <option>What was your first car's name?</option>
                        <option>What was your first school's name?</option>
                        <option>What was your first pet's name?</option>
                        </select></td>
            </tr>
            
        
            <label for="security_answer">Answer:</label>
            <input type="text"  name="security_answer" required><br>
       
            <label for="password">Enter new Password</label>
             <input type="text"  name="txtpwd" required><br>
             
            <input type="submit" name="btnResetPassword" value="Reset Password">
        </form>
    </div>
</body>
</html>-->
<body>
<div class="container">
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <form >
          
             <label for="email">Email:</label><br>
            <input type="text" id="email" name="txtemail" required><br>
            
            <tr>
                <td>Security Question</td>
                <td><select name="drpSec">
                        <option>What was your first cars name?</option>
                        <option>What was your first schools name?</option>
                        <option>What was your first pets name?</option>
                        </select></td>
            </tr>
            
           <label for="security-answer">Security Answer</label>
           <input type="text"  name="txtSecAns" required><br>
            
           <label for="pwd">Reset Password</label>
           <input type="text"  name="txtpwd" required><br>
           
           <input type="submit" name="btnResetPassword" value="RESET PASSWORD">
           
        </form>
    </div>
    <div class="image-container">
       
    </div>
</div>
</body>
</html>
 <% 
    String pwd=request.getParameter("txtpwd");
    String email = request.getParameter("txtemail");
    String securityquestion = request.getParameter("drpSec");
    String secAns = request.getParameter("txtSecAns");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        if(request.getParameter("btnResetPassword")!=null) {
            out.print("DONE");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");

        // Prepare SQL statement to check user credentials
            String sql="UPDATE signup SET pwd =? WHERE email=? AND sec=? AND secAns=? ";
            stmt = conn.prepareStatement(sql);
 
            stmt.setString(1, pwd);
            stmt.setString(2, email);
            stmt.setString(3, securityquestion);
            stmt.setString(4, secAns);

            int x=stmt.executeUpdate();

            if(x>0)
            {
                out.print("<script>alert('Password Changed Successfully.')</script>");
                response.sendRedirect("logg.jsp");
            }
            else
                
                    out.print("<script>alert('Problem in changing password')</script>");
        }
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      out.println("-Database connection error: " + e.getMessage());
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


