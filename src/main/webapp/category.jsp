<%@ page import="java.util.*, com.shopease.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<jsp:include page="header.jsp" />
<%
    String categoryType = (String) request.getAttribute("categoryType");
    List<Product> products = (List<Product>) request.getAttribute("categoryProducts");

    String userEmail = (session != null) ? (String) session.getAttribute("userEmail") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .category-title {
            padding: 20px 40px;
            font-size: 22px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            padding: 0 40px 40px;
        }

        .product-card {
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            background: #fff;
            transition: box-shadow 0.2s ease;
            text-decoration: none;
            color: inherit;
        }

        .product-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .product-info {
            padding: 12px;
        }

        .product-info h3 {
            font-size: 16px;
            margin: 5px 0;
            color: #333;
        }

        .product-info p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        .product-info .price {
            color: #ff3f6c;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="category-title">
    Products in <%= categoryType != null ? categoryType : "All" %> Category
</div>

<div class="product-grid">
    <%
        if (products != null && !products.isEmpty()) {
            for (Product product : products) {
                String link = (userEmail != null)
                    ? "productDetails?productId=" + product.getId()
                    : "login.jsp";
    %>
    <a href="<%= link %>" class="product-card"
       <% if (userEmail == null) { %> onclick="return confirm('Please login to view product details');" <% } %>>
        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
        <div class="product-info">
            <h3><%= product.getName() %></h3>
            <p><%= product.getDescription() %></p>
            <p class="price">₹<%= product.getPrice() %></p>
        </div>
    </a>
    <%
            }
        } else {
    %>
    <p style="padding: 0 40px;">No products found in this category.</p>
    <%
        }
    %>
</div>

		   <%@ include file="footer.jsp" %>
</body>
</html>
