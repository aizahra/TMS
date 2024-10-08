<%-- 
    Document   : viewpayment
    Created on : 8 Mar, 2024, 10:57:12 PM
    Author     : Sejal
--%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment Options</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 600px;
            height: auto; 
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.1),
            0 5px 12px -2px rgba(0, 0, 0, 0.1),
            0 18px 36px -6px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .container .title {
            font-size: 20px;
            font-family: Arial, Helvetica, sans-serif;
            margin-bottom: 20px;
        }

        .container form input {
            display: none;
        }

        .container form .category {
            margin-top: 10px;
            padding-top: 20px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 15px;
        }

        .category label {
            height: 250px; 
            padding: 20px;
            box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            border-radius: 5px;
            position: relative;
        }

        .imgName {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            flex-direction: column;
            gap: 10px;
        }

        .imgName span {
            font-family: Arial, Helvetica, sans-serif;
            position: absolute;
            top: 72%;
            transform: translateY(-72%);
        }

        .imgName .imgContainer {
            width: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            top: 35%;
            transform: translateY(-35%);
        }

        img {
            width: 250px;
            height: auto;
        }

        .check {
            display: none;
            position: absolute;
            top: -4px;
            right: -4px;
        }

        .check i {
            font-size: 18px;
        }

        .button-back {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        
        
    </style>
</head>
<body>
<button class="button-back" onclick="window.location.href='loggedindash.jsp'">Back</button>
<div class="container">
    <h1 class="title">Payment Options</h1>
    <form action="#" method="post" enctype="multipart/form-data">
        <div class="category">
            <label>
                <div class="imgName">
                    <div class="imgContainer"><img src="paytm.jpg" alt="Paytm Logo"></div>
<!--                    <span>Pay with Visa</span>-->
                </div>
                 <input type="radio" name="payment" id="paytm" onclick="window.location.href='paytm.jsp'"><!--
<!--            <input type="radio" name="payment" id="phonepe" onclick="window.location.href='phonepe.jsp'" >-->
            
            </label>
            <label>
                <div class="imgName">
                    <div class="imgContainer"><img src="googlepay.png" alt="GPay Logo"></div>
<!--                    <span>Pay with GooglePay</span>-->
                </div>
               <input type="radio" name="payment" id="googlepay" onclick="window.location.href='googlepay.jsp'"><!--
                <div class="check"><i class="fas fa-check"></i></div>-->
            </label>
        </div>
        
    </form>
</div>
</body>
</html>

