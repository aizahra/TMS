<%-- 
    Document   : viewbookedpkg
    Created on : 3 Apr, 2024, 8:38:32 PM
    Author     : Sejal
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Booked Package</title>
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
    <h1>Enter the details to check your booking</h1><br>
  <h3>Enter the number of ID type you chose while booking(Passport,Aadhar Card,Driving License,Pan Card)</h3>
  <form>
<!--    <label for="id">Select ID Type</label>
    <select id="id" name="id" required>
      <option value="passport">Passport</option>
      <option value="aadhar">Aadhar Card</option>
      <option value="driving_license">Driving License</option>
      <option value="pan">Pan Card</option>
    </select>-->
    
    <label for="id_number">ID Number</label>
    <input type="text" id="idnum" name="idnum" required>
    <input type="submit" name="btnSubmit" value="View Booking">
  </form>
</div>

</body>
</html>

    <% 
        //String id = request.getParameter("id");
        String idnum = request.getParameter("idnum");
       //if(idnum != null && !idnum.isEmpty()){
       if(request.getParameter("btnSubmit")!=null){
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms"); 
                PreparedStatement ps = con.prepareStatement("SELECT id, idnum, phn, email, location, airport, month, adultsno, childno, bookingid, package, date, name FROM booking WHERE idnum=?");
               // ps.setString(1, id);
                ps.setString(1, idnum);
                ResultSet rs = ps.executeQuery();
                
                if(rs.next()) {
    %>
    <br>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>ID NUMBER</th>
            <th>CONTACT NO</th>
            <th>EMAIL ID</th>
            <th>LOCATION</th>
            <th>NEAREST AIRPORT</th>
            <th>MONTH</th>
            <th>NUMBER OF ADULTS</th>
            <th>NUMBER OF CHILDREN</th>
            <th>BOOKING ID</th>
            <th>PACKAGE</th>
            <th>DATE</th>
            <th>NAME</th>
        </tr>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("idnum") %></td>
            <td><%= rs.getString("phn") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("airport") %></td>
            <td><%= rs.getString("month") %></td>
            <td><%= rs.getInt("adultsno") %></td>
            <td><%= rs.getInt("childno") %></td>
            <td><%= rs.getString("bookingid") %></td>
            <td><%= rs.getString("package") %></td>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("name") %></td>
        </tr>
    </table>
    <% 
                } else {
                    out.println("No booking information found for ID: " + idnum);
                }
                con.close();
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
</html>
