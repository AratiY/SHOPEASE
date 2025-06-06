<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.OrderItem, com.shopease.dao.OrderDAO, java.util.List" %>
<%
    String orderIdParam = request.getParameter("orderId");
    int orderId = (orderIdParam != null) ? Integer.parseInt(orderIdParam) : 0;

    OrderDAO dao = new OrderDAO();
    List<OrderItem> items = dao.getOrderItemsByOrderId(orderId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details - ShopEase</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: #f7f7f7;
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

        h2 {
            margin: 30px 40px 10px;
            font-size: 28px;
            color: #333;
        }

        .order-items {
            padding: 0 40px 40px;
        }

        .item-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
        }

        .item-card img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
        }

        .item-details {
            flex: 1;
        }

        .item-details h3 {
            margin: 0;
            color: #333;
        }

        .item-details p {
            margin: 5px 0;
            color: #555;
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
        <a href="myOrders.jsp">My Orders</a>
        <a href="profile.jsp">Profile</a>
    </nav>
</header>

<h2>Order Details - Order ID <%= orderId %></h2>

<div class="order-items">
    <% if (items != null && !items.isEmpty()) {
        for (OrderItem item : items) { %>
        <div class="item-card">
            <img src="<%= item.getProduct().getImageUrl() %>" alt="Product Image">
            <div class="item-details">
                <h3><%= item.getProduct().getName() %></h3>
                <p>Quantity: <%= item.getQuantity() %></p>
                <p>Price: ₹<%= item.getProduct().getPrice() %></p>
                <p>Total: ₹<%= item.getTotalPrice() %></p>
            </div>
        </div>
    <% }} else { %>
        <p style="margin: 0 40px; color: #999;">No items found for this order.</p>
    <% } %>
</div>

<footer>
    &copy; 2025 ShopEase. All rights reserved.
</footer>

</body>
</html>
