<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.dao.CategoryDAO" %>
<%@ page import="com.shopease.model.Category" %>
<%@ page import="com.shopease.dao.ProductDAO" %>
<%@ page import="com.shopease.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDao = new ProductDAO();
    Product product = productDao.getProductById(id);
    CategoryDAO categoryDao = new CategoryDAO();
    List<Category> categories = categoryDao.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Admin</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #ff3f6c;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus,
        select:focus {
            border-color: #ff3f6c;
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input[type="submit"] {
            background-color: #ff3f6c;
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e6365f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        <form action="EditProductServlet" method="post">
            <input type="hidden" name="id" value="<%= product.getId() %>">

            <label for="name">Product Name</label>
            <input type="text" name="name" id="name" value="<%= product.getName() %>" required>

            <label for="description">Description</label>
            <textarea name="description" id="description" required><%= product.getDescription() %></textarea>

            <label for="price">Price (₹)</label>
            <input type="number" step="0.01" name="price" id="price" value="<%= product.getPrice() %>" required>

            <label for="imageUrl">Image URL</label>
            <input type="text" name="imageUrl" id="imageUrl" value="<%= product.getImageUrl() %>">

            <label for="category">Category</label>
            <select name="category" id="category" required>
                <% for (Category cat : categories) { %>
                    <option value="<%= cat.getName() %>" <%= cat.getName().equals(product.getCategory()) ? "selected" : "" %>>
                        <%= cat.getName() %>
                    </option>
                <% } %>
            </select>

            <input type="submit" value="Update Product">
        </form>
    </div>
</body>
</html>
