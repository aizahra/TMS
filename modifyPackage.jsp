<%-- 
    Document   : modifyPackage
    Created on : 8 Mar, 2024, 3:56:23 PM
    Author     : Sejal
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ResultSet rs=null; 
    Connection conn=null;
    Statement stmt=null;
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms","tms","tms");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from package");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Package Update Form</title>
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
</head>
<body>
    <div class="container">
        <form action="packageUpload" method="post" enctype="multipart/form-data"> 
            <label>Enter Package Id:</label><br>
            <input type="text" name="txt_pId" value=""><br><br>  	
            <label>Enter Package Name:</label><br>                   
            <input type="text" name="txt_pname" value="" size='50'><br><br>
            <label>Upload Hotel Photo:</label><br>
            Select File:<input type="file" name="img"  size='50'><br><br>
            <label>Enter Package Description:</label><br>                   
            <input type="text" name="txt_pdesc" value="" size='50'><br><br>
            <label>Enter Package Budget:</label><br>
            <input type="text" name="txt_pbudget" value=""><br><br>  
            
            
            <input type="submit" name="btn_add" value="ADD">
             <form action="ImageView" method="get">
            <br> <input type="submit" name="btn_view" value="VIEW" >
            <form action="Delete" method="get">
            <br> <input type="submit" name="btn_delete" value="DELETE" >
            <input type="submit" name="btn_update" value="UPDATE">
             <form action="ImageView" method="get">

       
            </table>
        </form>
    </div>
    
</body>
</html>
