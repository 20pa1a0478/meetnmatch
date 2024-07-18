<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet-n-Match - Find Your Perfect Partner</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        .header {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #1dbf73;
        }
        .nav-links a {
            color: #333;
            text-decoration: none;
            margin-left: 20px;
        }
        .hero {
            background-image: url('https://images.unsplash.com/photo-1511285560929-80b456fea0bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: #ffffff;
            padding: 100px 0;
            text-align: center;
        }
        .hero-content {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 40px;
            border-radius: 10px;
        }
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        .cta-button {
            display: inline-block;
            background-color: rgba(106, 90, 205);
            color: #ffffff;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .cta-button:hover {
            background-color: rgba(106, 90, 205, 0.7);;
        }
        .why-choose-us {
            padding: 60px 0;
            text-align: center;
        }
        .features {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }
        .feature {
            width: 30%;
        }
        .feature img {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }
        .feature h3 {
            margin-bottom: 10px;
        }

        .why-choose-us .container p{
            text-align: right;
        }
    </style>
</head>
<body>
<header class="header">
    <div class="container nav">
        <div class="logo">Meet-n-Match</div>
        <div class="nav-links">
            <a href="login.jsp">Login</a>
            <a href="register.jsp" class="cta-button">Join Now</a>
        </div>
    </div>
</header>

<section class="hero">
    <div class="container">
        <div class="hero-content">
            <h1>Find Your Perfect Match</h1>
            <p>Join thousands of happy couples who found love on Meet-n-Match</p>
            <a href="register.jsp" class="cta-button">Get Started</a>
        </div>
    </div>
</section>

<section class="why-choose-us">
    <div class="container">
        <h2>Why Choose Us?</h2>
        <div class="features">
            <div class="feature">
                <img src="https://img.icons8.com/color/96/000000/checked-user-male--v1.png" alt="Verified Profiles">
                <h3>Verified Profiles</h3>
                <p>All profiles are thoroughly verified for your safety and peace of mind.</p>
            </div>
            <div class="feature">
                <img src="https://img.icons8.com/color/96/000000/hearts--v1.png" alt="Smart Matching">
                <h3>Smart Matching</h3>
                <p>Our advanced algorithm suggests compatible matches based on your preferences.</p>
            </div>
            <div class="feature">
                <img src="https://img.icons8.com/color/96/000000/online-support.png" alt="24/7 Support">
                <h3>24/7 Support</h3>
                <p>Our dedicated team is always here to assist you on your journey to love.</p>
            </div>
        </div>
        <p>@Gupta</p>
    </div>

</section>
</body>
</html>