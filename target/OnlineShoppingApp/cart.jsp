<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.CartItem, java.util.List, java.util.ArrayList" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();
    double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - ShopEase</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
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
            font-weight: 500;
        }

        nav a:hover {
            color: #ff3f6c;
        }

        h2 {
            margin: 30px 40px 10px;
            font-size: 28px;
            color: #333;
        }

        .cart-items {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 0 40px 40px;
        }

        .cart-card {
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.2s ease;
        }

        .cart-card:hover {
            transform: translateY(-3px);
        }

        .cart-card img {
            width: 150px;
            object-fit: cover;
        }

        .cart-details {
            padding: 20px;
            flex: 1;
        }

        .cart-details h3 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .cart-details p {
            margin: 5px 0;
            color: #555;
            font-size: 15px;
        }

        .cart-total {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            margin: 20px 40px 10px;
            color: #333;
        }

        .checkout-btn {
            display: block;
            text-align: right;
            margin: 0 40px 40px;
        }

        .checkout-btn a {
            background-color: #ff3f6c;
            color: #fff;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.2s ease;
        }

        .checkout-btn a:hover {
            background-color: #e63659;
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
            <a href="categories.jsp">Categories</a>
            <a href="profile.jsp">Profile</a>
        </nav>
    </header>

    <h2>Your Cart</h2>

    <div class="cart-items">
        <% for (CartItem item : cart) {
            double itemTotal = item.getTotalPrice();
            total += itemTotal;
        %>
        <div class="cart-card">
            <img src="<%= item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getName() %>">
            <div class="cart-details">
                <h3><%= item.getProduct().getName() %></h3>
                <p>Price: ₹<%= item.getProduct().getPrice() %></p>
                <p>Quantity: <%= item.getQuantity() %></p>
                <p>Total: ₹<%= itemTotal %></p>
            </div>
        </div>
        <% } %>
    </div>

    <div class="cart-total">
        Grand Total: ₹<%= total %>
    </div>

    <div class="checkout-btn">
        <a href="checkout.jsp">Proceed to Checkout</a>
    </div>

    <footer>
        &copy; 2025 ShopEase. All rights reserved.
    </footer>

</body>
</html>
