package com.shopease.servlet;

import com.shopease.dao.ProductDAO;
import com.shopease.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewCategory")
public class CategoryViewServlet extends HttpServlet {

    private ProductDAO productDAO;

    public CategoryViewServlet() {
        super();
        try {
            productDAO = new ProductDAO(); // Wrap risky code in try-catch
        } catch (Exception e) {
            e.printStackTrace(); // Log the error
            // Optional: fallback or default handling
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String categoryType = request.getParameter("type");
            List<Product> categoryProducts = productDAO.getProductsByCategory(categoryType);
            request.setAttribute("categoryProducts", categoryProducts);
            request.setAttribute("categoryType", categoryType);
            RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong while loading the category.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
