<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.shopease.model.Category,com.shopease.dao.CategoryDAO,java.sql.*" %>
<%
    Connection conn = (Connection) application.getAttribute("DBConnection");
    if (conn == null) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping", "root", "tiger");
        application.setAttribute("DBConnection", conn);
    }

    CategoryDAO dao = new CategoryDAO();
    List<Category> categories = dao.getAllCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase - Online Shopping</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        header {
            background-color: #ffffff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
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

        .search-bar {
            margin: 30px auto;
            width: 60%;
            display: flex;
        }

        .search-bar input {
            flex: 1;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px;
            width:800px;
        }

        .search-bar button {
            padding: 12px 20px;
            border: none;
            background-color: #ff3f6c;
            color: white;
            font-weight: bold;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }

        .banner {
            width: 100%;
            height: 300px;
            background-color: #F2C6B9;
            margin-bottom: 40px;
        }

        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 0 40px 40px;
        }

        .category {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .category:hover {
            transform: translateY(-5px);
        }

        .category img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .category p {
            padding: 15px;
            font-size: 18px;
            font-weight: 500;
            color: #333;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #777;
        }
        
        .carousel {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 500px;
    margin-bottom: 40px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.carousel-track {
    display: flex;
    width: 400%;
    transition: transform 0.5s ease-in-out;
}

.carousel-slide {
    flex: 1 0 100%;
}

.carousel-slide img {
   width: 1500px;
    height: 500px;
    object-fit: cover;
}

.carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 24px;
    background-color: rgba(0, 0, 0, 0.4);
    color: white;
    border: none;
    padding: 8px 14px;
    cursor: pointer;
    z-index: 100;
    border-radius: 4px;
}

.carousel-btn.prev {
    left: 10px;
}

.carousel-btn.next {
    right: 10px;
}
        
.categories a.category {
    text-decoration: none; 
    color: inherit;      
    display: block;       
}

        
    </style>
</head>
<body>

<header>

    <div class="logo">ShopEase</div>
    <nav>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Sign Up</a>
      
    </nav>
</header>

<div class="search-bar">
    <form action="SearchServlet" method="get">
        <input type="text" name="query" placeholder="Search for products, brands and more" required>
        <button type="submit">Search</button>
    </form>
</div>

<!-- Carousel Start -->
<div class="carousel">
    <div class="carousel-track">
    	<div class="carousel-slide">
            <img src="images/Fashion Online Ads - Made with PosterMyWall.jpg" alt="New Arrival 1">
        </div>
        <div class="carousel-slide">
            <img src="images/costmetic services - Made with PosterMyWall.jpg" alt="Discounted Product 1">
        </div>
        <div class="carousel-slide">
            <img src="images/shoe flyer design - Made with PosterMyWall.jpg" alt="Discounted Product 2">
        </div>
        <div class="carousel-slide">
            <img src="images/Online Fashion Store - Made with PosterMyWall.jpg" alt="New Arrival 2">
        </div>
    </div>
    <button class="carousel-btn prev">&#10094;</button>
    <button class="carousel-btn next">&#10095;</button>
</div>
<!-- Carousel End -->


<section class="categories">
    <%
        for (Category c : categories) {
    %>
        <div class="category">
          <a href="viewCategory?type=<%= java.net.URLEncoder.encode(c.getName(), "UTF-8") %>" class="category">
    <img src="<%= c.getImageUrl() %>" alt="<%= c.getName() %>">
    <p><%= c.getName() %></p>
</a>

        </div>
    
    <%
        }
    %>
</section>


<footer>
    &copy; 2025 ShopEase. All rights reserved.
    <%@ include file="footer.jsp" %>
    
</footer>


<script>
    const track = document.querySelector('.carousel-track');
    const slides = document.querySelectorAll('.carousel-slide');
    const prevBtn = document.querySelector('.carousel-btn.prev');
    const nextBtn = document.querySelector('.carousel-btn.next');
    let currentIndex = 0;

    function updateCarousel() {
        track.style.transform = 'translateX(-' + currentIndex * 100 + '%)';
    }

    prevBtn.addEventListener('click', () => {
        currentIndex = (currentIndex === 0) ? slides.length - 1 : currentIndex - 1;
        updateCarousel();
    });

    nextBtn.addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % slides.length;
        updateCarousel();
    });

    setInterval(() => {
        nextBtn.click();
    }, 5000); // Auto-slide every 5 seconds
</script>

</body>
</html>
