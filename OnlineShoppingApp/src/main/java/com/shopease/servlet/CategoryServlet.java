package com.shopease.servlet;

import com.shopease.dao.CategoryDAO;
import com.shopease.model.Category;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    CategoryDAO dao = new CategoryDAO();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("categoryName");
        String img = req.getParameter("categoryImage");
        String deleteId = req.getParameter("deleteId");

        CategoryDAO dao = new CategoryDAO();

        if (deleteId != null) {
            dao.deleteCategory(Integer.parseInt(deleteId));
        } else if (name != null && img != null) {
            Category c = new Category();
            c.setName(name);
            c.setImageUrl(img);
            dao.addCategory(c);
        }

        res.sendRedirect("manageCategories.jsp");
    }

}
