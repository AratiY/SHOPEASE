<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.shopease.model.Product, com.shopease.dao.WishlistDAO" %>
<%
    // Check if user is logged in
    Object user = session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get wishlist products for the logged-in user
    int userId = (Integer) session.getAttribute("userId");
    WishlistDAO wishlistDAO = new WishlistDAO();
    List<Product> wishlist = wishlistDAO.getWishlistByUserId(userId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Wishlist - ShopEase</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
        }

        header {
            background-color: #fff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            color: #ff3f6c;
            margin: 0;
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
            padding: 30px 40px 10px;
        }

        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
            padding: 20px 40px;
        }

        .wishlist-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
            padding: 15px;
            transition: 0.3s;
        }

        .wishlist-card:hover {
            transform: translateY(-5px);
        }

        .wishlist-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 8px;
        }

        .wishlist-card h3 {
            font-size: 18px;
            margin: 10px 0 5px;
        }

        .wishlist-card p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        .actions {
            margin-top: 10px;
        }

        .actions form {
            display: inline-block;
        }

        .actions button {
            padding: 8px 15px;
            border: none;
            background-color: #ff3f6c;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 5px;
        }

        .actions button:hover {
            background-color: #e6345a;
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
            <a href="wishlist.jsp">Wishlist</a>
            <a href="profile.jsp">Profile</a>
        </nav>
    </header>

    <h2 class="section-title">Your Wishlist</h2>

    <div class="wishlist-grid">
        <%
            if (wishlist.isEmpty()) {
        %>
            <p style="padding-left: 40px;">Your wishlist is empty.</p>
        <%
            } else {
                for (Product p : wishlist) {
        %>
        <div class="wishlist-card">
            <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>">
            <h3><%= p.getName() %></h3>
            <p>₹<%= p.getPrice() %></p>
            <p><%= p.getCategory() %></p>
            <div class="actions">
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= p.getId() %>">
                    <button type="submit">Add to Cart</button>
                </form>
                <form action="RemoveFromWishlistServlet" method="post">
                    <input type="hidden" name="productId" value="<%= p.getId() %>">
                    <button type="submit">Remove</button>
                </form>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
