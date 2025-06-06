package com.shopease.servlet;

import com.shopease.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.shopease.dao.*;


import java.io.IOException;
import java.util.List;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        if (cart == null || cart.isEmpty() || user == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pincode = request.getParameter("pincode");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        double total = 0;
        for (CartItem item : cart) {
            total += item.getTotalPrice();
        }

        OrderDAO dao = new OrderDAO();
        boolean success = dao.placeOrder(user.getId(), name, phone, pincode, address, city, state, total, cart);

        if (success) {
            session.removeAttribute("cart");
            response.sendRedirect("orderSuccess.jsp");
        } else {
            response.sendRedirect("checkout.jsp?error=true");
        }
    }
}
