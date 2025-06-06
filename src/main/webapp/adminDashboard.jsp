<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.User" %>
<%@ page import="com.shopease.dao.ProductDAO" %>
<%@ page import="com.shopease.dao.OrderDAO" %>
<%@ page import="com.shopease.dao.UserDao" %>
<%@ page import="com.shopease.model.Order" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDAO productDao = new ProductDAO();
    OrderDAO orderDao = new OrderDAO();
    UserDao userDao = new UserDao();

    int totalProducts = productDao.getAllProducts().size();
    int totalOrders = orderDao.getAllOrders().size();
    int totalUsers = userDao.getAllUsers().size();
    double totalRevenue = orderDao.getTotalRevenue();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard - ShopEase</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 240px;
            background: white;
            box-shadow: 2px 0 8px rgba(0,0,0,0.1);
            padding: 30px 20px;
        }
        .sidebar h2 {
            color: #ff3f6c;
            margin-bottom: 40px;
            font-weight: 700;
            font-size: 24px;
        }
        .sidebar ul {
            list-style: none;
            padding-left: 0;
        }
        .sidebar ul li {
            margin-bottom: 20px;
        }
        .sidebar ul li a {
            text-decoration: none;
            font-weight: 600;
            color: #333;
            font-size: 16px;
            transition: color 0.3s;
        }
        .sidebar ul li a:hover {
            color: #ff3f6c;
        }
        .main-content {
            flex-grow: 1;
            padding: 40px;
        }
        .welcome {
            font-size: 22px;
            color: #333;
            margin-bottom: 30px;
        }
        .stats {
            display: flex;
            gap: 30px;
            margin-bottom: 40px;
        }
        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px 30px;
            text-align: center;
            flex: 1;
        }
        .card h3 {
            color: #555;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 24px;
            font-weight: bold;
            color: #ff3f6c;
        }
        .quick-actions {
            display: flex;
            gap: 20px;
        }
        .quick-actions a {
            background: #ff3f6c;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-weight: 600;
            border-radius: 8px;
            transition: background 0.3s;
        }
        .quick-actions a:hover {
            background: #e0355d;
        }
    </style>
</head>
<body>
    <aside class="sidebar">
        <h2>ShopEase Admin</h2>
        <ul>
            <li><a href="viewAllOrders.jsp">View All Orders</a></li>
            <li><a href="manageProducts.jsp">Manage Products</a></li>
            <li><a href="manageCategories.jsp">Manage Categories</a></li>
             <li><a href="viewUsers.jsp">View Users</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </aside>
    <div class="main-content">
        <div class="welcome">Welcome, Admin <%= user.getName() %>!</div>
        
        <div style="margin-top: 30px;">
    <h4>Admin Info</h4>
    <p>Name: <%= user.getName() %></p>
    <p>Email: <%= user.getEmail() %></p>
    <p>Role: <%= user.getRole() %></p>
</div>
        

        <div class="stats">
            <div class="card">
                <h3>Total Products</h3>
                <p><%= totalProducts %></p>
            </div>
            <div class="card">
                <h3>Total Orders</h3>
                <p><%= totalOrders %></p>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <p><%= totalUsers %></p>
            </div>
            <div class="card">
    		<h3>Total Revenue</h3>
   			 <p>₹<%= String.format("%.2f", totalRevenue) %></p>
			</div>
        </div>

        <div class="quick-actions">
            <a href="addProduct.jsp">+ Add New Product</a>
            <a href="viewAllOrders.jsp">View Pending Orders</a>
            <a href="manageCategories.jsp">Manage Categories</a>
           
            
        </div>
        
        <h3 style="margin-top: 40px;">Recent Orders</h3>
<table style="width: 100%; border-collapse: collapse; margin-top: 15px;">
    <tr style="background: #ff3f6c; color: white;">
        <th style="padding: 10px;">Order ID</th>
        <th>User ID</th>
        <th>Date</th>
        <th>Amount</th>
        <th>Status</th>
    </tr>
<%
    List<Order> recentOrders = orderDao.getRecentOrders(5); // You’ll create this method
    for (Order o : recentOrders) {
%>
    <tr style="background: #fff; text-align: center;">
        <td style="padding: 10px;"><%= o.getId() %></td>
        <td><%= o.getUserId() %></td>
        <td><%= o.getOrderDate() %></td>
        <td>₹<%= o.getTotalAmount() %></td>
        <td><%= o.getStatus() %></td>
    </tr>
<% } %>
</table>
        
    </div>
</body>
</html>
