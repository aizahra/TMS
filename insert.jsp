<%-- 
    Document   : insrt
    Created on : 5 Apr, 2024, 8:52:34 PM
    Author     : Sejal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>


<%
Connection conn = null;
PreparedStatement psSelect = null;
PreparedStatement psInsert = null;
ResultSet rs = null;

try {
     Class.forName("org.apache.derby.jdbc.ClientDriver");
     conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
    
   
    String selectQuery = "SELECT * from reservation";
    psSelect = conn.prepareStatement(selectQuery);
    
    rs = psSelect.executeQuery();
   
    String id = "";
    String idnum = "";
    String phn = "";
    String email = "";
    String location = "";
    String airport = "";
    String month = "";
    String adultsno = "";
    String childno = "";
    String pack = "";
    String date = "";
    String name = "";
    
    if(rs.next()) {
        id = rs.getString("id");
        idnum=rs.getString("idnum");
        phn = rs.getString("phn");
        email = rs.getString("email");
        location = rs.getString("location");
        airport = rs.getString("airport");
        month = rs.getString("month");
        adultsno = rs.getString("adultsno");
        childno = rs.getString("childno");
        pack = rs.getString("package");
        date = rs.getString("date");
        name = rs.getString("name");
        
        
    } else {
        out.println("Request not found.");
        return; 
    }
    
    String bookingId = "BID" + String.format("%07d", new Random().nextInt(10000000));
    
    String insertQuery = "INSERT INTO booking (id, idnum, phn, email, location, airport, month, adultsno, childno, bookingid, package, date,name) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    psInsert = conn.prepareStatement(insertQuery);
   
    psInsert.setString(1, id);
    psInsert.setString(2, idnum);
    psInsert.setString(3, phn);
    psInsert.setString(4, email);
    psInsert.setString(5, location);
    psInsert.setString(6, airport);
    psInsert.setString(7, month);
    psInsert.setInt(8, Integer.parseInt(adultsno));
    psInsert.setInt(9, Integer.parseInt(childno));
    psInsert.setString(10, bookingId);
    psInsert.setString(11, pack);
    psInsert.setString(12, date);
    psInsert.setString(13, name);
    int rowsInserted = psInsert.executeUpdate();
    
    if(rowsInserted > 0) {
        out.println("Data inserted into booking table successfully.");
        response.sendRedirect("emailjs.html");
       
    } else {
        out.println("Failed to insert data into booking table.");
    }
} catch(SQLException e) {
    e.printStackTrace();
} finally {
   
    try {
        if(rs != null) rs.close();
        if(psSelect != null) psSelect.close();
        if(psInsert != null) psInsert.close();
        if(conn != null) conn.close();
    } catch(SQLException e) {
        e.printStackTrace();
    }
}
%>