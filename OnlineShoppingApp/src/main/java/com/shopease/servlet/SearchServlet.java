package com.shopease.servlet;

import com.shopease.dao.ProductDAO;
import com.shopease.model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() {
        try {
			productDAO = new ProductDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Ensure DAO is properly configured
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        List<Product> resultList = productDAO.searchProducts(query);

        request.setAttribute("searchResults", resultList);
        request.setAttribute("searchQuery", query);
        RequestDispatcher dispatcher = request.getRequestDispatcher("searchResults.jsp");
        dispatcher.forward(request, response);
    }
}
