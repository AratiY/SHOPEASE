package com.shopease.servlet;

import com.shopease.dao.ProductDAO;
import com.shopease.model.Product;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setImageUrl(request.getParameter("imageUrl"));
        product.setCategory(request.getParameter("category"));

        ProductDAO dao = null;
		try {
			dao = new ProductDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if (dao.addProduct(product)) {
            response.sendRedirect("manageProducts.jsp");
        } else {
            response.getWriter().println("Error adding product.");
        }
    }
}
