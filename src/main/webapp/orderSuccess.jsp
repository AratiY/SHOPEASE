<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            margin-top: 100px;
            background: #f4f4f4;
        }

        .success-box {
            display: inline-block;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            color: #28a745;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #ff3f6c;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h2>Thank you! Your order has been placed.</h2>
        <p>You will receive a confirmation soon.</p>
        <a href="home.jsp">Continue Shopping</a>
    </div>
</body>
</html>
