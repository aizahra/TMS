<%-- 
    Document   : review
    Created on : 2 Apr, 2024, 1:34:31 PM
    Author     : Sejal
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Destinations</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('bgimgadmin.jpg');
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
            width: 550px;
            height:400px;
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
        .required::after{
            content:"*";
            color:red;
            font-size:20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Tour Package Review</h2>
        <form>
            <label for="username">USERNAME</label>
            <input type="text" id="uname" name="txtUNAME"><br><br>
            <label for="DESTINATIONS">Destinations</label>
            <select id="DESTINATIONS" name="drpDESTINATION" required><br><br>
                <option value="">Destinations</option>
                <option value="Jaipur">Jaipur</option>
                <option value="Udaipur">Udaipur</option>
                <option value="Jaisalmer">Jaisalmer</option>
            </select><br><br>
            <label for="PACKAGE">Packages</label>
            <select id="PACKAGE" name="drpPACKAGE" required><br><br>
                <option value="">Packages</option>
                <option value="Gold">Gold</option>
                <option value="Silver">Silver</option>
                <option value="Bronze">Bronze</option>
            </select><br><br>
            <label for="feedback">Feedback and Reviews</label>
            <input type="text" id="feedback" name="txtREVIEW"><br><br>
            <input type="submit" name="btn_add" value="ADD">
            

       
            </table>
        </form>
    </div>
    
</body>
<% 
    String UNAME = request.getParameter("txtUNAME");
    String DESTINATION = request.getParameter("drpDESTINATION");
    String PACKAGE = request.getParameter("drpPACKAGE");
    String REVIEW = request.getParameter("txtREVIEW");
   
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        if(request.getParameter("btn_add")!=null) {
            out.print("DONE");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
            String REVID = "REV" + String.format("%07d", new Random().nextInt(10000000));

        // Prepare SQL statement to check user credentials
            String sql = "insert into REVIEWS values(?,?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, UNAME);
            stmt.setString(2, DESTINATION);
            stmt.setString(3, PACKAGE);
            stmt.setString(4, REVIEW);          
            stmt.setString(5, REVID);
            

            int x=stmt.executeUpdate();
            
            if(x>0)
            {
                out.print("<script>alert('SUCCESSFULLY ADDED')</script>");
                response.sendRedirect("viewPackage2.jsp");
            }
            else
                
                    out.print("<script>alert('FAILED')</script>");
        }
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      out.println("Database connection error: " + e.getMessage());
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
</html>
