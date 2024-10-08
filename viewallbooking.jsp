<%-- 
    Document   : viewallbooking
    Created on : Apr 7, 2024, 3:34:17 AM
    Author     : admin
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Info</title>
<style>
     
        body {
            font-family: Arial, sans-serif;
            background-image: url('teal.jpg');
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
         h1 {
            text-align: center;
            margin-top: 20px;
        }
         h3 {
            text-align: center;
            margin-top: 20px;
        }
        .container {
         background: rgba(255, 255, 255, 0.8);
         padding: 20px;
         border-radius: 10px;
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
         text-align: center;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #CCF3F5;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
    
</style>
</head>
<body>
    <div class="container">
   <h1>View Booking Information</h1><br>
     <h3>Enter the number of ID type user chose while creating account(Passport,Aadhar Card,Driving License,Pan Card)</h3>
    
    <form method="post" action="">
        Enter ID Number: <input type="text" name="idnum">
        <input type="submit" value="View Information">
    </form>
         
    </div>    
   <% 
        ResultSet rs1=null;
        String idnum = request.getParameter("idnum");
        if(idnum != null && !idnum.isEmpty()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms"); 
                PreparedStatement ps = con.prepareStatement("SELECT id, idnum, phn, email, location, airport, month, adultsno,childno,bookingid,package,date,name FROM booking WHERE idnum=?");
                ps.setString(1, idnum);
                rs1 = ps.executeQuery();
                if(rs1.next()) {
    %>
    <br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID NUMBER</th>
            <th>CONTACT NO</th>
            <th>EMAIL</th>
            <th>LOCATION</th>
            <th>AIRPORT</th>
            <th>MONTH</th>
            <th>NO. of ADULTS</th>
            <th>NO. of CHILDREN</th>
            <th>BOOKING ID</th>
            <th>PACKAGE</th>
            <th>DATE</th>
            <th>NAME</th>
        </tr>
        <tr>
            <td><%= rs1.getString("id") %></td>
            <td><%= rs1.getString("idnum") %></td>
            <td><%= rs1.getString("phn") %></td>
            <td><%= rs1.getString("email") %></td>
            <td><%= rs1.getString("location") %></td>
            <td><%= rs1.getString("airport") %></td>
            <td><%= rs1.getString("month") %></td>
            <td><%= rs1.getInt("adultsno") %></td>
            <td><%= rs1.getInt("childno") %></td>
            <td><%= rs1.getString("bookingid") %></td>
            <td><%= rs1.getString("package") %></td>
            <td><%= rs1.getString("date") %></td>
            <td><%= rs1.getString("name") %></td>
        </tr>
    </table>
    <% 
                } else {
                    out.println("No information found for ID: " + idnum);
                }
                con.close();
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
<%
    ResultSet rs=null; 
    Connection conn=null;
    Statement stmt=null;
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from booking");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

   
    </div>    
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BOOKING DETAILS</title>
<body>
    <div>
        <form action="userInfo" method="post" enctype="multipart/form-data"> 

    <%
     Class.forName("org.apache.derby.jdbc.ClientDriver");
     conn=DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
     stmt=conn.createStatement();
     rs=stmt.executeQuery("select * from booking");
     while(rs.next())
     {
    %>
             

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>ID NUM</th>
            <th>PHONE NO</th>
            <th>EMAIL</th>
            <th>LOCATION</th>
            <th>AIRPORT</th>
            <th>MONTH</th>
            <th>ADULTS NO</th>
            <th>CHILD NO</th>
            <th>BOOKING ID</th>
            <th>PACKAGE</th>
            <th>DATE</th>
            <th>NAME</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getInt(8)%></td>
            <td><%=rs.getInt(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>
            <td><%=rs.getString(12)%></td>
            <td><%=rs.getString(13)%></td>
              <td><button class="btn"><a href="bookingDelete.jsp?idnum=<%=rs.getString(2)%>">Remove Booking</a></button></td>
        </tr>
       
    </tbody>
</table>
     <%
       }  
     %>
        

       
            </table>
        </form>
    </div>
    
</body>
</html>
