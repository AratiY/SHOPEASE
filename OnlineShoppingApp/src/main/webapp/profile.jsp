<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile - ShopEase</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #fff;
            padding: 20px 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .profile-container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .profile-header h2 {
            color: #333;
            margin: 0;
        }

        .profile-info {
            margin-top: 30px;
        }

        .profile-info p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        .actions {
            margin-top: 40px;
        }

        .actions a {
            display: inline-block;
            margin-right: 20px;
            padding: 10px 20px;
            background: #ff3f6c;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
        }

        .actions a:hover {
            background: #e2335f;
        }
    </style>
</head>
<body>

<header>
    <h1>ShopEase</h1>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="cart.jsp">Cart</a>
        <a href="myOrders.jsp">Orders</a>
        <a href="LogoutServlet">Logout</a>
    </nav>
</header>

<div class="profile-container">
    <div class="profile-header">
        <h2>Hello, <%= user.getName() %></h2>
        <a href="editProfile.jsp" class="edit-btn">Logout</a>
    </div>
    <div class="profile-info">
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
    </div>

    <div class="actions">
        <a href="myOrders.jsp">My Orders</a>
        <a href="wishlist.jsp">Wishlist</a>
        <a href="addressBook.jsp">Saved Addresses</a>
    </div>
</div>

</body>
</html>
