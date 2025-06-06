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
        body { font-family: Arial; background: #f9f9f9; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: left; }
        th { background: #ff3f6c; color: white; }
        h2 { color: #333; }
    </style>
</head>
<body>
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
</body>
</html>
