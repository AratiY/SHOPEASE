<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.shopease.dao.OrderDAO, com.shopease.model.Order, com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDAO dao = new OrderDAO();
    List<Order> orders = dao.getAllOrders(); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>View All Orders - Admin</title>
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
        .main {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background: #ff3f6c;
            color: white;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .back-btn {
            margin-bottom: 20px;
            display: inline-block;
            text-decoration: none;
            background: #ff3f6c;
            color: white;
            padding: 10px 16px;
            border-radius: 6px;
            font-weight: 600;
        }

        .back-btn:hover {
            background: #e0355d;
			text-decoration: none;
            
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
    <div class="main">
    
                <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
    
    
        <h2>All Orders</h2>
        <table>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Total</th>
                <th>Order Date</th>
            </tr>
            <%
                for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getUserId() %></td>
                <td>₹<%= order.getTotalAmount() %></td>
                <td><%= order.getOrderDate() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
