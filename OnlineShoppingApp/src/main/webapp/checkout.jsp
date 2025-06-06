<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - ShopEase</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #fff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            color: #ff3f6c;
        }

        nav a {
            margin-left: 20px;
            text-decoration: none;
            color: #333;
        }

        .checkout-container {
            max-width: 700px;
            background: #fff;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .checkout-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #444;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        button {
            margin-top: 20px;
            padding: 14px;
            background-color: #ff3f6c;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #e62e5c;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            color: #777;
        }
    </style>
</head>
<body>

<header>
    <h1>ShopEase</h1>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="profile.jsp">Profile</a>
    </nav>
</header>

<div class="checkout-container">
    <h2>Delivery Details</h2>
    <form action="PlaceOrderServlet" method="post">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" name="name" id="name" required />
        </div>

        <div class="form-group">
            <label for="phone">Mobile Number</label>
            <input type="tel" name="phone" id="phone" required />
        </div>

        <div class="form-group">
            <label for="pincode">Pin Code</label>
            <input type="text" name="pincode" id="pincode" required />
        </div>

        <div class="form-group">
            <label for="address">Address (House No, Street, Area)</label>
            <textarea name="address" id="address" rows="3" required></textarea>
        </div>

        <div class="form-group">
            <label for="city">City/District</label>
            <input type="text" name="city" id="city" required />
        </div>

        <div class="form-group">
            <label for="state">State</label>
            <select name="state" id="state" required>
                <option value="">Select State</option>
                <option value="Delhi">Delhi</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                <!-- Add other states as needed -->
            </select>
        </div>

        <button type="submit">Place Order</button>
    </form>
</div>

<footer>
    &copy; 2025 ShopEase. All rights reserved.
</footer>

</body>
</html>
