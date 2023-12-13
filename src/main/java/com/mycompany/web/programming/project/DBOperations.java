/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.mycompany.web.programming.project;

import com.mycompany.web.programming.project.DBConnection;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;

/**
 *
 * @author iscie
 */

public class DBOperations {
    public static ResultSet executeQuery(String sql) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            return resultSet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } 
    }
    
    public static boolean userIdMatches(int userId) throws SQLException {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT COUNT(*) FROM kullanicilar WHERE urunKullanici_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        }
        return false;
    }
    
    public static boolean isUserNickExists(String userNick) throws SQLException {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT COUNT(*) FROM kullanicilar WHERE kullaniciNick = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userNick);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        }
        return false;
    }
    
    public static boolean isEmailExists(String email) throws SQLException {
        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT COUNT(*) FROM kullanicilar WHERE kullaniciEposta = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        }
        return false;
    }
    
    public static boolean validateUser(String userEmail, String userPassword) throws SQLException {
        String sql = "SELECT * FROM kullanicilar WHERE kullaniciEposta = ? AND kullaniciSifre = ?";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userEmail);
            statement.setString(2, userPassword);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        }
    }
    
    public static int getUserId(String userEmail) throws SQLException {
        int userId = 0;
        String sql = "SELECT urunKullanici_id FROM kullanicilar WHERE kullaniciEposta = ?";
        
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getInt("urunKullanici_id");
            }
        }

        return userId;
    }
    
    public static String getUserNick(String userEmail) throws SQLException {
        String userNick = "";
        String sql = "SELECT kullaniciNick FROM kullanicilar WHERE kullaniciEposta = ?";
        
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userEmail);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                userNick = resultSet.getString("kullaniciNick");
            }
        }

        return userNick;
    }
    
    public static int getAllProduct(String sql) throws SQLException {
        int totalProduct = 0;

        try (ResultSet resultSet = executeQuery(sql)) {
            if (resultSet.next()) {
                totalProduct = resultSet.getInt("total");
            }
        }
        
        return totalProduct;
    }
    
    public static int getTotalProduct() throws SQLException {
        int totalProduct = 0;
        String sql = "SELECT COUNT(*) as total FROM urunler";

        try (ResultSet resultSet = executeQuery(sql)) {
            if (resultSet.next()) {
                totalProduct = resultSet.getInt("total");
            }
        }
        
        return totalProduct;
    }
    
    public static int getTotalQueryProduct(String query) throws SQLException {
        int totalProduct = 0;
        String sql = query.replace("*", "COUNT(*)");
        sql = sql.substring(0, sql.length() - 10);
        

        try (ResultSet resultSet = executeQuery(sql)) {
            if (resultSet.next()) {
                totalProduct = resultSet.getInt(1);
            }
        }

        return totalProduct;
    }
    
    public static int getTotalCategoryProduct(String query) throws SQLException {
        int totalProduct = 0;
        String sql = query.replace("u.*", "COUNT(*)");
        sql = sql.substring(0, sql.length() - 10);
        

        try (ResultSet resultSet = executeQuery(sql)) {
            if (resultSet.next()) {
                totalProduct = resultSet.getInt(1);
            }
        }

        return totalProduct;
    }
}
