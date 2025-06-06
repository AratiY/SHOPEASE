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
            height: 100vh;
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
            padding: 30px;
            flex: 1;
            background: #f9f9f9;
        }

        h2 {
            color: #ff3f6c;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 8px;
            margin-right: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background: #ff3f6c;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #e83560;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ff3f6c;
            color: white;
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
        
        img{
        	width: 25%;
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
    
    
        <h2>Manage Categories</h2>

        <!-- Add Category Form -->
        <form action="CategoryServlet" method="post">
            <input type="text" name="categoryName" placeholder="Category Name" required />
            <input type="text" name="categoryImage" placeholder="Category Image URL" required />
            <button type="submit">Add Category</button>
        </form>

        <!-- Category Table -->
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image </th>
                <th>Action</th>
            </tr>
            <% for(Category cat : categories) { %>
                <tr>
                    <td><%= cat.getId() %></td>
                    <td><%= cat.getName() %></td>
                    <td><img alt="image" src="<%=cat.getImageUrl()%>"> </td>
                    
                    <td>
                        <form action="CategoryServlet" method="post" style="display:inline;">
                            <input type="hidden" name="deleteId" value="<%= cat.getId() %>" />
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
