<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인이 필요합니다</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .message-box {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dee2e6;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        .message-box h1 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333333;
        }
        .message-box p {
            font-size: 16px;
            color: #666666;
        }
        .login-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .login-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h1>로그인이 필요합니다</h1>
        <p>이 페이지를 보려면 로그인이 필요합니다. 로그인 후 다시 시도해주세요.</p>
        <a href="Controller?type=login" class="login-button">로그인 페이지로 이동</a>
    </div>
</body>
</html>