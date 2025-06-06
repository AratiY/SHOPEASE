<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.shopease.model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= product.getName() %> - ShopEase</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .product-details {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            display: flex;
            gap: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .product-image img {
            max-width: 400px;
            border-radius: 10px;
        }
        .product-info h2 {
            color: #ff3f6c;
            margin-bottom: 15px;
        }
        .product-info p.description {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }
        .product-info p.price {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 25px;
        }
        .btn-add-cart {
            background-color: #ff3f6c;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn-add-cart:hover {
            background-color: #e03259;
        }
    </style>
</head>
<body>
    <div class="product-details">
        <div class="product-image">
            <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
        </div>
        <div class="product-info">
            <h2><%= product.getName() %></h2>
            <p class="price">₹<%= product.getPrice() %></p>
            <p class="description"><%= product.getDescription() != null ? product.getDescription() : "No description available." %></p>
            <form action="CartServlet" method="post">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                Quantity: <input type="number" name="quantity" value="1" min="1" style="width: 60px; margin-right: 15px;">
                <button type="submit" class="btn-add-cart">Add to Cart</button>
            </form>
        </div>
    </div>
</body>
</html>
