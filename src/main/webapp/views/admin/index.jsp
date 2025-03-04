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
    <title>Painel do Administrador</title>
    <link rel="stylesheet" href="style/styles.css">
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
    color: #333;
}

.dashboard {
    display: flex;
    min-height: 100vh;
}

/* Menu Lateral */
.sidebar {
    width: 250px;
    background-color: #2c3e50;
    color: #fff;
    padding: 20px;
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease;
}

.logo {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
}

.logo i {
    font-size: 24px;
    margin-right: 10px;
}

.logo span {
    font-size: 20px;
    font-weight: 500;
}

.menu ul {
    list-style: none;
}

.menu li {
    margin-bottom: 15px;
}

.menu a {
    color: #fff;
    text-decoration: none;
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.menu a:hover {
    background-color: #34495e;
}

.menu a i {
    font-size: 18px;
    margin-right: 10px;
}

.menu a span {
    font-size: 16px;
}

.menu .active a {
    background-color: #34495e;
}

/* Conteúdo Principal */
.content {
    flex: 1;
    padding: 20px;
}

.header {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

.header h1 {
    font-size: 28px;
    font-weight: 500;
    color: #2c3e50;
    margin-left: 20px;
}

.main-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.main-content p {
    font-size: 16px;
    line-height: 1.6;
    color: #555;
}

/* Botão de Toggle do Menu (Mobile) */
.menu-toggle {
    display: none;
    background: none;
    border: none;
    color: #2c3e50;
    font-size: 24px;
    cursor: pointer;
}

/* Responsividade */
@media (max-width: 768px) {
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        height: 100vh;
        transform: translateX(-100%);
        z-index: 1000;
    }

    .sidebar.active {
        transform: translateX(0);
    }

    .menu-toggle {
        display: block;
    }

    .header h1 {
        margin-left: 10px;
    }
}
        /* Estilos básicos para as métricas */
        .metricas {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .metrica {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex: 1 1 calc(33.333% - 40px);
            text-align: center;
        }
        .metrica h3 {
            margin-bottom: 10px;
            font-size: 18px;
            color: #2c3e50;
        }
        .metrica p {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Menu Lateral -->
        <aside class="sidebar" id="sidebar">
            <div class="logo">
                <i class="fas fa-user-cog"></i>
                <span>Admin</span>
            </div>
            <nav class="menu">
                <ul>
                    <li class="active">
                        <a href="views/admin/index.jsp">
                            <i class="fas fa-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/listar-produtos">
                            <i class="fas fa-box"></i>
                            <span>Produtos</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/listar-funcionarios">
                            <i class="fas fa-users"></i>
                            <span>Funcionários</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Sair</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Conteúdo Principal -->
        <main class="content">
            <header class="header">
                <button class="menu-toggle" id="menu-toggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h1>Bem-vindo, <span id="username"><%= adminNome %></span>!</h1>
            </header>
            <section class="main-content">
                <h2>Insights</h2>
                <div class="metricas">
                    <!-- Total de Produtos Cadastrados -->
                    <div class="metrica">
                        <h3>Total de Produtos Cadastrados</h3>
                        <p><%= produtoDAO.contarProdutos() %></p>
                    </div>

                    <!-- Produtos Ativos vs. Inativos -->
                    <div class="metrica">
                        <h3>Produtos Ativos vs. Inativos</h3>
                        <p>Ativos: <%= produtoDAO.contarProdutosPorStatus(1) %></p>
                        <p>Inativos: <%= produtoDAO.contarProdutosPorStatus(0) %></p>
                    </div>

                    <!-- Valor Total em Estoque -->
                    <div class="metrica">
                        <h3>Valor Total em Estoque</h3>
                        <p>R$ <%= produtoDAO.calcularValorTotalEstoque() %></p>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script src="javascript/script.js"></script>
</body>
</html>