<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <style>
    @import url('https://fonts.googleapis.com/css?family=Rubik:700&display=swap');

    body {
      font-family: 'Rubik', sans-serif;
      font-size: 1rem;
      line-height: 1.5;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0;
      min-height: 100vh;
      background-image: url('images/login1.jpg'); 
      background-size: cover;
      background-position: center;
    }

    .container {
      text-align: center;
      border: 1px solid #b18597;
      padding: 20px;
      border-radius: 0.75em;
      background: rgba(189,244,232,0.3);
      -webkit-backdrop-filter: blur(27px);
      backdrop-filter: blur(27px);
      border: 1px solid rgba(189,244,232,0.15);
      width: 400px;
    }

    .form-group {
      margin-bottom: 15px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }

    .form-group label {
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 8px;
      margin: 0;
      box-sizing: border-box;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    .button-group {
      display: flex;
      gap: 10px;
      margin-top: 20px;
    }

    .button {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      color: white;
      cursor: pointer;
      text-align: center;
      font-size: 14px;
      text-decoration: none;
      width: auto;
      background: #1A5319;
      transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), background 150ms cubic-bezier(0, 0, 0.58, 1);
    }

    .button:hover {
      background: #80AF81;
      transform: translate(0, 0.25em);
    }
    
    .button:hover::before {
      box-shadow: 0 0 0 2px #b18597, 0 0.5em 0 0 #ffe3e2;
      transform: translate3d(0, 0.5em, -1em);
    }
    
    .button:active {
      background: #80AF81;
      transform: translate(0em, 0.75em);
    }

    .button:active::before {
      box-shadow: 0 0 0 2px #b18597, 0 0 #ffe3e2;
      transform: translate3d(0, 0, -1em);
    }

    .forgot-password {
      display: block;
      margin-top: 15px;
      font-size: 12px;
      color: #007bff;
      text-decoration: underline;
    }

    .forgot-password:hover {
      color: #0056b3;
    }

    .error {
      color: red;
      margin-top: 10px;
    }

    .back-button {
      position: absolute;
      top: 20px;
      left: 20px;
      padding: 10px 15px;
      background: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-size: 14px;
      transition: background 0.3s ease;
    }

    .back-button:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>
  <a href="javascript:history.back()" class="back-button">Back</a>
  <div class="container">
    <h2>Login</h2>
    <form action="login" method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="button-group">
        <input type="submit" class="button" value="Login">
      </div>
    </form>
    <% if (request.getAttribute("error") != null) { %>
      <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
    <div class="forgot-password">
      <a href="forget.jsp">Forget username/password?</a>
    </div>
  </div>
</body>
</html>
