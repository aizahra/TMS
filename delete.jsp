<%-- 
    Document   : dlt
    Created on : 5 Apr, 2024, 8:54:01 PM
    Author     : Sejal
--%>

<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>


<%
String idnum = request.getParameter("idnum");
Connection conn = null;
PreparedStatement psDelete = null;

try {
     Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
    
    String deleteQuery = "DELETE FROM reservation WHERE idnum=?";
    
           psDelete = conn.prepareStatement(deleteQuery);
   
    psDelete.setString(1, request.getParameter("idnum"));
  
    int rowsDeleted = psDelete.executeUpdate();
    
    if (rowsDeleted > 0) {
        out.println("Request deleted successfully.");
       
         response.sendRedirect("reservationRequest.jsp");
    } else {
        out.println("Failed to delete request.");
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    
    try {
        if (psDelete != null) psDelete.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>