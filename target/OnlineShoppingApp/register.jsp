<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Register - ShopEase</title>
    <link rel="stylesheet" href="../css/style.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .register-container {
            background-color: white;
            padding: 50px 30px 50px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
        }

        .register-container h2 {
            margin-bottom: 30px;
            color: #ff3f6c;
            font-weight: 700;
            text-align: center;
            letter-spacing: 1px;
        }

        .register-container input[type="text"],
        .register-container input[type="email"],
        .register-container input[type="password"],
        .register-container input[type="tel"],
        .register-container textarea {
            width: 90%;
            padding: 12px 15px;
            margin-bottom: 18px;
            border: 1.5px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        .register-container input[type="text"]:focus,
        .register-container input[type="email"]:focus,
        .register-container input[type="password"]:focus,
        .register-container input[type="tel"]:focus,
        .register-container textarea:focus {
            border-color: #ff3f6c;
            outline: none;
        }

        .register-container textarea {
            resize: vertical;
            height: 80px;
        }

        .register-container button {
            width: 100%;
            padding: 14px;
            background-color: #ff3f6c;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 700;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .register-container button:hover {
            background-color: #e6335f;
        }

        .register-container p {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .register-container p a {
            color: #ff3f6c;
            text-decoration: none;
            font-weight: 600;
        }

        .register-container p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Create Your ShopEase Account</h2>
    <form action="Register" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email Address" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="tel" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" title="Enter 10 digit phone number" required />
        <textarea name="address" placeholder="Address" required></textarea>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html>
