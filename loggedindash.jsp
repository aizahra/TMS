<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Rajasthan Routes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            position: relative; 
        }
        .left-panel {
            flex: 1;
            padding-right: 20px;
            border-right: 1px solid #ccc;
        }
        #image-container {
            width: 70%;
            margin: auto;
        }
        #image {
            width: auto;
            height: auto;
        }
        .moving-text-container {
            position: absolute;
            top: 0%;
            left: -100%;
            white-space: nowrap; 
            animation: moveText 10s infinite linear;
        }
        .moving-text {
            font-size: 20px;
            color: #0000000;
            background-color: yellow;
        }
        @keyframes moveText {
            0% {
                left: -100%; 
            }
            100% {
                left: 100%;
            }
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #CCE4F5;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .navbar button {
            background: none;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .dropdown {
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: whitesmoke;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 5px;
            overflow: hidden;
        }
        .dropdown-content button {
            background: none;
            border: none;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            cursor: pointer;
            font-size: 16px;
            color: black; 
            width: 100%;
            text-align: left;
            transition: color 0.3s ease; 
        }
        .dropdown-content button:hover {
            color: blueviolet; 
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .button {
            background-color: #CCE4F5;
            border: none;
            color: black;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        .button:hover {
            background-color: #7FA5E3;
        }
    </style>
</head>
<body>
<%

if(session.getAttribute("userid")!=null){
                  out.print("<center><h1>WELCOME &nbsp:"+session.getAttribute("userid")+"</h1></center>");
                  }

%>

<h1 style="text-align: center;">Royal Rajasthan Routes</h1>
<h2 style="text-align: center;">WELCOME</h2>
<div class="container"> 
    <div class="left-panel">
        <h3 style="border-bottom: 1px solid #ccc; padding-bottom: 10px;">Menu</h3>

        <button class="button"onclick="window.location.href='addperdetails.jsp'">Add Personal Details</button>
        <button class="button" onclick="window.location.href='updatecustdetails.jsp'">Update Customer Details</button>
        <button class="button" onclick="window.location.href='viewprsnl.jsp'">View Your Details</button>
        <button class="button" onclick="window.location.href='deletedetails.jsp'">Delete Personal Details</button>
        <button class="button" onclick="window.location.href='viewdestination.jsp'">Destinations</button>
        <button class="button" onclick="window.location.href='viewPackage.jsp'">Check Available Packages</button>
        <button class="button" onclick="window.location.href='reservation.jsp'">Book Package</button>
        <button class="button" onclick="window.location.href='viewbookedpkg.jsp'">View Booked Package</button>
        <button class="button"onclick="window.location.href='viewhotel.jsp'">View Hotels</button>

        <button class="button" onclick="window.location.href='viewpayment.jsp'">Payment</button>
        <button class="button" onclick="window.location.href='contactus.html'">Contact Us</button>
        <button class="button"onclick="window.location.href='about.jsp'">About</button>
        <button class="button" id="logoutBtn" style="margin-top: 20px; display: none;">Logout</button>
    </div>
    <div class="right-panel">
        <div class="navbar">
            <button class="button" onclick="window.location.href='about.jsp'">About Us</button>
            <button class="button" onclick="window.location.href='viewdestination.jsp'">Destinations</button>
            <button class="button" onclick="window.location.href='logout2.jsp'">Logout</button>
            <div class="dropdown">
                <button class="button" id="optionBtn">Login/SignUp</button>
                <div class="dropdown-content">
                    <button id="logoutBtn" onclick="window.location.href='logout2.jsp'">Logout</button>
                    

                </div>
            </div>
        </div>
        <div class="moving-text-container">
            <span class="moving-text">15% off on all Packages . For amazing travel experience book our tour packages to explore the enchanting beauty of Rajasthan !!</span>
        </div>
        <img src="raj.jpg" width ="900" height="580" alt="Dashboard Image">
    </div>
</div>