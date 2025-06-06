<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopease.model.User" %>
<%@ page import="com.shopease.dao.UserDao" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDao userDao = new UserDao();
    List<User> users = userDao.getAllUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Manage Users - ShopEase Admin</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
        }
        .container {
            padding: 40px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        th, td {
            padding: 12px 16px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #ff3f6c;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #fafafa;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
        <h2>All Registered Users</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
            <%
                for (User u : users) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getRole() %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
