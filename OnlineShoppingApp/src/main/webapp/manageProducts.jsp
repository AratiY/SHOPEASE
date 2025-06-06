<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.shopease.dao.ProductDAO, com.shopease.model.Product, com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products - Admin</title>
    <style>
        body { font-family: Arial; background: #f2f2f2; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ccc; }
        th { background: #ff3f6c; color: white; }
        a { color: #ff3f6c; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2>Manage Products</h2>
    <a href="addProduct.jsp">+ Add New Product</a>
    <br><br>
    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Price</th><th>Category</th>
        </tr>
        <%
            for(Product p : products){
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td>₹<%= p.getPrice() %></td>
                <td>
                    <a href="editProduct.jsp?id=<%= p.getId() %>">Edit</a> |
                    <a href="deleteProduct?id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
