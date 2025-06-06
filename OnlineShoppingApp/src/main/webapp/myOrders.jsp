<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.Order, java.util.List" %>
<%@ page import="com.shopease.dao.OrderDAO" %>
<%@ page import="com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDAO orderDAO = new OrderDAO();
    List<Order> orders = orderDAO.getOrdersByUserId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders - ShopEase</title>
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

        .order-list {
            padding: 0 40px 40px;
        }

        .order-card {
            background-color: #fff;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
        }

        .order-card h3 {
            margin: 0 0 10px;
            font-size: 20px;
        }

        .order-card p {
            margin: 4px 0;
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
            <a href="cart.jsp">Cart</a>
            <a href="profile.jsp">Profile</a>
        </nav>
    </header>

    <h2>My Orders</h2>

    <div class="order-list">
        <% if (orders.isEmpty()) { %>
            <p>No orders yet.</p>
        <% } else {
            for (Order order : orders) { %>
                <div class="order-card">
                    <h3>Order ID: <%= order.getId() %></h3>
                    <p>Date: <%= order.getOrderDate() %></p>
                    <p>Amount: ₹<%= order.getTotalAmount() %></p>
                    <p>Status: <%= order.getStatus() %></p>
                </div>
        <%  }
        } %>
    </div>

    <footer>
        &copy; 2025 ShopEase. All rights reserved.
    </footer>

</body>
</html>
