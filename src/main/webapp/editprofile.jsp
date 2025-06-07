<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    // Assuming user ID is stored in session after login
    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = "", email = "", phone = "", password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping", "root", "yourpassword");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id = ?");
        ps.setString(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            password = rs.getString("password");
        }
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .form-container {
            width: 400px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }
        input[type=text], input[type=email], input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        input[type=submit] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Your Profile</h2>
    <form action="updateprofile.jsp" method="post">
        <input type="hidden" name="id" value="<%= userId %>"/>
        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required/>
        <label>Email:</label>
        <input type="email" name="email" value="<%= email %>" required/>
        <label>Phone:</label>
        <input type="text" name="phone" value="<%= phone %>" required/>
        <label>Password:</label>
        <input type="password" name="password" value="<%= password %>" required/>
        <input type="submit" value="Update Profile"/>
    </form>
</div>

</body>
</html>
