<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet-n-Match - Register</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3e5f5;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 80%;
            max-width: 800px;
        }
        .logo {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #4a148c;
            margin-bottom: 20px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .form-group {
            flex: 0 0 48%;
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #4a148c;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #9c27b0;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #4a148c;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #6a1b9a;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            color: #4a148c;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="logo">Meet-n-Match</div>
    <form action="register" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="caste">Caste</label>
                <input type="text" id="caste" name="caste">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required>
            </div>
            <div class="form-group">
                <label for="sex">Sex</label>
                <select id="sex" name="sex" required>
                    <option value="">Select</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="profession">Profession</label>
                <input type="text" id="profession" name="profession">
            </div>
            <div class="form-group">
                <label for="likes">Likes</label>
                <input type="text" id="likes" name="likes">
            </div>
        </div>
        <button type="submit" class="submit-btn">Register</button>
    </form>
    <div class="links">
        <a href="index.jsp">Home</a> | <a href="login.jsp">Login</a>
    </div>
</div>
</body>
</html>