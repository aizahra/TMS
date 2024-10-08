<%-- 
    Document   : JOConnection
    Created on : 13 Feb, 2024, 12:02:44 AM
    Author     : Sejal
--%>
%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 <%--  <% import java.sql.*;
       import java.util.*;
       import java.io.*;

       public class JOConnection {
       public static Connection conn;
       public static Statement stmt;
       public static ResultSet rslt;


public static void JConnect() throws  ClassNotFoundException, SQLException {

String username ="root"; 
String password =" "; 

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root"," ");
stmt = conn.createStatement();

}
public static void main(String[] args) {
        new JOConnection();
}
} %> --%>
 
 <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rslt = null;

    try {
        String username = "root";
        String password = "your_password"; // replace 'your_password' with the actual password

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", username, password);
        stmt = conn.createStatement();

        // Your database operations here

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the finally block
        try {
            if (rslt != null) rslt.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</html>
