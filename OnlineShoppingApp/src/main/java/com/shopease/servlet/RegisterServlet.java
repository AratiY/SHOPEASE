package com.shopease.servlet;

import java.io.IOException;

import com.shopease.dao.UserDao;
import com.shopease.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User user = new User(name, email, password, "user", phone, address);

        boolean success = userDao.registerUser(user);

        if(success){
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed. Try again.");
        }
    }

}
