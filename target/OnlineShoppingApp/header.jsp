<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header {
            width: 100%;
            background-color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #ff3f6c;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 25px;
            margin-left: 50px;
        }

        .nav-links a {
            text-decoration: none;
            color: #282c3f;
            font-weight: 500;
            font-size: 14px;
            text-transform: uppercase;
            padding: 5px 0;
            border-bottom: 2px solid transparent;
        }

        .nav-links a:hover {
            border-bottom: 2px solid #ff3f6c;
        }

        .search-bar {
            flex: 1;
            margin: 0 40px;
        }

        .search-bar input {
            width: 100%;
            padding: 8px 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .user-section {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .user-section a {
            text-decoration: none;
            color: #282c3f;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .user-section i {
            font-size: 18px;
        }
    </style>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="header">
    <a href="index.jsp" class="logo">ShopEase</a>

    <div class="nav-links">
        <a href="viewCategory?type=Men">Men</a>
        <a href="viewCategory?type=Women">Women</a>
        <a href="viewCategory?type=Kids">Kids</a>
        <a href="viewCategory?type=Home">Home</a>
        <a href="viewCategory?type=Beauty">Beauty</a>
    </div>

    <div class="search-bar">
        <form action="SearchServlet" method="get">
            <input type="text" name="query" placeholder="Search for products, brands and more">
        </form>
    </div>

    <div class="user-section">
        <a href="login.jsp"><i class="fas fa-user"></i> Profile</a>
 
    </div>
</div>

</body>
</html>
