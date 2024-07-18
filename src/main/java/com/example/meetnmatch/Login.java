package com.example.meetnmatch;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/login")
public class Login extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(Login.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            connection = DatabaseConnection.initializeDatabase();


            String sql = "SELECT * FROM people WHERE username = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);


            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                LOGGER.log(Level.INFO, "User " + username + " logged in successfully.");


                HttpSession session = request.getSession();
                session.setAttribute("username", username);


                response.sendRedirect("dashboard.jsp");
            } else {

                LOGGER.log(Level.WARNING, "Login attempt failed for user: " + username);


                response.sendRedirect("login.jsp?error=Invalid username or password");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error connecting to database", e);
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Error loading database driver", e);
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            // Close resources (connection, statements, result sets)
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    LOGGER.log(Level.WARNING, "Error closing result set", e);
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    LOGGER.log(Level.WARNING, "Error closing prepared statement", e);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    LOGGER.log(Level.WARNING, "Error closing connection", e);
                }
            }
        }
    }
}
