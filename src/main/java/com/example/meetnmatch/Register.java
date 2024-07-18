package com.example.meetnmatch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // **WARNING: Not Hashed!**
        String name = request.getParameter("name");
        String caste = request.getParameter("caste");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String profession = request.getParameter("profession");
        String likes = request.getParameter("likes");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try { // Get database connection
            connection = DatabaseConnection.initializeDatabase();


            String sql = "INSERT INTO people (username, password, name, caste, age, sex, profession, likes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password); // **WARNING: Not Hashed!**
            preparedStatement.setString(3, name);
            preparedStatement.setString(4, caste);
            preparedStatement.setString(5, age);
            preparedStatement.setString(6, sex);
            preparedStatement.setString(7, profession);
            preparedStatement.setString(8, likes);


            preparedStatement.executeUpdate();
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
