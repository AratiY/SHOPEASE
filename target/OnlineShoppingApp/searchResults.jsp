<%@ page import="java.util.List" %>
<%@ page import="com.shopease.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

	String query = (String) request.getAttribute("searchQuery");
    List<Product> products = (List<Product>) request.getAttribute("searchResults");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results | ShopEase</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .search-heading {
            font-size: 20px;
            font-weight: 500;
            margin: 20px 40px;
            color: #333;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
            padding: 20px 40px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
            position: relative;
            cursor: pointer;
        }

        .product-card:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .product-card img {
            width: 100%;
            height: 260px;
            object-fit: cover;
        }

        .product-info {
            padding: 15px;
            text-align: left;
        }

        .product-info h4 {
            font-size: 16px;
            margin: 0 0 5px;
            color: #212121;
        }

        .product-info p {
            font-size: 14px;
            color: #757575;
            margin: 0;
        }

        .add-to-cart-form {
/*             display: none; */
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
        }

/*         .product-card:hover .add-to-cart-form { */
/*             display: block; */
/*         } */

        .add-btn {
            background-color: #ff3e6c;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #e5325c;
        }

        .no-results {
            text-align: center;
            padding: 50px;
            font-size: 18px;
            color: #999;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />


    <div class="search-heading">Search results for: <%= query %></div>

    <div class="product-grid">
        <%
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <div class="product-card">
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                <div class="product-info">
                    <h4><%= product.getName() %></h4>
                    <p>₹ <%= product.getPrice() %></p>
                </div><br><br>
                <form action="CartServlet" method="post" class="add-to-cart-form">
                
                 <input type="hidden" name="productId" value="<%= product.getId() %>">
                    Quantity: <input type="number" name="quantity" value="1" min="1" style="width: 60px; margin-right: 15px;">
                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                    
                    <button type="submit" class="add-btn">Add to Cart</button>
                </form>
            </div>
        <%
                }
            } else {
        %>
            <div class="no-results">No products found.</div>
        <%
            }
        %>
    </div>

    <jsp:include page="footer.jsp"/>
    
    <script>
    var loggedIn = <%= session.getAttribute("loggedInUser") != null %>;
    
    document.querySelectorAll('.add-to-cart-form').forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!loggedIn) {
                e.preventDefault();
                alert('Please login to add items to cart.');
                window.location.href = 'login.jsp';
            }
        });
    });
    </script>

    
</body>
</html>
