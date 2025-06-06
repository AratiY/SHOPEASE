<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.Product, com.shopease.dao.ProductDAO, java.util.*, java.util.stream.Collectors" %>
<%
    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();

    // Group products by category
    Map<String, List<Product>> categoryMap = products.stream()
        .collect(Collectors.groupingBy(Product::getCategory));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Categories - ShopEase</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
        }

        header {
            background-color: #ffffff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            margin: 0;
            color: #ff3f6c;
        }

        nav a {
            margin-left: 20px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        nav a:hover {
            color: #ff3f6c;
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            padding-left: 40px;
            margin-top: 40px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
            padding: 20px 40px;
        }

        .product-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
            padding: 15px;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-card h3 {
            font-size: 18px;
            margin: 10px 0 5px;
        }

        .product-card p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
    <header>
        <h1>ShopEase</h1>
        <nav>
            <a href="home.jsp">Home</a>
            <a href="categories.jsp">Categories</a>
            <a href="cart.jsp">Cart</a>
            <a href="profile.jsp">Profile</a>
        </nav>
    </header>

    <% for (Map.Entry<String, List<Product>> entry : categoryMap.entrySet()) { %>
        <h2 class="section-title"><%= entry.getKey() %></h2>
        <div class="product-grid">
            <% for (Product p : entry.getValue()) { %>
                <a href="productDetails?productId=<%= p.getId() %>" style="text-decoration:none; color:inherit;">
                    <div class="product-card">
                        <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>">
                        <h3><%= p.getName() %></h3>
                        <p>₹<%= p.getPrice() %></p>
                    </div>
                </a>
            <% } %>
        </div>
    <% } %>

    <%@ include file="footer.jsp" %>
</body>
</html>
