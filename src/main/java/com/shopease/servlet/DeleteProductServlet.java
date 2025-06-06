package com.shopease.servlet;

import com.shopease.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO dao = new ProductDAO();
            boolean deleted = dao.deleteProduct(productId);

            if (deleted) {
                response.sendRedirect("manageProducts.jsp?success=deleted");
            } else {
                response.sendRedirect("manageProducts.jsp?error=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageProducts.jsp?error=exception");
        }
    }
}
