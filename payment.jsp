<%-- 
    Document   : payment
    Created on : 21 Feb, 2024, 4:33:57 PM
    Author     : Sejal
--%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PAYMENT</title>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container{
    width: 400px;
    border-radius: 8px;
    padding: 40px;
    box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.1),
                0 5px 12px -2px rgba(0, 0, 0, 0.1),
                0 18px 36px -6px rgba(0, 0, 0, 0.1);
}

.container .title{
    font-size: 20px;
    font-family: Arial, Helvetica, sans-serif;
}

.container form input{
    display: none;
}

.container form .category{
    margin-top: 10px;
    padding-top: 20px;

    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: 15px;
}

.category label{
    
    height: 145px;
    padding: 20px;
    box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.2);
    display: flex;
    
    justify-content: center;
    align-items: center;
    cursor: pointer;
    border-radius: 5px;
    position: relative;
}



#visa:checked ~ .category .visaMethod,
#mastercard:checked ~ .category .mastercardMethod,
#paypal:checked ~ .category .paypalMethod,
#AMEX:checked ~ .category .amexMethod{
    box-shadow: 0px 0px 0px 1px #6064b6;
}


#visa:checked ~ .category .visaMethod .check,
#mastercard:checked ~ .category .mastercardMethod .check,
#paypal:checked ~ .category .paypalMethod .check,
#AMEX:checked ~ .category .amexMethod .check{
    display: block;
}


label .imgName{
    display: flex;
    
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    flex-direction: column;
    gap: 10px;
}

.imgName span{
   
    font-family: Arial, Helvetica, sans-serif;

    position: absolute;
    top: 72%;
    transform: translateY(-72%);
}

.imgName .imgContainer{
    width: 50px;
    display: flex;
    justify-content: center;
    align-items: center;

    position: absolute;
    top: 35%;
    transform: translateY(-35%);
}

img{
    width: 50px;
    height: auto;
}

.visa img{
    width: 80px;
    
}

.mastercard img{
    width: 65px;
}

.paypal img{
    width: 80px;
}

.AMEX img{
    width: 50px;
}

.check{
    display: none;
    position: absolute;
    top: -4px;
    right: -4px;
}

.check i{
    font-size: 18px;
}
</style>

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="container">
        <div class="title">
            <h4>Select a <span style="color: #6064b6">Payment</span> method</h4>
        </div>

         <form action="#">
            <input type="radio" name="payment" id="paytm" onclick="window.location.href='paytm.jsp'">
            <input type="radio" name="payment" id="googlepay" onclick="window.location.href='googlepay.jsp'">


            <div class="category" class="visaMethod">
                <label for="paytm">
                    <div class="imgName">
                        <div class="imgContainer paytm">
                            <img src="paytm.jpg" alt="">
                        </div>
                        <span class="name">Paytm</span>
                    </div>
                    <span class="check"><i  style="color: #6064b6;"></i></span>
                </label>


                <label for="googlepay" >
                    <div class="imgName">
                        <div class="imgContainer googlepay">
                            <img src="googlepay.png" alt="">
                        </div>
                        <span class="name">Google Pay</span>
                    </div>
                    <span class="check"><i style="color: #6064b6;"></i></span>
                </label>

                
            </div>
        </form>
    </div>
</html>
