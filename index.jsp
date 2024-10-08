<%@page import="java.lang.String"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            <table width="400px" align="center" border=2>
                <tr>
                    <td align="center" colspan="2">Form Details</td>
                </tr>
                <tr>
                    <td>Id </td>
                    <td><input type="number" name="id" /></td>
                </tr>
                <tr>
                    <td>First Name </td>
                    <td>
                        <input type="text" name="firstname">
                    </td>
                </tr>
                <tr>
                    <td>Last Name </td>
                    <td>
                        <input type="text" name="lastname">
                    </td>
                </tr>
                <tr>
                    <td>Image Link: </td>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>

        </form><br>
    <center><a href="viewhotels.jsp">View Hotels </a></center>
    
</body>
</html>
<%
    String id = request.getParameter("txtId");
    String firstname = request.getParameter("txtfname"); 
    String lastname =request.getParameter("txtlname"); 
    String imglink = request.getParameter("txtlink");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        
        if(request.getParameter("btnUPDATE")!=null) {
            out.print("DONE");

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        // Prepare SQL statement to check user credentials
            String sql = "SELECT filename FROM images where id =300 ";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
                while (rs.next()) {
                    String filename = rs.getString("filename");
            stmt = conn.prepareStatement(sql);
           
            stmt.setString(1, id);
            stmt.setString(2, firstname);
            stmt.setString(3, lastname);
            stmt.setString(4, imglink);

            int x=stmt.executeUpdate();

            if(x>0)
            {
                out.print("<script>alert('Record Updated Successfully.')</script>");
                response.sendRedirect("Dashboard.jsp");
            }
            else
                    out.print("<script>alert('No such username exists or not updated successfully')</script>");
        }
    }
    }catch (ClassNotFoundException | SQLException e) {
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
