<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.meetnmatch.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet-n-Match - Discover Your Perfect Match</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F0F2F5;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #283E4A;
            padding: 1rem 0;
            color: white;
        }
        header div {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
        }
        header form button {
            background-color: #4a148c;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            cursor: pointer;
        }
        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        form {
            background-color: white;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
        }
        form input {
            flex: 1;
            padding: 0.5rem;
        }
        form button {
            background-color: #4a148c;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
        }
        .profile-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }
        .profile-card-header {
            background-color: slateblue;
            color: white;
            padding: 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile-card-header h3 {
            margin: 0;
            font-size: 1.2rem;
        }
        .profile-card-header span {
            background-color: #6C63FF;
            color: white;
            padding: 0.2rem 0.5rem;
            border-radius: 20px;
            font-size: 0.8rem;
        }
        .profile-card-body {
            padding: 1rem;
            flex-grow: 1;
        }
        .profile-card-body p {
            margin: 0.5rem 0;
            display: flex;
            align-items: center;
        }
        .profile-card-body p i {
            color: #FF6F61;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
<header>
    <div>
        <h1>Meet-n-Match</h1>
        <form action="logout" method="post">
            <button>Logout</button>
        </form>
    </div>
</header>

<main>
    <form action="dashboard.jsp" method="get">
        <input type="number" name="age" placeholder="Age">
        <input type="text" name="caste" placeholder="Caste">
        <input type="text" name="interests" placeholder="Interests">
        <button type="submit">Find Matches</button>
    </form>

    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 1rem;">
        <%
            if (session == null || session.getAttribute("username") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String username = (String) session.getAttribute("username");
            Connection connection = null;
            PreparedStatement psUser = null;
            PreparedStatement psProfiles = null;
            ResultSet rsUser = null;
            ResultSet rsProfiles = null;

            try {
                connection = DatabaseConnection.initializeDatabase();
                String sqlUser = "SELECT sex FROM people WHERE username = ?";
                psUser = connection.prepareStatement(sqlUser);
                psUser.setString(1, username);
                rsUser = psUser.executeQuery();

                if (rsUser.next()) {
                    String userSex = rsUser.getString("sex");
                    String oppositeSex = userSex.equalsIgnoreCase("male") ? "female" : "male";

                    String age = request.getParameter("age");
                    String caste = request.getParameter("caste");
                    String interests = request.getParameter("interests");

                    StringBuilder sqlProfiles = new StringBuilder("SELECT * FROM people WHERE sex = ?");
                    if (age != null && !age.isEmpty()) sqlProfiles.append(" AND age = ?");
                    if (caste != null && !caste.isEmpty()) sqlProfiles.append(" AND caste LIKE ?");
                    if (interests != null && !interests.isEmpty()) sqlProfiles.append(" AND likes LIKE ?");

                    psProfiles = connection.prepareStatement(sqlProfiles.toString());
                    psProfiles.setString(1, oppositeSex);

                    int paramIndex = 2;
                    if (age != null && !age.isEmpty()) psProfiles.setInt(paramIndex++, Integer.parseInt(age));
                    if (caste != null && !caste.isEmpty()) psProfiles.setString(paramIndex++, "%" + caste + "%");
                    if (interests != null && !interests.isEmpty()) psProfiles.setString(paramIndex++, "%" + interests + "%");

                    rsProfiles = psProfiles.executeQuery();

                    boolean profilesFound = false;
                    while (rsProfiles.next()) {
                        profilesFound = true;
                        String profileName = rsProfiles.getString("name");
                        int profileAge = rsProfiles.getInt("age");
                        String profileCaste = rsProfiles.getString("caste");
                        String profileInterests = rsProfiles.getString("likes");
                        String profileGender = rsProfiles.getString("sex");
        %>
        <div class="profile-card">
            <div class="profile-card-header">
                <h3>
                    <%= profileName %>
                    <i class="fas fa-star" style="color: gold; margin-left: 0.5rem;" title="Verified Profile"></i>
                </h3>
            </div>
            <div class="profile-card-body">
                <p><i class="fas fa-venus-mars"></i> <%= profileGender %></p>
                <p><i class="fas fa-birthday-cake"></i> <%= profileAge %> years old</p>
                <p><i class="fas fa-users"></i> <%= profileCaste %></p>
                <p><i class="fas fa-heart"></i> <%= profileInterests %></p>
            </div>
        </div>
        <%
            }
            if (!profilesFound) {
        %>
        <div style="background-color: white; border-radius: 10px; padding: 1rem; grid-column: 1 / -1;">
            <p style="text-align: center; color: #666;">No matches found. Try adjusting your search criteria.</p>
        </div>
        <%
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        %>
        <div style="background-color: white; border-radius: 10px; padding: 1rem; grid-column: 1 / -1;">
            <p style="text-align: center; color: #666;">An error occurred. Please try again later.</p>
        </div>
        <%
            } finally {
                if (rsUser != null) try { rsUser.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (psUser != null) try { psUser.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (rsProfiles != null) try { rsProfiles.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (psProfiles != null) try { psProfiles.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</main>
</body>
</html>
