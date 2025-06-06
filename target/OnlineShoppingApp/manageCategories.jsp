<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.shopease.dao.CategoryDAO, com.shopease.model.Category" %>
<%@ page import="com.shopease.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    CategoryDAO dao = new CategoryDAO();
    List<Category> categories = dao.getAllCategories();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Categories</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f9f9f9; }
        h2 { color: #ff3f6c; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        input[type="text"] { padding: 8px; width: 200px; }
        button { background: #ff3f6c; color: white; border: none; padding: 8px 12px; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Manage Categories</h2>

    <form action="CategoryServlet" method="post">
    <input type="text" name="categoryName" placeholder="Category Name" required />
    <input type="text" name="categoryImage" placeholder="Category ImageURL" required />
    <button type="submit">Add Category</button>
</form>


    <table>
    <tr>
        <th>ID</th><th>Name</th><th>ImageURL</th><th>Action</th>
    </tr>
    <% for(Category cat : categories) { %>
        <tr>
            <td><%= cat.getId() %></td>
            <td><%= cat.getName() %></td>
            <td><%= cat.getImageUrl() %></td>
            <td>
                <form action="CategoryServlet" method="post" style="display:inline;">
                    <input type="hidden" name="deleteId" value="<%= cat.getId() %>" />
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    <% } %>
</table>

</body>
</html>
