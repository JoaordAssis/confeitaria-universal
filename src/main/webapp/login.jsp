<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.confeitaria.DAO.ProdutoDAO" %>
<%@ page import="com.confeitaria.model.Admin" %>

<%
    // Cria uma instância do ProdutoDAO
    ProdutoDAO produtoDAO = new ProdutoDAO();

    // Recupera o nome do administrador da sessão
    String adminNome = (session != null && session.getAttribute("adminNome") != null)
                        ? (String) session.getAttribute("adminNome")
                        : "Admin"; // Valor padrão se o nome não estiver na sessão
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Painel do Administrador</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Reset básico */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #2c3e50;
        }

        .login-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .login-container input:focus {
            border-color: #2c3e50;
            outline: none;
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            background-color: #2c3e50;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-container button:hover {
            background-color: #34495e;
        }

        .error-message {
            color: #dc3545;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }

        .login-container p {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .login-container a {
            color: #2c3e50;
            text-decoration: none;
            font-weight: 500;
        }

        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login - Painel do Administrador</h2>
        
        <!-- Mensagem de erro -->
        <div id="error-message" class="error-message"></div>

        <!-- Formulário de Login -->
        <form action="${pageContext.request.contextPath}/login" method="POST">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <button type="submit">Entrar</button>
        </form>

        <!-- Link para recuperação de senha (opcional) -->
        <p>Esqueceu sua senha? <a href="#">Clique aqui</a></p>
    </div>

    <script>
        // Verifica se há um erro na URL e exibe a mensagem correspondente
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');

        if (error === 'invalido') {
            document.getElementById('error-message').textContent = 'Email ou senha incorretos. Tente novamente.';
        } else if (error === 'inativo') {
            document.getElementById('error-message').textContent = 'Este login está desativado e não pode acessar o sistema.';
        }
    </script>
</body>
</html>