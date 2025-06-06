
package com.shopease.dao;

import java.sql.*;
import java.util.*;
import com.shopease.model.Product;
//import com.shopease.util.DBConnection;
import com.shopease.util.DBUtil;

public class WishlistDAO {

    // Fetch wishlist products for a given user
    public List<Product> getWishlistByUserId(int userId) throws Exception {
        List<Product> wishlist = new ArrayList<>();

        String sql = "SELECT p.id, p.name, p.description, p.price, p.image_url, p.category " +
                     "FROM wishlist w JOIN products p ON w.product_id = p.id WHERE w.user_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));
                p.setCategory(rs.getString("category"));

                wishlist.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return wishlist;
    }

    // Add a product to the user's wishlist
    public boolean addToWishlist(int userId, int productId) throws Exception {
        String sql = "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Remove a product from the user's wishlist
    public boolean removeFromWishlist(int userId, int productId) throws Exception {
        String sql = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Check if a product already exists in the wishlist
    public boolean isInWishlist(int userId, int productId) throws Exception {
        String sql = "SELECT * FROM wishlist WHERE user_id = ? AND product_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}

