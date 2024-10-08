<%-- 
    Document   : adminDash2
    Created on : 5 Apr, 2024, 9:46:35 PM
    Author     : Sejal
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }
  .container {
    display: flex;
    flex-direction: column;
    height: 100vh;
  }
  .header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
  }
  .content {
    display: flex;
    flex-grow: 1;
  }
  .sidebar {
    background-color: #f4f4f4;
    width: 200px;
    padding: 20px;
  }
  .main-content {
    flex-grow: 1;
    padding: 20px;
    text-align: center;
  }
  .button-group {
    margin-bottom: 20px;
  }
  .button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    margin-bottom: 10px;
    cursor: pointer;
  }
  .button:hover {
    background-color: #0056b3;
  }
  .top-panel {
    background-color: #f4f4f4;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .top-buttons button {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
  }
  .top-buttons button:last-child {
    margin-right: 0;
  }
  .top-buttons button:hover {
    background-color: #0056b3;
  }
  .image-container {
    text-align: center;
    margin-top: 50px;
  }
  img {
    max-width: 100%;
    max-height: 400px;
  }
</style>
</head>
<body>
  <div class="container">
    <div class="header">
        <h1>ROYAL RAJASTHAN ROUTES</h1>
      <h2>Admin Dashboard</h2>
    </div>
    <div class="content">
      <div class="sidebar">
        <div class="button-group">
          <button class="button" onclick="window.location.href='viewUserInfo.jsp'">View User's Info</button>
          <button class="button" onclick="window.location.href='modifyPackage.jsp'">Modify Packages</button>
          <button class="button" onclick="window.location.href='viewpackage3.jsp'">View Packages</button>
          <button class="button" onclick="window.location.href='addhotel.jsp'">Add Hotels</button>
          <button class="button" onclick="window.location.href='viewhotel3.jsp'">View Hotels</button>
          <button class="button" onclick="window.location.href='modifydestination.jsp'">Modify Destinations</button>
          <button class="button" onclick="window.location.href='viewdestination3.jsp'">View Destinations</button>
          <button class="button" onclick="window.location.href='reservationRequest.jsp'">View Reservation Requests</button>
          <button class="button" onclick="window.location.href='viewallbooking.jsp'">View Bookings</button>
          <button class="button" onclick="window.location.href='modifypayment.jsp'">Payment Options</button>
          <button class="button" onclick="window.location.href='emailjs.html'">Contact Customer</button>
          <button class="button" onclick="window.location.href='about3.jsp'">About Section</button>
        </div>
      </div>
      <div class="main-content">
        <div class="top-panel">
          <div>
            <button></button>
            <button></button>
            <button></button>
          </div>
          <button onclick="window.location.href='logout.jsp'">Logout</button>
        </div>
        <div class="image-container">
          <img src="raj.jpg" alt="Center Image">
        </div>
      </div>
    </div>
  </div>
</body>
</html>
