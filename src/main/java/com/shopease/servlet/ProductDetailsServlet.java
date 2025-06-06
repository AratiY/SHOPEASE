package com.shopease.servlet;

import com.shopease.dao.ProductDAO;
import com.shopease.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/productDetails")
public class ProductDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        ProductDAO dao = null;
		try {
			dao = new ProductDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Product product = dao.getProductById(id);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("productDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect("home.jsp");
        }
    }
}

