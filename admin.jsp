<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!-- admin-login.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login Page</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-image: url('adminlog.jpg');
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }
    .container h2 {
        margin-bottom: 20px;
    }
    .container input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .container button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .container button:hover {
        background-color: #0056b3;
    }
</style>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form >
        <label for="username">Username</label><br>
        <input type="text"  name="txtadmin_uname" required><br>
        <label for="password">Password</label><br>
        <input type="password" id="pwd" name="txtadmin_pwd" required><br>
        <input type="submit" name="btnLogin" value="LOGIN">
    </form>
    <p>Forgot your password? <a href="forgotpwd.jsp">Forgot Password</a></p>
</div>
</body>
</html>
<%
    String username = request.getParameter("txtadmin_uname");
    String password = request.getParameter("txtadmin_pwd");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
  if(request.getParameter("btnLogin")!=null){      
   
    out.print("DONE");
// Establish JDBC connection
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");

        // Prepare SQL statement to check user credentials
        String sql = "select * from admin_log_tbl WHERE admin_uname=? AND admin_pwd=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // Valid credentials, set session attribute and redirect to dashboard
          //  HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password); 
            response.sendRedirect("adminDash2.jsp");
        } else {
            // Invalid credentials, display error message
            out.println("<script>alert('Invalid username or password'); window.location='admin.jsp'</script>");
        }
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



