<%-- 
    Document   : signn
    Created on : 3 Apr, 2024, 2:11:15 AM
    Author     : Sejal
--%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup Page</title>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-image: url('bgimg.jpg');
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .signup-panel {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    max-width: 400px;
    width: 100%;
  }

  .signup-panel h2 {
    text-align: center;
    margin-bottom: 20px;
  }

  .signup-form input[type="text"],
  .signup-form input[type="password"],
  .signup-form input[type="email"],
  .signup-form select {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }

  .signup-form input[type="submit"] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 10px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .signup-form input[type="submit"]:hover {
    background-color: #45a049;
  }

  .signup-form label {
    font-weight: bold;
  }
</style>
</head>
<body>
<div class="signup-panel">
  <h2>Signup</h2>
  <form class="signup-form" action="" method="post">
    <label for="username">Username</label>
    <input type="text" id="username" name="txtusername" required><br>

    <label for="password">Password</label>
    <input type="password" id="password" name="txtpassword" required><br>

    <label for="contact">Contact No</label>
    <input type="text" id="contact" name="txtphone"><br>

    <label for="email">Email</label>
    <input type="email" id="email" name="txtemail" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"><br>

    <label for="address">Address</label>
    <input type="text" id="address" name="txtaddress"><br>

    <label for="security-question">Security Question</label>
    <select id="security-question" name="drpsecQ" required>
      <option value="">Select a security question</option>
      <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
      <option value="What is your favorite pet's name?">What is your favorite pet's name?</option>
      <option value="What city were you born in?">What city were you born in?</option>
    </select><br>

    <label for="security-answer">Security Answer</label>
    <input type="text" id="security-answer" name="txtsecA" required><br>

    <input type="submit" name="btnSignup" value="Signup">
  </form>
</div>

<% 
    String username = request.getParameter("txtusername");
    String password = request.getParameter("txtpassword");
    String phone = request.getParameter("txtphone");
    String email = request.getParameter("txtemail");
    String address = request.getParameter("txtaddress");
    String secQ = request.getParameter("drpsecQ");
    String secA = request.getParameter("txtsecA");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        if (request.getParameter("btnSignup") != null) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");

            // Check if email already exists
            stmt = conn.prepareStatement("SELECT * FROM signn WHERE email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Email already exists
                out.print("<script>alert('Email has already been used');</script>");
            } else {
                // Email is unique, proceed with insertion
                String sql = "INSERT INTO signn VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, phone);
                stmt.setString(4, email);
                stmt.setString(5, address);
                stmt.setString(6, secQ);
                stmt.setString(7, secA);

                int x = stmt.executeUpdate();

                if (x > 0) {
                    // Display success message with a delay before redirecting
                    out.print("<script>alert('Data Inserted Successfully.');</script>");
                    out.print("<script>window.setTimeout(function(){ window.location.href = 'logg.jsp'; }, 1000);</script>");
                } else {
                    // Display error message
                    out.print("<script>alert('Problem in Inserting Data');</script>");
                }
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('Database connection error: " + e.getMessage() + "');</script>");
    } finally {
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

</body>
</html>
