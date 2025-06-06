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

        table { width: 100%; border-collapse: collapse; background: white; margin-left: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; }
        th { background: #ff3f6c; color: white; }
        a { color: #ff3f6c; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }

        input[type="text"], input[type="number"] {
            padding: 6px;
            width: 95%;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background: #ff3f6c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #e83560;
        }
        
        img{
			width: 15%;        
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

    <div style="padding: 30px; flex: 1;">
    
            <a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
    
    
        <h2>Manage Products</h2>
        <a href="addProduct.jsp">+ Add New Product</a>
        <br><br>

        
        <!-- Product List -->
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Image</th><th>Price</th><th>Category</th><th>Action</th>
            </tr>
            <%
                for(Product p : products){
            %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getName() %> </td>
                    <td><img alt="image" src="<%=p.getImageUrl()%>"> </td>
                    <td>₹<%= p.getPrice() %></td>
                    <td><%= p.getCategory() %></td>
                    <td>
                        <a href="editProduct.jsp?id=<%= p.getId() %>">Edit</a> |
                        <a href="deleteProduct?id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
